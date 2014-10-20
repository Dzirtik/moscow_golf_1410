#!/usr/bin/perl
use Modern::Perl;
use Test::More;
use IPC::Open3;
use Data::Dumper;

my $TIMEOUT=60;

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
        in => '01 12 23 34 45 55',
        out => [
            "55\n",
        ],
    },
    {
        in => '55 54 53 52 51 50',
        out => [
            "55\n",
        ],
    },
    {
        in => '35 65 55 54 51',
        out => [
            "55\n",
        ],
    },
    {
        in => '01 12 23 34 45 56',
        out => [
            "0\n",
        ],
    },
    {
        in => '01 44 20 26 64 42',
        out => [
            "26 64 44 42\n",
            "64 44 42 26\n",
            "44 42 26 64\n",
            "42 26 64 44\n",
            "62 24 44 46\n",
            "24 44 46 62\n",
            "44 46 62 24\n",
            "46 62 24 44\n",
        ],
    },
    {
        in => '35 10 54 20 12 34',
        out => [
            "35 54 43\n",
            "54 43 35\n",
            "43 35 54\n",
            "53 34 45\n",
            "34 45 53\n",
            "53 34 45\n",
            "20 01 12\n",
            "01 12 20\n",
            "12 20 01\n",
            "02 21 10\n",
            "21 10 02\n",
            "02 21 10\n",
        ],
    },
    {
        in => '00 33',
        out => [
            "00\n",
            "33\n"
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
    },
    {
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
    my $pid=open3( $in, $out, $err, 'perl golf.pl' );
    print $in $testcase->{in};
    close $in;

    my $forked = fork();
    die "fork() failed: $!" unless defined $forked;
    if ( $forked == 0 )
    {
        sleep $TIMEOUT;
        kill(9, $pid);
        exit;
    }

    my $rout='';
    while ( <$out> )
    {
        $rout .= $_;
        sleep 1;
    }
    ok(grep {$rout eq $_} @{$testcase->{out}}, $testcase->{in});
}

done_testing();
