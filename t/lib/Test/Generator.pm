#!/usr/bin/env perl

package Test::Generator;

use strict;
use warnings;

use Exporter 'import';

our @EXPORT_OK = qw(
    boundary_value_tests boundary_value_tests_as_arrayrefs
    robustness_tests robustness_tests_as_arrayrefs
);

sub boundary_value_tests {
    my %bvalues = @_;
    my @tvalues;

    my %c = (
        minimum => 0,
        minpone => 1,
        nominal => 2,
        maxmone => 3,
        maximum => 4,
    );  # constant values for indexing arrays

    while (my ($key, $val) = each %bvalues) {
        my ($min, $max) = @$val;
        $bvalues{$key} = [$min, $min+1, int (($min + $max) / 2), $max-1, $max];
    }

    foreach my $bkey (sort keys %bvalues) {
        # other keys, apart from $bkey, take NOMINAL values
        my %oth = map { $_ => $bvalues{$_}[$c{nominal}] }
                                                grep !/^$bkey$/, keys %bvalues;

        push @tvalues, { $bkey => $_, %oth }
            foreach @{$bvalues{$bkey}}[
                $c{minimum}, $c{minpone}, $c{maxmone}, $c{maximum}
            ];
                # exclude NOMINAL value to avoid duplicates
    }

    # add NOMINAL values for all variables to make up for the exclusions
    push @tvalues, { map { $_ => $bvalues{$_}[$c{nominal}] } keys %bvalues };

    return @tvalues;
}

sub boundary_value_tests_as_arrayrefs {
    my @tvalues;

    foreach my $tval (boundary_value_tests @_) {
        my @tcase;
        push @tcase, $tval->{$_} foreach sort keys %$tval;
        push @tvalues, \@tcase;
    }

    return @tvalues;
}

sub robustness_tests {
    my %bvalues = @_;
    my @tvalues;

    my %c = (
        minmone => 0,
        minimum => 1,
        minpone => 2,
        nominal => 3,
        maxmone => 4,
        maximum => 5,
        maxpone => 6,
    );  # constant values for indexing arrays

    while (my ($key, $val) = each %bvalues) {
        my ($min, $max) = @$val;
        $bvalues{$key} = [
            $min-1, $min, $min+1, int (($min + $max) / 2), $max-1, $max, $max+1
        ];
    }

    foreach my $bkey (sort keys %bvalues) {
        # other keys, apart from $bkey, take NOMINAL values
        my %oth = map { $_ => $bvalues{$_}[$c{nominal}] }
                                                grep !/^$bkey$/, keys %bvalues;

        push @tvalues, { $bkey => $_, %oth }
            foreach @{$bvalues{$bkey}}[
                $c{minmone}, $c{minimum}, $c{minpone},
                $c{maxmone}, $c{maximum}, $c{maxpone}
            ];  # exclude NOMINAL value to avoid duplicates
    }

    # add NOMINAL values for all variables to make up for the exclusions
    push @tvalues, { map { $_ => $bvalues{$_}[$c{nominal}] } keys %bvalues };

    return @tvalues;
}

sub robustness_tests_as_arrayrefs {
    my @tvalues;

    foreach my $tval (robustness_tests @_) {
        my @tcase;
        push @tcase, $tval->{$_} foreach sort keys %$tval;
        push @tvalues, \@tcase;
    }

    return @tvalues;
}

1;
