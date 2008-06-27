package MooseX::Signature::Function::Meta::Parameter;

use Moose;

use MooseX::Signature::Function::Exception;

with qw/MooseX::Signature::Function::Interface::Parameter/;

has 'required' => (
  isa     => 'Bool',
  default => 0,
);

sub get_required { $_[0]->{required} }

sub validate {
  my ($self,$value,$is_provided) = @_;

  MooseX::Signature::Function::Exception->throw ('Parameter is required')
    unless $is_provided;

  return $value;
}

sub is_subset_of {
  my ($self,$super) = @_;

  return if $self->get_required && ! $super->get_required;

  return 1;
}

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Meta::Parameter - Parameter metaclass

=head1 METHODS

=over 4

=item B<is_subset_of>

=item B<validate>

=back

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

