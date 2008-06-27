use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::Parameter;
use MooseX::Signature::Function::Meta::ParameterSet::Positional;

use strict;
use warnings;

plan tests => 7;

# create, interface, passthrough

{
  my $parameterset = MooseX::Signature::Function::Meta::ParameterSet::Positional->new;

  isa_ok $parameterset,'MooseX::Signature::Function::Meta::ParameterSet::Positional';

  does_ok $parameterset,'MooseX::Signature::Function::Interface::ParameterSet::Positional';

  does_ok $parameterset,'MooseX::Signature::Function::Interface::ParameterSet';

  is_deeply [$parameterset->validate (42,84)],[42,84];
}

# with parameters

{
  my $parameterset = MooseX::Signature::Function::Meta::ParameterSet::Positional->new (positional_parameters => [
      MooseX::Signature::Function::Meta::Parameter->new (required => 1),
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
  );

  is_deeply [$parameterset->validate (42,84)],[42,84];

  throws_ok { $parameterset->validate } qr/Parameter \(0\): Parameter is required/;
}

# strict

{
  my $parameterset = MooseX::Signature::Function::Meta::ParameterSet::Positional->new (positional_parameters => [
      MooseX::Signature::Function::Meta::Parameter->new,
    ],
    strict => 1,
  );

  throws_ok { $parameterset->validate (42,84) } qr/Too many arguments/;
}

