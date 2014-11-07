#!/usr/bin/perl
# решение здесь
#Идея следующая. Берём первую попавшуюся костяшку и начинаем плясать от неё. Далее, пусть положили какое-то количество костяшек, первая цифра в последовательности - a, последняя - b. Если больше костяшек нет, проверяем a == b. Если костяшки есть, и ни одна не подходит (нет цифры b), тогда если a != b, решения нет (доказывать лень :) ), иначе вращаем (перекладываем последнюю вперёд) выложенные костяшки и пробуем снова. Если все варианты вращения исчерпаны, решения нет. Вот такая программа получилась:

use strict;
use warnings;
use Data::Printer;
my @dominoes;
my %d_hash = ();
while ( my $row = <> ) {
    $row =~ s/\s*$//;
    #@dominoes = = split / /, $row;
    map { $d_hash{$_} = [ split //, $_ ] } split / /, $row;
}

my @solution=();

sub addItemToSolution
{
my ($a,$b)=@_;
    #if ( solution.empty() ) solution.push_back( a );
    if ( scalar @solution==0 ){ 
push @solution, $a;
#solution.push_back( a );
}
push @solution, $b;
#    solution.push_back( b );
#    dominoes[a].erase( dominoes[a].find( b ) );
#    dominoes[b].erase( dominoes[b].find( a ) );
}

dominoesExists()
{
    return !( dominoes[0].empty() && dominoes[1].empty() && dominoes[2].empty()
           && dominoes[3].empty() && dominoes[4].empty() && dominoes[5].empty()
           && dominoes[6].empty() );
}

bool solve()
{
    int a, b;
    while ( dominoesExists() )
    {
        a = solution.back();
        if ( dominoes[a].empty() )
        {
            if ( a != solution.front() ) return false;
            solution.pop_back();
            size_t n = solution.size();
            while ( --n )
            {
                a = solution.back();
                solution.pop_back();
                solution.push_front( a );
                if ( !dominoes[a].empty() ) break;
            }
            if ( dominoes[a].empty() ) return false;
            solution.push_back( a );
        }
        b = *dominoes[a].begin();
        addItemToSolution( a, b );
    }
    return solution.front() == solution.back();
}


int main()
{
    ifstream in( "input.txt" );
    ofstream out( "output.txt" );

    dominoes.resize( 7 );

    int n, a, b;
    while ( in >> n )
    {
        a = n / 10; b = n % 10;
        dominoes[a].insert( b );
        dominoes[b].insert( a );
    }

    addItemToSolution( a, b );
    if ( solve() )
    {
        for ( size_t k = 1; k < solution.size(); ++k )
            out << solution[k-1] << solution[k] << " ";
    }
    else
    {
        out << "NO";
    }
}


}






# foreach my $domino (@dominoes) {
# $d_hash{$domino} = [ split //, $domino ];
# }
#map { $d_hash{$_} = [ split //, $_ ] } @dominoes;
# p @dominoes;
p %d_hash;

#my $i = @dominoes - 2;
# print +@dominoes."\n";
# print "####" . $i . "\n";
#my $ck = 0;
#my %rez = ();
#foreach my $domino ( 0 .. $i ) {
# print "\$dominoes[$i]" . $dominoes[$i] . "\n";
# print "\$domino: " . $dominoes[$i] . "\n";
# print "@" x 20 . "\n";
#for my $d ( 0 .. 1 ) {
# print "\$d " . ${ $d_hash{ $dominoes[$i] } }[$d] . "\n";
#for my $d2 ( 0 .. 1 ) {
#if ( ${ $d_hash{ $dominoes[$i] } }[$d] eq
#${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] )
#{
# p @{ $d_hash{ $dominoes[$i] } };
# p @{ $d_hash{ $dominoes[$i+1] } };
# print ${ $d_hash{ $dominoes[$i] } }[$d].'eq',
# ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]."\n";
# print $i."=i=".($i+1)."\n";
#$rez{ length ${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
#. ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
#. ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
#. ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ] } =
#${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
#. ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
#. ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
#. ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ];
## print "OK";
#$ck = 1;
#}
# print "\$d2+1 " . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] . "\n";
#}
#}
# print "@" x 20 . "\n";
#$i++;
#}
#if ( @dominoes == 1 ) {
# p %d_hash;
# $ck == 1;
# print keys %d_hash;
#my @arr = values %d_hash;
# p @arr;
#if ( $arr[0][0] == $arr[0][1] ) {
#print @{ $arr[0] };
#}
#else {
#print $ck;
#}
#}
#elsif ( $ck == 0 ) {
#print $ck;
#}
#else {
#my ($max) = sort { $b <=> $a } keys %rez;
#print $rez{$max};
## p %rez;
# print 'OK';
#}
# 1)вывести 0, если их нельзя закольцевать.+
# while(<>){
# push @F;
# }
# # print "11 12 22 23 31\n";
