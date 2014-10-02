#! /usr/bin/perl -w
use strict;

my $VERSION = "0.04";

shift if my $binary = @ARGV && $ARGV[0] eq "-b";
@ARGV=("current.pl") unless @ARGV;
my $sum;
for my $file (@ARGV) {
    local (*FILE, $/);
    open(FILE, "< $file") || die "Could not open $file: $!\n";
    binmode FILE if $binary;
    local $_=<FILE>;
    s/\#! ?\S+\s?// if /^\#!/;
    s/\s*\z//;
    printf("%3d: %s\n", length, $file);
    $sum += length;
}
printf("---\n%3d\n", $sum) if @ARGV > 1;
