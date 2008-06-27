use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::Signature;

use strict;
use warnings;

plan tests => 6;

# create, interface, passthrough

{
  my $signature = MooseX::Signature::Function::Meta::Signature->new;

  isa_ok $signature,'MooseX::Signature::Function::Meta::Signature';

  does_ok $signature,'MooseX::Signature::Function::Interface::Signature';

  does_ok $signature->get_input_parameters,'MooseX::Signature::Function::Interface::ParameterSet';

  does_ok $signature->get_output_parameters,'MooseX::Signature::Function::Interface::ParameterSet';

  is_deeply [$signature->validate_input (42,84)],[42,84];

  is_deeply [$signature->validate_output (42,84)],[42,84];
}

