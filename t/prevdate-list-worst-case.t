#!/usr/bin/env perl

# prevdate-list-worst-case.t
# Date  : 05 May 2018
# Author: Ankit Pati

use strict;
use warnings;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator qw(worst_case_tests);

use constant {
    SCREEN_WIDTH => 80,
    TEST_WIDTH   => 11,
};

use constant TESTS_PER_LINE => int SCREEN_WIDTH / int TEST_WIDTH;

my %bvalues = (
    d => [   1,   31],
    m => [   1,   12],
    y => [1900, 2025],
);

my @tests = worst_case_tests %bvalues;

for (my $tests_displayed = 0; $tests_displayed != @tests; print "\n") {
    for (
        my $tests_on_this_line = 0;
        $tests_displayed < @tests && $tests_on_this_line < TESTS_PER_LINE;
        ++$tests_displayed, ++$tests_on_this_line
    ) {
        my $test = $tests[$tests_displayed];
        printf "%04d-%02d-%02d ", $test->{y}, $test->{m}, $test->{d};
    }
}

print "\n";

print 'Number of Tests: ', scalar @tests, "\n";

# end of prevdate-list-worst-case.t

__END__
OUTPUT

1900-01-01 1901-01-01 1962-01-01 2024-01-01 2025-01-01 1900-02-01 1901-02-01 
1962-02-01 2024-02-01 2025-02-01 1900-06-01 1901-06-01 1962-06-01 2024-06-01 
2025-06-01 1900-11-01 1901-11-01 1962-11-01 2024-11-01 2025-11-01 1900-12-01 
1901-12-01 1962-12-01 2024-12-01 2025-12-01 1900-01-02 1901-01-02 1962-01-02 
2024-01-02 2025-01-02 1900-02-02 1901-02-02 1962-02-02 2024-02-02 2025-02-02 
1900-06-02 1901-06-02 1962-06-02 2024-06-02 2025-06-02 1900-11-02 1901-11-02 
1962-11-02 2024-11-02 2025-11-02 1900-12-02 1901-12-02 1962-12-02 2024-12-02 
2025-12-02 1900-01-16 1901-01-16 1962-01-16 2024-01-16 2025-01-16 1900-02-16 
1901-02-16 1962-02-16 2024-02-16 2025-02-16 1900-06-16 1901-06-16 1962-06-16 
2024-06-16 2025-06-16 1900-11-16 1901-11-16 1962-11-16 2024-11-16 2025-11-16 
1900-12-16 1901-12-16 1962-12-16 2024-12-16 2025-12-16 1900-01-30 1901-01-30 
1962-01-30 2024-01-30 2025-01-30 1900-02-30 1901-02-30 1962-02-30 2024-02-30 
2025-02-30 1900-06-30 1901-06-30 1962-06-30 2024-06-30 2025-06-30 1900-11-30 
1901-11-30 1962-11-30 2024-11-30 2025-11-30 1900-12-30 1901-12-30 1962-12-30 
2024-12-30 2025-12-30 1900-01-31 1901-01-31 1962-01-31 2024-01-31 2025-01-31 
1900-02-31 1901-02-31 1962-02-31 2024-02-31 2025-02-31 1900-06-31 1901-06-31 
1962-06-31 2024-06-31 2025-06-31 1900-11-31 1901-11-31 1962-11-31 2024-11-31 
2025-11-31 1900-12-31 1901-12-31 1962-12-31 2024-12-31 2025-12-31 

Number of Tests: 125
