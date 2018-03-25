#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator 'boundary_value_tests';

my %bvalues = (
    a => [0, 100],
    b => [0, 100],
    c => [0, 100],
);

foreach my $tval (boundary_value_tests %bvalues) {
    print "$_ => $tval->{$_} " foreach sort keys %$tval;
    print "\n";
}

done_testing;
