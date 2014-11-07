#!/usr/bin/perl
# решение здесь
use strict;
use warnings;
use Data::Printer;
my @dominoes;
while ( my $row = <> ) {
    $row =~ s/\s*$//;
    @dominoes = split / /, $row;
}
my %d_hash = ();

map { $d_hash{$_} = [ split //, $_ ] } @dominoes;
my $i = @dominoes - 2;

my $ck  = 0;
my %rez = ();
foreach my $domino ( 0 .. $i ) {

    for my $d ( 0 .. 1 ) {
        for my $d2 ( 0 .. 1 ) {
            if ( ${ $d_hash{ $dominoes[$i] } }[$d] eq
                ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] )
            {
                $rez{   length ${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
                      . ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
                      . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
                      . ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ] } =
                    ${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
                  . ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
                  . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
                  . ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ];

                # print "OK";
                $ck = 1;
            }

            # print "\$d2+1 " . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] . "\n";
        }
    }

    # print "@" x 20 . "\n";
    $i++;
}
if ( @dominoes == 1 ) {
    my @arr = values %d_hash;

    if ( $arr[0][0] == $arr[0][1] ) {
        print @{ $arr[0] };
    }
    else {
        print $ck;
    }
}
elsif ( $ck == 0 ) {
    print $ck;
}
else {
    my ($max) = sort { $b <=> $a } keys %rez;
    print $rez{$max};
}

# 1)вывести 0, если их нельзя закольцевать.+
# while(<>){
# push @F;
# }
# # print "11 12 22 23 31\n";
