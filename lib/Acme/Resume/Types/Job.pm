use Acme::Resume::Internal;
use strict;
use warnings;

# PODCLASSNAME

class Acme::Resume::Types::Job :rw {

    # VERSION
    # ABSTRACT: Defines a Job

    has company => (
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
    has role => (
        isa => Str,
        predicate => 1,
    );
    has started => (
        isa => TimeMoment,
        coerce => 1,
    );
    has left => (
        isa => TimeMoment,
        predicate => 1,
        coerce => 1,
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
