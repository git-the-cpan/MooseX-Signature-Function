use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::ParameterSet::Null;

use strict;
use warnings;

plan tests => 3;

# create, interface, passthrough

{
  my $parameterset = MooseX::Signature::Function::Meta::ParameterSet::Null->new;

  isa_ok $parameterset,'MooseX::Signature::Function::Meta::ParameterSet::Null';

  does_ok $parameterset,'MooseX::Signature::Function::Interface::ParameterSet';

  is_deeply [$parameterset->validate (42,84)],[42,84];
}

