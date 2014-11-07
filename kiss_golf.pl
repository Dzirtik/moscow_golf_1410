#!/usr/bin/env perl
use Modern::Perl;

sub yes {
    my ( $x, $z ) = @_;
    my $yes;
    if ( $x->{a} == $z->{b} ) {
        $yes = 1;
    }
    elsif ( $x->{b} == $z->{b} ) {
        $yes = 2;
    }
    else {
        $yes = 0;
    }
    return $yes;
}

sub revv {
    my ($q) = @_;
    ( $q->{a}, $q->{b} ) = ( $q->{b}, $q->{a} );
    return $q;
}

#{Раздел описания глобальных переменных:
#b - исходный массив костяшек,
#rer - промежуточный,
#а result - массив хранения результата.
#Busy - массив хранения индексов занятых в исходном массиве костяшек}
our ( @b, @rer, @result, @busy );
our ( $n, $i, $max );

sub built {
    my ( $j, $k ) = @_;
    $busy[$j] = 1;    #'true';

# {Добавляем в конец массива rer костяшку b[s] (rer - стек)}

    $rer[$k] = $b[$j]
      ; # {запоминаем ее номер в исходном массиве}

#my $v=1;# {обязательно локальная переменная цикла}
    for my $v ( 1 .. $n )    #{цикл перебора}
    {
        if ( !$busy[$v] )
        {    #{если костяшка с номером v не занята}
            if ( yes( $rer[$k], $b[$v] ) == 1 ) {
                built( $v, $k + 1 )
                  ; # {если подходит, то подставляем ее в качестве следущей}

            }
            elsif ( yes( $rer[$k], $b[$v] ) == 2 ) {
                $b[$v] = revv( $b[$v] );
                built( $v, $k + 1 );
            }
            $busy[$j] = 0;    #false; {забываем}
            if ( $k > $max ) {
                $max    = $k;
                @result = @rer
                  ; #{если цепочка максимальная относительно имеющейся}

            }
        }

    }

}

sub main {
    my @b = (
        [ 3, 0 ], [ 0, 1 ], [ 1, 3 ], [ 3, 5 ],
        [ 5, 6 ], [ 6, 3 ], [ 3, 4 ], [ 4, 0 ]
    );
    $n = 0 + @b;
    for my $i ( 1 .. $n ) {
        built( $i, 1 )
          ; #{подставляем каждую костяшку в качестве первой и строим от нее цепочку}
        revv( $b[$i] );
        built( $i, 1 );
    }
    for my $j ( 1 .. $max ) {
        print $result[$j]->{a} . ':' . $result[$j]->{b} . "\n";

    }
}

main();

#  for i:=1 to n do
#   begin
#built(i,1); {подставляем каждую костяшку в качестве первой и строим от нее цепочку}
#     reverse(b[i]);
#     built(i,1);
#end;
#  For i:=1 to max do {вывод результата}
#write(result[i].a:4,':',result[i].b);
#readln;
#end.

#   For v:=1 to n do {цикл перебора}
#    if not busy[v] then {если костяшка с номером v не занята}
#       if yes(rer[k],b[v])=1 then built(v,k+1) {если подходит, то подставляем ее в качестве следущей}
#     else
# if yes(rer[k],b[v])=2 then
#begin reverse(b[v]); built(v,k+1);end;
#busy[j]:=false; {забываем}
#   if k>max then begin max:=k; result:=rer; end; {если цепочка максимальная относительно имеющейся}
#end;
