package MooseX::Signature::Function::Meta::Signature::Positional;

use Moose;

use MooseX::Signature::Function::Exception;
use Scalar::Util qw/blessed/;

with qw/MooseX::Signature::Function::Interface::Signature::Positional/;

has 'strict' => (
  isa      => 'Bool',
  required => 1,
  default  => 0,
);

has 'positional_input' => (
  isa      => 'ArrayRef',
  required => 1,
  default  => sub { [] },
);

has 'positional_output' => (
  isa      => 'ArrayRef',
  required => 1,
  default  => sub { [] },
);

sub validate_input {
  my ($self,@arguments) = @_;
  
  return $self->_validate ($self->get_positional_input,@arguments);
}

sub validate_output {
  my ($self,@arguments) = @_;
  
  return $self->_validate ($self->get_positional_output,@arguments);
}

sub _validate {
  my ($self,$parameters,@arguments) = @_;

  my @new_arguments;

  my $parameter_count = 0;

  eval {
    while (my $parameter = $parameters->[$parameter_count]) {
      if (scalar @arguments) {
        my $argument = shift @arguments;

        push @new_arguments,$parameter->validate ($argument,1);
      } else {
        push @new_arguments,$parameter->validate (undef,0);
      }

      $parameter_count++;
    }
  };

  if ($@) {
    if (blessed $@ && $@->isa ('MooseX::Signature::Function::Exception')) {
      $@->rethrow ("Parameter ($parameter_count): " . $@->message);
    } else {
      die $@;
    }
  }

  if ($self->{strict}) {
    MooseX::Signature::Function::Exception->throw ("Too many arguments")
      if scalar @arguments;
  } else {
    push @new_arguments,(@arguments);
  }

  return @new_arguments;
}

sub is_subset_of {
  my ($self,$super) = @_;

  return 1;
}

sub get_positional_input { $_[0]->{positional_input} }

sub get_positional_output { $_[0]->{positional_output} }

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Meta::Signature::Positional - Positional signature metaclass

=head1 BUGS

Most software has bugs. This module probably isn't an exception.
If you find a bug please either email me, or add the bug to cpan-RT.

=head1 AUTHOR

Anders Nor Berle E<lt>berle@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by Anders Nor Berle.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

