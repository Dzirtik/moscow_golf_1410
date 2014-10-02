use Modern::Perl;
use Test::More;
use IPC::Open3;
use Data::Dumper;

my @testcases = (
    {
        in => '01 11 12 22 31 32',
        out => [
            "11 12 22 23 31\n",
        ],
    },
);

my ( $in, $out, $err );
foreach my $testcase ( @testcases ) {
    open3( $in, $out, $err, 'perl golf.pl' );
    print $in $testcase->{in};
    close $in;
    my $rout = join('',<$out>);

    ok(grep {$rout eq $_} @{$testcase->{out}}, $testcase->{in});
}

done_testing();