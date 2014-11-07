#!/usr/bin/perl -w
# DESCRIPTION: Generate permutations in lexicographic order
#       USAGE: ./permlex.pl <term1> <term2> <term3> .....

use strict;

die "bleah... nothing to permutate\n" if $#ARGV<0; 
my @terms = @ARGV; my $n = $#ARGV; my @a = (0..$n);
genperm(); exit(0);

sub genperm {
   print join(" ",@terms[@a]),"\n";
   my ($k,$j) = ($n-1,$n);
   $k-- while ($k>=0 and $a[$k]>$a[$k+1]);
   return(0) if ($k<0);
   $j--    while ($a[$k]>$a[$j]);
   swap($j,$k++); $j=$n;
   swap($j--,$k++) while ($j>$k);
   genperm();
}
sub swap {
    my ($i,$j) = @_;
    @a[$i,$j] = @a[$j,$i];
}
sub swap1 {
   my ($i,$j) = @_; my $t = $a[$i];
   ($a[$i],$a[$j]) = ($a[$j],$t);
}
