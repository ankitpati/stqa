#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use constant {
    MINIMUM => 0,
    MINPONE => 1,
    NOMINAL => 2,
    MAXMONE => 3,
    MAXIMUM => 4,
};

my %bvalues = (
    a => [0, 100],
    b => [0, 100],
    c => [0, 100],
);

my @tvalues;

while (my ($key, $val) = each %bvalues) {
    my ($min, $max) = @$val;
    $bvalues{$key} = [$min, $min + 1, int (($min + $max) / 2), $max - 1, $max];
}

foreach my $bkey (sort keys %bvalues) {
    # other keys, apart from the one under consideration, take NOMINAL values
    my %oth = map { $_ => $bvalues{$_}[NOMINAL] }
                                                grep !/^$bkey$/, keys %bvalues;

    push @tvalues, { $bkey => $_, %oth }
        foreach @{$bvalues{$bkey}}[MINIMUM, MINPONE, MAXMONE, MAXIMUM];
            # exclude NOMINAL value to avoid duplicates
}

push @tvalues, { map { $_ => $bvalues{$_}[NOMINAL] } keys %bvalues };

foreach my $tval (@tvalues) {
    print "$_ => $tval->{$_} " foreach sort keys %$tval;
    print "\n";
}

done_testing;
