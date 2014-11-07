#!/usr/bin/env perl
use Modern::Perl;

#Program Domino_on_matrix_of_a_contiguity;

our ( $i, $j, $n, $m, $x1, $x2, $max );

our ( @g, @result )
  ; #:array [1..100]of byte; {g – массив формирования, result – массив результата}

our (@a);    #:array[0..6,0..6] of byte; {матрица смежности}

sub built {
    my ( $v, $k ) = @_;
    my $i;

    $g[$k] = $v;

    for my $i ( 0 .. 6 ) {

        if ( $a[$v][$i] > 0 ) {

            # begin

            $a[$v][$i]--;
            $a[$i][$v]--; 
# {занять одну костяшку (удалить одно ребро)}

            built( $i, $k + 1 );

            $a[$v][$i]++;
            $a[$i][$v]++;    # {возвратить костяшку}

            # end;

            if ( $max < $k ) {

                #then begin
                $max    = $k;
                @result = @g;

                #end; {сравнение с текущим максимумом

                #   и выбор макс. цепочки}
            }
        }

        #end;
    }
}

#begin

#readln(n);
my @b = (
    [ 3, 0 ], [ 0, 1 ], [ 1, 3 ], [ 3, 5 ],
    [ 5, 6 ], [ 6, 3 ], [ 3, 4 ], [ 4, 0 ]
);
$n = 0 + @b;

for my $i ( 1 .. $n - 1 ) {    # to n do

    #begin

    #   readln(x1,x2); {чтение костяшки}
for my $ar(@b){
$x1=$$ar[0];
say $x1;
$x2=$$ar[1];
say $x2;
#    $a[$x1][$x2]++;
    $a[$x2][$x1]++;   # {заполнение матрицы смежности}
}
}

# end;

for $i ( 0 .. 6 ) {

    built( $i, 1 )
      ; #{подставляем каждую вершину в качестве первой и строим от нее цепочку}

    print 'kol-vo=', $max - 1;    # {вывод результата}

    for $i ( 0 .. $max - 1 ) {
        print $result[$i] . ':' . $result[ $i + 1 ] . '  ';
    }

}
