my @b = (
    [ 2, 0 ], [ 1, 3 ],

    #[ 3, 0 ], [ 1, 1 ], [ 1, 3 ], [ 3, 5 ],[0,1]
    #  [ 5, 6 ], [ 6, 3 ], [ 3, 4 ], [ 4, 0 ]
);
#$n = 0 + @b;

#$a = '01 12 22 26 65 60';

$a = '12 22 23 31';

#$a = '11';
#for $a(qw/12/){
if ($a =~ /(?(?=^.{2}$)^(.)\1$|^.?((.).? (\3|(?=.\3)))*\S+$)/){
print $a;
}else{print 0}
print "\n\n\n";
my @list = qw(20 31 32);

for my $i (0..$#list-1) {
    print join "\n", glob sprintf "{'$list[$i] '}{%s}", join ",", @list[$i+1..$#list];
    print "\n";
}
#}
#if ( $a =~ /^.{2}$/ ) {
#    if ( $a =~ /^(.)\1$/ ) {
#        print $a;
#    }
#    else { print 0 }
#}
#elsif ( $a =~ /^.?((.).? (\2|(?=.\2)))*\S+$/ ) {
#    print $a;
#}
#else { print 0 }
