use Acme::Resume::Internal;
use strict;
use warnings;

# ABSTRACT: Defines a Job
# PODNAME: Acme::Resume::Types::Job
our $VERSION = '0.0103';

class Acme::Resume::Types::Job :rw {

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
