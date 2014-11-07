#!/usr/bin/perl
use strict;
use warnings;

my %out;
my $out   = '';
my @array = qw(01 22);
my $array = '01 22';
my $rez   = $array;
$array =~ s/(\S)(\S)/$2$1/g;
$rez = $rez . ' ' . $array;
my @arr = split / /, $rez;
my %hash = map { $_ => 1 } @arr;
my @unique = keys %hash;
#@array = @unique;

sub permute {
    return ( [] ) unless (@_);
    return map {
        my @cdr = @_;
        my $car = splice @cdr, $_, 1;
        map { [ $car, @$_ ]; } &permute(@cdr);
    } 0 .. $#_;
}
my %result;
foreach my $ta ( &permute(@array) ) {

    for ( 0 .. @$ta - 1 ) {
    #    print "@$ta: ";
    #my $n = 0 + @$ta;
    my $str = join ' ', @$ta;
        print "@$ta: \n";
    check_domino($str);
        pop(@$ta);
    #    if ( !check_domino($str) ) {
        #pop(@$ta);

     #   my $str = join ' ', @$ta;
      #  check_domino($str);
    }

    #    }

}
print $out;

sub check_domino {
    my $in = shift;

    #return 1 if shift =~ /(?(?=^.{2}$)^(.)\1$|^.?((.).? (\3|(?=.\3)))*\S+$)/;
    if ( $in =~ /(?(?=^.{2}$)^(.)\1$|^.?((.).? (\3|(?=.\3)))*\S+$)/ ) {
        if ( length($in) > length($out) ) {
            $out = $in;
        }
    }
}
