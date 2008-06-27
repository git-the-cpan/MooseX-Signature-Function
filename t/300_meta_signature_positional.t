use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::Parameter;
use MooseX::Signature::Function::Meta::Signature::Positional;

use strict;
use warnings;

plan tests => 7;

# create, interface, passthrough

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new;

  isa_ok $signature,'MooseX::Signature::Function::Meta::Signature::Positional';

  does_ok $signature,'MooseX::Signature::Function::Interface::Signature::Positional';

  does_ok $signature,'MooseX::Signature::Function::Interface::Signature';

  is_deeply [$signature->validate_input (42,84)],[42,84];
}

# with parameters

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new (positional_input => [
      MooseX::Signature::Function::Meta::Parameter->new (required => 1),
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
  );

  is_deeply [$signature->validate_input (42,84)],[42,84];

  throws_ok { $signature->validate_input } qr/Parameter \(0\): Parameter is required/;
}

# strict

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new (positional_input => [
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
    strict => 1,
  );

  throws_ok { $signature->validate_input (42,84) } qr/Too many arguments/;
}

