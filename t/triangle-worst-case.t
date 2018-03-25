#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator 'worst_case_tests_as_arrayrefs';

my $source = dirname ($0) . '/../src/triangle.c';
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
    x => [MIN, MAX],
    y => [MIN, MAX],
    z => [MIN, MAX],
);

# total number of tests must be 5**n
plan tests => 5 ** scalar keys %bvalues;

foreach my $tval (worst_case_tests_as_arrayrefs %bvalues) {
    my ($x, $y, $z) = @$tval;
    my $expected =
        $x < MIN || $x > MAX || $y < MIN || $y > MAX || $z < MIN || $z > MAX ?
            'Input out of range.' :
                !$x || !$y || !$z || $x + $y <= $z ||
                $z + $x <= $y || $y + $z <= $x ?
                    'Not a Triangle.' :
                        $x == $y && $y == $z ? 'Equilateral Triangle.' :
                            $x == $y || $y == $z || $z == $x ?
                                                        'Isosceles Triangle.' :
                                'Scalene Triangle.';

    run [$executable], \"$x\n$y\n$z\n", '>', \my $log;

    # pick only last line of output
    chomp (my $got = (split /\n/, $log)[-1]);

    my $status =
        is ($got, $expected, 'Nature of triangle identified.')
            ? 'Pass' : 'Fail';

    print $csv "$x,$y,$z,$got,$expected,$status\n";
}

close $csv;
