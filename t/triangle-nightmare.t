#!/usr/bin/env perl

# triangle-nightmare.t
# Date  : 25 March 2018
# Author: Ankit Pati

use strict;
use warnings;

use IPC::Run 'run';

use Test::More;

use File::Basename 'dirname';
use lib dirname ($0) . '/lib';
use Test::Generator qw(nightmare_tests tests_as_arrayrefs);

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

# total number of tests must be 7**n
plan tests => 7 ** scalar keys %bvalues;

foreach my $tval (tests_as_arrayrefs nightmare_tests %bvalues) {
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

# end of triangle-nightmare.t

__END__
OUTPUT

1..343
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
ok 126 - Nature of triangle identified.
ok 127 - Nature of triangle identified.
ok 128 - Nature of triangle identified.
ok 129 - Nature of triangle identified.
ok 130 - Nature of triangle identified.
ok 131 - Nature of triangle identified.
ok 132 - Nature of triangle identified.
ok 133 - Nature of triangle identified.
ok 134 - Nature of triangle identified.
ok 135 - Nature of triangle identified.
ok 136 - Nature of triangle identified.
ok 137 - Nature of triangle identified.
ok 138 - Nature of triangle identified.
ok 139 - Nature of triangle identified.
ok 140 - Nature of triangle identified.
ok 141 - Nature of triangle identified.
ok 142 - Nature of triangle identified.
ok 143 - Nature of triangle identified.
ok 144 - Nature of triangle identified.
ok 145 - Nature of triangle identified.
ok 146 - Nature of triangle identified.
ok 147 - Nature of triangle identified.
ok 148 - Nature of triangle identified.
ok 149 - Nature of triangle identified.
ok 150 - Nature of triangle identified.
ok 151 - Nature of triangle identified.
ok 152 - Nature of triangle identified.
ok 153 - Nature of triangle identified.
ok 154 - Nature of triangle identified.
ok 155 - Nature of triangle identified.
ok 156 - Nature of triangle identified.
ok 157 - Nature of triangle identified.
ok 158 - Nature of triangle identified.
ok 159 - Nature of triangle identified.
ok 160 - Nature of triangle identified.
ok 161 - Nature of triangle identified.
ok 162 - Nature of triangle identified.
ok 163 - Nature of triangle identified.
ok 164 - Nature of triangle identified.
ok 165 - Nature of triangle identified.
ok 166 - Nature of triangle identified.
ok 167 - Nature of triangle identified.
ok 168 - Nature of triangle identified.
ok 169 - Nature of triangle identified.
ok 170 - Nature of triangle identified.
ok 171 - Nature of triangle identified.
ok 172 - Nature of triangle identified.
ok 173 - Nature of triangle identified.
ok 174 - Nature of triangle identified.
ok 175 - Nature of triangle identified.
ok 176 - Nature of triangle identified.
ok 177 - Nature of triangle identified.
ok 178 - Nature of triangle identified.
ok 179 - Nature of triangle identified.
ok 180 - Nature of triangle identified.
ok 181 - Nature of triangle identified.
ok 182 - Nature of triangle identified.
ok 183 - Nature of triangle identified.
ok 184 - Nature of triangle identified.
ok 185 - Nature of triangle identified.
ok 186 - Nature of triangle identified.
ok 187 - Nature of triangle identified.
ok 188 - Nature of triangle identified.
ok 189 - Nature of triangle identified.
ok 190 - Nature of triangle identified.
ok 191 - Nature of triangle identified.
ok 192 - Nature of triangle identified.
ok 193 - Nature of triangle identified.
ok 194 - Nature of triangle identified.
ok 195 - Nature of triangle identified.
ok 196 - Nature of triangle identified.
ok 197 - Nature of triangle identified.
ok 198 - Nature of triangle identified.
ok 199 - Nature of triangle identified.
ok 200 - Nature of triangle identified.
ok 201 - Nature of triangle identified.
ok 202 - Nature of triangle identified.
ok 203 - Nature of triangle identified.
ok 204 - Nature of triangle identified.
ok 205 - Nature of triangle identified.
ok 206 - Nature of triangle identified.
ok 207 - Nature of triangle identified.
ok 208 - Nature of triangle identified.
ok 209 - Nature of triangle identified.
ok 210 - Nature of triangle identified.
ok 211 - Nature of triangle identified.
ok 212 - Nature of triangle identified.
ok 213 - Nature of triangle identified.
ok 214 - Nature of triangle identified.
ok 215 - Nature of triangle identified.
ok 216 - Nature of triangle identified.
ok 217 - Nature of triangle identified.
ok 218 - Nature of triangle identified.
ok 219 - Nature of triangle identified.
ok 220 - Nature of triangle identified.
ok 221 - Nature of triangle identified.
ok 222 - Nature of triangle identified.
ok 223 - Nature of triangle identified.
ok 224 - Nature of triangle identified.
ok 225 - Nature of triangle identified.
ok 226 - Nature of triangle identified.
ok 227 - Nature of triangle identified.
ok 228 - Nature of triangle identified.
ok 229 - Nature of triangle identified.
ok 230 - Nature of triangle identified.
ok 231 - Nature of triangle identified.
ok 232 - Nature of triangle identified.
ok 233 - Nature of triangle identified.
ok 234 - Nature of triangle identified.
ok 235 - Nature of triangle identified.
ok 236 - Nature of triangle identified.
ok 237 - Nature of triangle identified.
ok 238 - Nature of triangle identified.
ok 239 - Nature of triangle identified.
ok 240 - Nature of triangle identified.
ok 241 - Nature of triangle identified.
ok 242 - Nature of triangle identified.
ok 243 - Nature of triangle identified.
ok 244 - Nature of triangle identified.
ok 245 - Nature of triangle identified.
ok 246 - Nature of triangle identified.
ok 247 - Nature of triangle identified.
ok 248 - Nature of triangle identified.
ok 249 - Nature of triangle identified.
ok 250 - Nature of triangle identified.
ok 251 - Nature of triangle identified.
ok 252 - Nature of triangle identified.
ok 253 - Nature of triangle identified.
ok 254 - Nature of triangle identified.
ok 255 - Nature of triangle identified.
ok 256 - Nature of triangle identified.
ok 257 - Nature of triangle identified.
ok 258 - Nature of triangle identified.
ok 259 - Nature of triangle identified.
ok 260 - Nature of triangle identified.
ok 261 - Nature of triangle identified.
ok 262 - Nature of triangle identified.
ok 263 - Nature of triangle identified.
ok 264 - Nature of triangle identified.
ok 265 - Nature of triangle identified.
ok 266 - Nature of triangle identified.
ok 267 - Nature of triangle identified.
ok 268 - Nature of triangle identified.
ok 269 - Nature of triangle identified.
ok 270 - Nature of triangle identified.
ok 271 - Nature of triangle identified.
ok 272 - Nature of triangle identified.
ok 273 - Nature of triangle identified.
ok 274 - Nature of triangle identified.
ok 275 - Nature of triangle identified.
ok 276 - Nature of triangle identified.
ok 277 - Nature of triangle identified.
ok 278 - Nature of triangle identified.
ok 279 - Nature of triangle identified.
ok 280 - Nature of triangle identified.
ok 281 - Nature of triangle identified.
ok 282 - Nature of triangle identified.
ok 283 - Nature of triangle identified.
ok 284 - Nature of triangle identified.
ok 285 - Nature of triangle identified.
ok 286 - Nature of triangle identified.
ok 287 - Nature of triangle identified.
ok 288 - Nature of triangle identified.
ok 289 - Nature of triangle identified.
ok 290 - Nature of triangle identified.
ok 291 - Nature of triangle identified.
ok 292 - Nature of triangle identified.
ok 293 - Nature of triangle identified.
ok 294 - Nature of triangle identified.
ok 295 - Nature of triangle identified.
ok 296 - Nature of triangle identified.
ok 297 - Nature of triangle identified.
ok 298 - Nature of triangle identified.
ok 299 - Nature of triangle identified.
ok 300 - Nature of triangle identified.
ok 301 - Nature of triangle identified.
ok 302 - Nature of triangle identified.
ok 303 - Nature of triangle identified.
ok 304 - Nature of triangle identified.
ok 305 - Nature of triangle identified.
ok 306 - Nature of triangle identified.
ok 307 - Nature of triangle identified.
ok 308 - Nature of triangle identified.
ok 309 - Nature of triangle identified.
ok 310 - Nature of triangle identified.
ok 311 - Nature of triangle identified.
ok 312 - Nature of triangle identified.
ok 313 - Nature of triangle identified.
ok 314 - Nature of triangle identified.
ok 315 - Nature of triangle identified.
ok 316 - Nature of triangle identified.
ok 317 - Nature of triangle identified.
ok 318 - Nature of triangle identified.
ok 319 - Nature of triangle identified.
ok 320 - Nature of triangle identified.
ok 321 - Nature of triangle identified.
ok 322 - Nature of triangle identified.
ok 323 - Nature of triangle identified.
ok 324 - Nature of triangle identified.
ok 325 - Nature of triangle identified.
ok 326 - Nature of triangle identified.
ok 327 - Nature of triangle identified.
ok 328 - Nature of triangle identified.
ok 329 - Nature of triangle identified.
ok 330 - Nature of triangle identified.
ok 331 - Nature of triangle identified.
ok 332 - Nature of triangle identified.
ok 333 - Nature of triangle identified.
ok 334 - Nature of triangle identified.
ok 335 - Nature of triangle identified.
ok 336 - Nature of triangle identified.
ok 337 - Nature of triangle identified.
ok 338 - Nature of triangle identified.
ok 339 - Nature of triangle identified.
ok 340 - Nature of triangle identified.
ok 341 - Nature of triangle identified.
ok 342 - Nature of triangle identified.
ok 343 - Nature of triangle identified.
