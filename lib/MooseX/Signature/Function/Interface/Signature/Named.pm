package MooseX::Signature::Function::Interface::Signature::Named;

use Moose::Role;

with qw/MooseX::Signature::Function::Interface::Signature/;

requires qw/
  get_named_input
  get_named_output
  /;

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Interface::Signature::Positional - Positional signature interface

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

