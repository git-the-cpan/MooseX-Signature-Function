use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::Parameter;
use MooseX::Signature::Function::Meta::Signature::Positional;

use strict;
use warnings;

plan tests => 6;

# create, interface, passthrough

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new;

  isa_ok $signature,'MooseX::Signature::Function::Meta::Signature::Positional';

  does_ok $signature,'MooseX::Signature::Function::Interface::Signature';

  is_deeply [$signature->validate (42,84)],[42,84];
}

# with parameters

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new (parameter_list => [
      MooseX::Signature::Function::Meta::Parameter->new (required => 1),
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
  );

  is_deeply [$signature->validate (42,84)],[42,84];

  throws_ok { $signature->validate } qr/Parameter \(0\): Parameter is required/;
}

# strict

{
  my $signature = MooseX::Signature::Function::Meta::Signature::Positional->new (parameter_list => [
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
    strict => 1,
  );

  is_deeply [$signature->validate (42,84)],[42];
}

