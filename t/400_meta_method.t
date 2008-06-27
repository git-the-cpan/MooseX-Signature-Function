use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Function::Meta::Parameter;
use MooseX::Signature::Function::Meta::ParameterSet::Positional;
use MooseX::Signature::Function::Meta::Signature;
use MooseX::Signature::Function::Meta::Method;

use strict;
use warnings;

plan tests => 8;

# create, interface, no-signature

{
  my $method = MooseX::Signature::Function::Meta::Method->wrap (sub {},package_name => 'Foo',name => 'bar');

  isa_ok $method,'MooseX::Signature::Function::Meta::Method';

  does_ok $method,'MooseX::Signature::Function::Interface::Method';

  can_ok $method,'get_signature';

  can_ok $method,'get_real_body';

  can_ok $method,'get_input_parameters';

  can_ok $method,'get_output_parameters';
}

# signature

{
  my $signature = MooseX::Signature::Function::Meta::Signature->new (input_parameters =>
    MooseX::Signature::Function::Meta::ParameterSet::Positional->new (positional_parameters => [
        MooseX::Signature::Function::Meta::Parameter->new (required => 1),
      ],
    ),
  );

  my $method = MooseX::Signature::Function::Meta::Method->wrap (sub { @_ },
    package_name => 'Foo',
    name         => 'bar',
    signature    => $signature,
  );

  is_deeply [&{ $method }(undef,42,84)],[undef,42,84];

  throws_ok { &{ $method }(42) } qr/Parameter \(0\): Parameter is required/;
}

