use Test::More tests => 2;

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

my $crypt2 = Crypt::RSA::Simple->new();
$crypt2->public_key("$RealBin/keys/test_key.pub");
$crypt2->private_key("$RealBin/keys/test_key.priv");
my $encrypted_text2 = $crypt2->encrypt($text);
my $decrypted_text2 = $crypt2->decrypt($encrypted_text2);

ok( $decrypted_text eq $text,  "encrypt/decrypt - as new() params" );
ok( $decrypted_text2 eq $text, "encrypt/decrypt - as getter/setter params" );
