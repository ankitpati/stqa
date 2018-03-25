#!/usr/bin/env perl

# triangle-worst-case.t
# Date  : 25 March 2018
# Author: Ankit Pati

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator qw(worst_case_tests tests_as_arrayrefs);

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

foreach my $tval (tests_as_arrayrefs worst_case_tests %bvalues) {
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

# end of triangle-worst-case.t

__END__
OUTPUT

1..125
ok 1 - Nature of triangle identified.
ok 2 - Nature of triangle identified.
ok 3 - Nature of triangle identified.
ok 4 - Nature of triangle identified.
ok 5 - Nature of triangle identified.
ok 6 - Nature of triangle identified.
ok 7 - Nature of triangle identified.
ok 8 - Nature of triangle identified.
ok 9 - Nature of triangle identified.
ok 10 - Nature of triangle identified.
ok 11 - Nature of triangle identified.
ok 12 - Nature of triangle identified.
ok 13 - Nature of triangle identified.
ok 14 - Nature of triangle identified.
ok 15 - Nature of triangle identified.
ok 16 - Nature of triangle identified.
ok 17 - Nature of triangle identified.
ok 18 - Nature of triangle identified.
ok 19 - Nature of triangle identified.
ok 20 - Nature of triangle identified.
ok 21 - Nature of triangle identified.
ok 22 - Nature of triangle identified.
ok 23 - Nature of triangle identified.
ok 24 - Nature of triangle identified.
ok 25 - Nature of triangle identified.
ok 26 - Nature of triangle identified.
ok 27 - Nature of triangle identified.
ok 28 - Nature of triangle identified.
ok 29 - Nature of triangle identified.
ok 30 - Nature of triangle identified.
ok 31 - Nature of triangle identified.
ok 32 - Nature of triangle identified.
ok 33 - Nature of triangle identified.
ok 34 - Nature of triangle identified.
ok 35 - Nature of triangle identified.
ok 36 - Nature of triangle identified.
ok 37 - Nature of triangle identified.
ok 38 - Nature of triangle identified.
ok 39 - Nature of triangle identified.
ok 40 - Nature of triangle identified.
ok 41 - Nature of triangle identified.
ok 42 - Nature of triangle identified.
ok 43 - Nature of triangle identified.
ok 44 - Nature of triangle identified.
ok 45 - Nature of triangle identified.
ok 46 - Nature of triangle identified.
ok 47 - Nature of triangle identified.
ok 48 - Nature of triangle identified.
ok 49 - Nature of triangle identified.
ok 50 - Nature of triangle identified.
ok 51 - Nature of triangle identified.
ok 52 - Nature of triangle identified.
ok 53 - Nature of triangle identified.
ok 54 - Nature of triangle identified.
ok 55 - Nature of triangle identified.
ok 56 - Nature of triangle identified.
ok 57 - Nature of triangle identified.
ok 58 - Nature of triangle identified.
ok 59 - Nature of triangle identified.
ok 60 - Nature of triangle identified.
ok 61 - Nature of triangle identified.
ok 62 - Nature of triangle identified.
ok 63 - Nature of triangle identified.
ok 64 - Nature of triangle identified.
ok 65 - Nature of triangle identified.
ok 66 - Nature of triangle identified.
ok 67 - Nature of triangle identified.
ok 68 - Nature of triangle identified.
ok 69 - Nature of triangle identified.
ok 70 - Nature of triangle identified.
ok 71 - Nature of triangle identified.
ok 72 - Nature of triangle identified.
ok 73 - Nature of triangle identified.
ok 74 - Nature of triangle identified.
ok 75 - Nature of triangle identified.
ok 76 - Nature of triangle identified.
ok 77 - Nature of triangle identified.
ok 78 - Nature of triangle identified.
ok 79 - Nature of triangle identified.
ok 80 - Nature of triangle identified.
ok 81 - Nature of triangle identified.
ok 82 - Nature of triangle identified.
ok 83 - Nature of triangle identified.
ok 84 - Nature of triangle identified.
ok 85 - Nature of triangle identified.
ok 86 - Nature of triangle identified.
ok 87 - Nature of triangle identified.
ok 88 - Nature of triangle identified.
ok 89 - Nature of triangle identified.
ok 90 - Nature of triangle identified.
ok 91 - Nature of triangle identified.
ok 92 - Nature of triangle identified.
ok 93 - Nature of triangle identified.
ok 94 - Nature of triangle identified.
ok 95 - Nature of triangle identified.
ok 96 - Nature of triangle identified.
ok 97 - Nature of triangle identified.
ok 98 - Nature of triangle identified.
ok 99 - Nature of triangle identified.
ok 100 - Nature of triangle identified.
ok 101 - Nature of triangle identified.
ok 102 - Nature of triangle identified.
ok 103 - Nature of triangle identified.
ok 104 - Nature of triangle identified.
ok 105 - Nature of triangle identified.
ok 106 - Nature of triangle identified.
ok 107 - Nature of triangle identified.
ok 108 - Nature of triangle identified.
ok 109 - Nature of triangle identified.
ok 110 - Nature of triangle identified.
ok 111 - Nature of triangle identified.
ok 112 - Nature of triangle identified.
ok 113 - Nature of triangle identified.
ok 114 - Nature of triangle identified.
ok 115 - Nature of triangle identified.
ok 116 - Nature of triangle identified.
ok 117 - Nature of triangle identified.
ok 118 - Nature of triangle identified.
ok 119 - Nature of triangle identified.
ok 120 - Nature of triangle identified.
ok 121 - Nature of triangle identified.
ok 122 - Nature of triangle identified.
ok 123 - Nature of triangle identified.
ok 124 - Nature of triangle identified.
ok 125 - Nature of triangle identified.
