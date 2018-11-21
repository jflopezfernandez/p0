
use utf8;
use v5.26;

use strict;
use warnings;

use Parse::Lex;


my @tokens = qw(
    BegParen [(]
    EndParen [)]
    Operator [-+*/^]
    Number [(-?\d+)|(-?\d+\.\d*)]
);

my $lexer = Parse::Lex->new(@tokens);

#$lexer->from(<STDIN>);

my $inputText = "43.4*15^2+1";

$lexer->from($inputText);

# my $token = $lexer->next;

# say "Token: " . $token->name . " " . $token->next;

TOKEN:
while (1) {
    my $token = $lexer->next;

    if (not $lexer->eoi) {
        print $token->name . " " . $token->next . " " . "\n";
    } else {
        last TOKEN;
    }
}

# my $newDirectoryName = "New-Directory";

# if (-e $newDirectoryName) {
#     say "[Error]: Directory Already Exists.";
# } else {
#     say "Creating new directory: $newDirectoryName";

#     my $status = mkdir($newDirectoryName);

#     say "[Status]: $status";
# }
