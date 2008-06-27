package MooseX::Signature::Function::Meta::Signature;

use Moose;

use MooseX::Signature::Function::Meta::ParameterSet::Null;

has input_parameters => (
  does    => 'MooseX::Signature::Function::Interface::ParameterSet',
  handles => {
    validate_input => 'validate',
  },
  default => sub { MooseX::Signature::Function::Meta::ParameterSet::Null->new },
);

has output_parameters => (
  does    => 'MooseX::Signature::Function::Interface::ParameterSet',
  handles => {
    validate_output => 'validate',
  },
  default => sub { MooseX::Signature::Function::Meta::ParameterSet::Null->new },
);

with qw/MooseX::Signature::Function::Interface::Signature/;

sub is_subset_of {}

sub get_input_parameters { $_[0]->{input_parameters} }

sub get_output_parameters { $_[0]->{output_parameters} }

