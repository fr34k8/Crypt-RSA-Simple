use Test::More tests => 3;

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

my $crypt3 = Crypt::RSA::Simple->new();
my $encrypted_text3 = $crypt3->encrypt( $text, "$RealBin/keys/test_key.pub" );
my $decrypted_text3 =
  $crypt3->decrypt( $encrypted_text3, "$RealBin/keys/test_key.priv" );

ok( $decrypted_text eq $text,  "as new() params" );
ok( $decrypted_text2 eq $text, "as getter/setter params" );
ok( $decrypted_text3 eq $text, "as crypt/decrypt params" );
