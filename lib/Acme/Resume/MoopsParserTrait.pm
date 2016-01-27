use strict;
use warnings;

package Acme::Resume::MoopsParserTrait;

# VERSION
# ABSTRACT: Trait for the Moops parser

use Moo::Role;
use Module::Runtime qw($module_name_rx);

around _eat_package => sub {
    my $next = shift;
    my $self = shift;
    my ($rel) = @_;

    my $pkg = $self->_eat(qr{(?:::)?$module_name_rx});

    if($pkg !~ m{::}) {
        $pkg = 'Acme::Resume::For::' . $pkg;
    }

    return $self->qualify_module_name($pkg, $rel);

};

after parse => sub {
    my $self = shift;

    if($self->keyword eq 'resume') {
        push @{ $self->relations->{'with'} ||= [] } => (
            'Acme::Resume::Output::ToPlain',
        );
    }
};

around keywords => sub {
    my $next = shift;
    my $self = shift;

    my @all = ('resume', $self->$next(@_));
    return @all;
};

around class_for_keyword => sub {
    my $next = shift;
    my $self = shift;

    if($self->keyword eq 'resume') {
        require Moops::Keyword::Class;
        return 'Moops::Keyword::Class';
    }

    return $self->$next(@_);
};

1;
