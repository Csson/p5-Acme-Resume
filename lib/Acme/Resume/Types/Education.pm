use Acme::Resume::Internal;
use strict;
use warnings;

# ABSTRACT: Defines an education
# PODNAME: Acme::Resume::Types::Education
our $VERSION = '0.0104';

class Acme::Resume::Types::Education :rw {

    has school => (
        isa => Str,
        predicate => 1,
    );
    has url => (
        isa => Uri,
        coerce => 1,
        predicate => 1,
    );
    has location => (
        isa => Str,
        predicate => 1,
    );
    has program => (
        isa => Str,
        predicate => 1,
    );
    has started => (
        isa => TimeMoment,
        coerce => 1,
    );
    has left => (
        isa => TimeMoment,
        coerce => 1,
        predicate => 1,
    );
    has current => (
        isa => Bool,
        default => 0,
    );
    has description => (
        isa => Str,
    );

}

1;
