#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator 'boundary_value_tests_as_arrayrefs';

my $source = dirname ($0) . '/../src/quad.c';
my $executable;
($executable = $source) =~ s/.c$//;

system qw(cc -o), $executable, $source and die "Could not compile $source!\n";

my $csvfile;
($csvfile = $0) =~ s/.t$/.csv/;
open my $csv, '>', $csvfile or die "Could not open $csvfile!\n";
print $csv "a,b,c,Expected Output,Actual Output,Status\n";

use constant {
    MIN =>   0,
    MAX => 100,
};

my %bvalues = (
    a => [MIN, MAX],
    b => [MIN, MAX],
    c => [MIN, MAX],
);

# total number of tests must be 4*n + 1
plan tests => (4 * scalar keys %bvalues) + 1;

foreach my $tval (boundary_value_tests_as_arrayrefs %bvalues) {
    my ($a, $b, $c) = @$tval;
    my $d = $b*$b - 4*$a*$c;
    my $expected =
        $a ?
            $d > 0 ? 'Real Roots.' :
                $d < 0 ? 'Imaginary Roots.' : 'Equal Roots.'
        : 'Not a Quadratic Equation.';

    run [$executable], \"$a\n$b\n$c\n", '>', \my $log;

    # pick only last line of output
    chomp (my $got = (split /\n/, $log)[-1]);

    my $status =
        is ($got, $expected, 'Nature of roots identified.')
            ? 'Pass' : 'Fail';

    print $csv "$a,$b,$c,$got,$expected,$status\n";
}

close $csv;
