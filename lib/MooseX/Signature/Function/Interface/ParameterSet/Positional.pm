package MooseX::Signature::Function::Interface::ParameterSet::Positional;

use Moose::Role;

with qw/MooseX::Signature::Function::Interface::ParameterSet/;

requires qw/
  get_positional_parameters
  /;

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Interface::ParameterSet::Positional - Positional parameter set interface

=head1 REQUIRED METHODS

=over 4

=item B<get_positional_parameters>

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

