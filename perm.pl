#!/usr/bin/perl
use strict;
use warnings;

 use Data::Dumper;
my @array = qw(01 22 23);
my $array = '01 22';
my $rez=$array;
#print Dumper $rez;
#my @A=qw(eval $array);
#print $array."\n";
#for  my$el(@array){
$array=~ s/(\S)(\S)/$2$1/g;
$rez=$rez.' '.$array;
my @arr=split / /,$rez;
my %hash   = map { $_ => 1 } @arr;
my @unique = keys %hash;  
@array=@unique;
#print Dumper @array;
#print "\n\n";
#my @B=qw(eval $array);
#my @out = keys %{{map {($_ => 1)} (@A, @B)}};
#}
#my @arr2=reverse @array;
#use Data::Dumper;
#print Dumper @out;

sub permute {
    return ([]) unless (@_);
    return map {
      my @cdr = @_;
      my $car = splice @cdr, $_, 1;
      map { [$car, @$_]; } &permute(@cdr);
    } 0 .. $#_;
}

#print "@$_\n" foreach (&permute (@array));
#print "@$_\n" 
foreach my $ta(&permute (@array)){
print "@$ta\n" ;
my $n=0+@$ta;
print "size of array".(0+@$ta)."\n";
print check_domino(join ' ',@$ta)."\n";
if (!check_domino(join ' ',@$ta)){
for (0..$n-2){
pop(@$ta);
print "array: @$ta\n" ;
print check_domino(join ' ',@$ta)."\n";
}
#for 
#print check_domino(join ' ',@$ta)."\n";
}

}



sub check_domino{
my $a=shift;
if ($a =~ /(?(?=^.{2}$)^(.)\1$|^.?((.).? (\3|(?=.\3)))*\S+$)/){
return 1;
}else{return 0}
}
#!/usr/bin/perl -n
# Fischer-Krause ordered permutation generator
 
sub permute2 (&@) {
    my $code = shift;
    my @idx = 0..$#_;
    while ( $code->(@_[@idx]) ) {
        my $p = $#idx;
        --$p while $idx[$p-1] > $idx[$p];
        my $q = $p or return;
        push @idx, reverse splice @idx, $p;
        ++$q while $idx[$p-1] > $idx[$q];
        @idx[$p-1,$q]=@idx[$q,$p-1];
    }
}
print "\n\n\n";
my @a;
my @some_array=(11,22,33);
permute2 { push @a, "@_" } @some_array; 
#my $i=0;
for my $b(@a){
#print type $b
print $b."\n";
#print "\n\$b $b\n";
#print Dumper $b;
#$i++;
}
#print "@a";
#permute { print "@_\n" } split;
 #!/usr/bin/perl -n
    # tsc-permute: permute each word of input
    #permute([split], []);
    #permute1(12,22);
    sub permute1 {
        my @items = @{ $_[0] };
        my @perms = @{ $_[1] };
        unless (@items) {
            print "@perms\n";
        } else {
            my(@newitems,@newperms,$i);
            foreach $i (0 .. $#items) {
                @newitems = @items;
                @newperms = @perms;
                unshift(@newperms, splice(@newitems, $i, 1));
                permute([@newitems], [@newperms]);
            }
        }
    }
