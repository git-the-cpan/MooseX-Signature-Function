use Test::More;

use strict;
use warnings;

plan tests => 10;

use_ok ('MooseX::Signature::Function::Exception');

use_ok ('MooseX::Signature::Function::Interface::Parameter');

use_ok ('MooseX::Signature::Function::Interface::Signature');

use_ok ('MooseX::Signature::Function::Interface::Signature::Positional');

use_ok ('MooseX::Signature::Function::Interface::Signature::Named');

use_ok ('MooseX::Signature::Function::Interface::Signature::Combined');

use_ok ('MooseX::Signature::Function::Interface::Method');

use_ok ('MooseX::Signature::Function::Meta::Parameter');

use_ok ('MooseX::Signature::Function::Meta::Signature::Positional');

use_ok ('MooseX::Signature::Function::Meta::Method');

