use Test::More tests => 1;

use FindBin qw($RealBin);
use lib "$RealBin/../lib";
use Crypt::RSA::Simple;

my $text = "Test text to encrypt / decrypt";

my $crypt = Crypt::RSA::Simple->new(
    public_key  => "$RealBin/keys/test_key.pub",
    private_key => "$RealBin/keys/test_key.priv",
);
my $encrypted_text = $crypt->encrypt($text);
my $decrypted_text = $crypt->decrypt($encrypted_text);

ok( $decrypted_text eq $text, "encrypt/decrypt" );
