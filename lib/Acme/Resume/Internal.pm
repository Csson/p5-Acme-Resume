package Acme::Resume::Internal;

# VERSION
# ABSTRACT: Moops wrapper for internal use

use strict;
use warnings;

use base 'MoopsX::UsingMoose';

use Types::Standard();
use Types::URI();
use Acme::Resume::Types();

sub import {
    my $class = shift;
    my %opts = @_;

    push @{ $opts{'imports'} ||= [] } => (
        'Types::Standard' => ['-types'],
        'Types::URI' => ['-types'],
        'Acme::Resume::Types' => [{ replace => 1 }, '-types'],
    );

    $class->SUPER::import(%opts);
}

1;
