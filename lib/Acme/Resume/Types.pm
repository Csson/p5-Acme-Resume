use Moops;
use strict;
use warnings;

# PODCLASSNAME

library Acme::Resume::Types

declares
    Education,
    Educations,
    Job,
    Jobs,
    TimeMoment {

    # VERSION
    # ABSTRACT: Declares types

    class_type TimeMoment => { class => 'Time::Moment' };
    class_type Education => { class => 'Acme::Resume::Types::Education' };
    class_type Job => { class => 'Acme::Resume::Types::Job' };

    coerce Education,
    from HashRef,
    via {
        'Acme::Resume::Types::Education'->new(%$_);
    };

    coerce Job,
    from HashRef,
    via {
        'Acme::Resume::Types::Job'->new(%$_);
    };

    declare Educations,
    as ArrayRef[Education],
    message { sprintf "Those are not Education objects." };

    coerce Educations,
    from ArrayRef[HashRef],
    via { [ map { 'Acme::Resume::Types::Education'->new($_) } @$_ ] };

    coerce Educations,
    from HashRef,
    via { [ 'Acme::Resume::Types::Education'->new(%$_) ] };


    declare Jobs,
    as ArrayRef[Job],
    message { sprintf "Those are not Job objects." };

    coerce Jobs,
    from ArrayRef[HashRef],
    via { [ map { 'Acme::Resume::Types::Job'->new($_) } @$_ ] };

    coerce Jobs,
    from HashRef,
    via { [ 'Acme::Resume::Types::Job'->new(%$_) ] };


    coerce TimeMoment,
    from Str,
    via { 
        $_ =~ m{^(?<month>\w*)    \s    # full month name
                 (?<day>\d{1,2}), \s    # day of month
                 (?<year>\d{4})         # year
            }x;

        my %months = (January => 1, February => 2, March => 3, April => 4, May => 5, June => 6, July => 7, August => 8, September => 9, October => 10, November => 11, December => 12);

        'Time::Moment'->new(year => $+{'year'},
                            month => $months{ $+{'month'} },
                            day => $+{'day'},
                        );
    };
}

1;
