#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator 'robustness_tests_as_arrayrefs';

my $source = dirname ($0) . '/../src/triangle.c';
my $executable;
($executable = $source) =~ s/.c$//;

system qw(cc -o), $executable, $source and die "Could not compile $source!\n";

my $csvfile;
($csvfile = $0) =~ s/.t$/.csv/;
open my $csv, '>', $csvfile or die "Could not open $csvfile!\n";
print $csv "a,b,c,Expected Output,Actual Output,Status\n";

my %bvalues = (
    x => [0, 100],
    y => [0, 100],
    z => [0, 100],
);

# total number of tests must be 6*n + 1
plan tests => (6 * scalar keys %bvalues) + 1;

foreach my $tval (robustness_tests_as_arrayrefs %bvalues) {
    my ($x, $y, $z) = @$tval;
    my $expected =
        !$x || !$y || !$z || $x + $y <= $z || $z + $x <= $y || $y + $z <= $x ?
            'Not a' :
                $x == $y && $y == $z ? 'Equilateral' :
                    $x == $y || $y == $z || $z == $x ? 'Isosceles' :
                        'Scalene';
    $expected .= ' Triangle.';

    run [$executable], \"$x\n$y\n$z\n", '>', \my $log;

    # pick only last line of output
    chomp (my $got = (split /\n/, $log)[-1]);

    my $status =
        is ($got, $expected, 'Nature of triangle identified.')
            ? 'Pass' : 'Fail';

    print $csv "$x,$y,$z,$got,$expected,$status\n";
}

close $csv;
