package MooseX::Signature::Function::Meta::Method;

use Moose;

use Moose::Util qw/does_role/;
use MooseX::Signature::Function::Exception;
use Scalar::Util qw/blessed/;

extends qw/Moose::Meta::Method/;

with qw/MooseX::Signature::Function::Interface::Method/;

around wrap => sub {
  my ($next,$self,$code,%params) = @_;

  if (my $signature = $params{signature}) {
    MooseX::Signature::Function::Exception->throw ($signature->does ('argument (signature) is not an instance that does MooseX::Signature::Function::Interface::Signature'))
      unless blessed $signature && does_role ($signature,'MooseX::Signature::Function::Interface::Signature');
  
    my $validator = sub {
      my $method_self = shift;

      @_ = ($method_self,$signature->validate (@_));

      goto $code;
    };

    my $method = $self->$next ($validator,%params);

    $method->{'$!signature'} = $signature;

    $method->{'&!real_body'} = $code;

    return $method;
  }

  return $self->$next ($code,%params);
};

sub get_signature { $_[0]->{'$!signature'} }

sub get_real_body { $_[0]->{'&!real_body'} }

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Function::Meta::Method - Method metaclass

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

