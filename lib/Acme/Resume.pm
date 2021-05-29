package Acme::Resume;

# ABSTRACT: Write a human-readable resume in Perl
# AUTHORITY
our $VERSION = '0.0104';

use strict;
use warnings;

use base 'MoopsX::UsingMoose';
use Acme::Resume::Moose();
use Time::Moment;
use syntax();

sub import {
    my $class = shift;
    my %opts = @_;

    push @{ $opts{'imports'} ||= [] } => (
        'syntax' => ['qs'],
        'Acme::Resume::Moose' => [],
    );

    push @{ $opts{'traits'} ||= [] } => (
        'Acme::Resume::MoopsParserTrait',
    );

    $class->SUPER::import(%opts);
}

1;

=pod

=head1 SYNOPSIS

    use Acme::Resume;

    resume ExAmple {

        name 'Ex Ample';

        email 'ex@example.com';

        address ['Suburbia lane 1200', 'Townsville', 'USA'];

        phone '+1 (555) 123 4321';

        education { ... }

        education { ... }

        job { ... }

        job { ... }
    }

    1;

=head1 DESCRIPTION

Acme::Resume is a framework for writing human-readable, computer-executable, object-oriented résumés in Perl.

C<Acme::Resume> is a wrapper around L<Moops> that imports L<Acme::Resume::Moose>, which adds all the methods. It also adds
the L<Acme::Resume::MoopsParserTrait> which includes the C<resume> keyword (just an alias for a standard Moops C<class>) and
adds special handling of the package name:

If the package doesn't contain C<::>, as in the synopsis, the package name will have C<Acme::Resume::For::> automatically prepended.

=head1 METHODS

=head2 name

Your full name.

=head2 email

Your email address.

=head2 phone

Your phone number.

=head2 address

An array reference of address parts.

=head2 education

Can be used multiple times. Adds an L<Acme::Resume::Types::Education> to the list of educations.

=head2 job

Can be used multiple times. Adds a L<Acme::Resume::Types::Job> to the list of jobs.

=head1 USAGE

One way to read a résumé (apart from reading the source) is with one-liners:

    $ perl -MAcme::Resume::For::ExAmple -E 'say Acme::Resume::For::ExAmple->new->get_job(-1)->started->year'

The L<Acme::Resume::Output::ToPlain> role (used by default) adds a C<to_plain> method:

    $ perl -MAcme::Resume::For::Tester -E 'say Acme::Resume::For::Tester->new->to_plain'

=head1 TODO

More documentation and a complete example.

=cut
