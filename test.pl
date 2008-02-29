#!/usr/bin/perl -sw

use Test::More tests => 9;

BEGIN { use_ok( 'Tie::DNS' ); }
my %dns;
eval {
	tie %dns, 'Tie::DNS';
};
ok((not $@), 'tie %dns, "Tie::DNS";');

#I hope this section works under Windows.
my $ip;
eval {
	$ip = $dns{'localhost'};
};
ok((not $@), '$ip = $dns{"localhost"}');
ok($ip eq '127.0.0.1', 'localhost lookup');

#Test caching
undef %dns;
eval {
	tie %dns, 'Tie::DNS', { cache => 100 };
};
ok((not $@), 'tie %dns, "Tie::DNS", { cache => 100 };');
eval {
	$ip = $dns{'localhost'};
};
ok((not $@), '$ip = $dns{"localhost"}');
ok($ip eq '127.0.0.1', 'localhost lookup (testing cached)');
my $ip2;
eval {
	$ip2 = $dns{'localhost'};
};
ok((not $@), '$ip2 = $dns{"localhost"}');
ok($ip2 eq '127.0.0.1', 'localhost lookup (testing cached)');
