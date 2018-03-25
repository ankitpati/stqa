#!/usr/bin/env perl

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator 'boundary_value_tests_as_arrayrefs';

my %bvalues = (
    a => [0, 100],
    b => [0, 100],
    c => [0, 100],
);

foreach my $tval (boundary_value_tests_as_arrayrefs %bvalues) {
    print "$_\t" foreach @$tval;
    print "\n";
}

done_testing;
