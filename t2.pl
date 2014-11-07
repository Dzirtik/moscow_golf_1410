#!/usr/bin/env perl
use Modern::Perl;
use Data::Dumper;
our (@a);    #:array[0..6,0..6] of byte; {матрица смежности}

our ( $i, $j, $n, $m, $x1, $x2, $max );

our ( @g, @result,@big )
  ; #:array [1..100]of byte; {g – массив формирования, result – массив результата}

my @b = (
    [ 3, 0 ], [ 1, 1 ], [ 1, 3 ], [ 3, 5 ],[0,1]
  #  [ 5, 6 ], [ 6, 3 ], [ 3, 4 ], [ 4, 0 ]
);

#print Dumper @b;
$n = 0 + @b;

# {заполнение матрицы смежности}
for my $a (@b) {
    $a[ $$a[0] ][ $$a[1] ]++;
    $a[ $$a[1] ][ $$a[0] ]++;
}
#print Dumper @a;

for my $i ( 0 .. 6 ) {
    built( $i, 0 )
      ; #{подставляем каждую вершину в качестве первой и строим от нее цепочку}
}
    #print "\n".'kol-vo=', $max+1  ."\n";    # {вывод результата}
#print "@result";
    for $i ( 0 .. $max  ) {
        print $result[$i] . $result[ $i + 1 ] . '  ';
    }


#print Dumper @result;
#print Dumper @big;


sub built {
    my ( $v, $k ) = @_;
    my $i;
    $g[$k] = $v;
    for my $i ( 0 .. 6 ) {
        if ( defined( $a[$v][$i] ) and $a[$v][$i] > 0 ) {
            $a[$v][$i]--;
            $a[$i][$v]--;
 # {занять одну костяшку (удалить одно ребро)}
            built( $i, $k + 1 );
            $a[$v][$i]++;
            $a[$i][$v]++;  
 # {возвратить костяшку}
            if ( !defined($max) or $max < $k ) {
                $max    = $k;
                @result = @g;
#push @big,\@g;
                #end; {сравнение с текущим максимумом #   и выбор макс. цепочки}
            }
        }
    }
}

#for my $i ( 0 .. $n - 1 ) {    # to n do
#    $a[$x1][$x2]++;
#    $a[$x2][$x1]++;   # {заполнение матрицы смежности}
#
#}
