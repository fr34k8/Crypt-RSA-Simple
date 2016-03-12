use Test::More tests => 2;
use FindBin qw($RealBin);
use lib "$RealBin/../lib";

require_ok( Crypt::RSA::Simple );

my $crypt = Crypt::RSA::Simple->new();

isa_ok( $crypt, 'Crypt::RSA::Simple' );
