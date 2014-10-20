use Modern::Perl;
use Test::More;
use IPC::Open3;
use Data::Dumper;

my @testcases = (
    {
        in => '01 12 31 32',
        out => [
            "12 23 31\n",
            "23 31 12\n",
            "31 12 23\n",
            "32 21 13\n",
            "21 13 32\n",
            "13 32 21\n",
        ],
    },
    {
        in => '01 12 34 30 42',
        out => [
            "21 10 03 34 42\n",
            "01 12 24 43 30\n",
            "12 24 43 30 01\n",
            "42 21 10 03 34\n",
            "34 42 21 10 03\n",
            "03 34 42 21 10\n",
            "30 01 12 24 43\n",
            "24 43 30 01 12\n",
            "10 03 34 42 21\n",
            "43 30 01 12 24\n",
        ],
    },
    {
        in => '11',
        out => [
            "11\n",
        ],
    },
    {
        in => '23 11 45',
        out => [
            "11\n",
        ],
    },
    {
        in => '10',
        out => [
            "0\n",
        ],
    },{
        in => '00',
        out => [
            "00\n",
        ],
    },
    {
        in => '10 21',
        out => [
            "0\n",
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