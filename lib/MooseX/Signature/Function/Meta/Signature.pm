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

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Meta::Signature - Signature metaclass

=head1 METHODS

=over 4

=item B<is_subset_of>

=item B<validate_input>

=item B<validate_output>

=item B<get_input_parameters>

=item B<get_output_parameters>

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

