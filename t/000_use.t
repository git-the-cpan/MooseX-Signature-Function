use Test::More;

use strict;
use warnings;

plan tests => 12;

use_ok ('MooseX::Signature::Function::Exception');

use_ok ('MooseX::Signature::Function::Interface::Parameter');

use_ok ('MooseX::Signature::Function::Interface::ParameterSet');

use_ok ('MooseX::Signature::Function::Interface::ParameterSet::Positional');

use_ok ('MooseX::Signature::Function::Interface::ParameterSet::Named');

use_ok ('MooseX::Signature::Function::Interface::Signature');

use_ok ('MooseX::Signature::Function::Interface::Method');

use_ok ('MooseX::Signature::Function::Meta::Parameter');

use_ok ('MooseX::Signature::Function::Meta::ParameterSet::Null');

use_ok ('MooseX::Signature::Function::Meta::ParameterSet::Positional');

use_ok ('MooseX::Signature::Function::Meta::Signature');

use_ok ('MooseX::Signature::Function::Meta::Method');

