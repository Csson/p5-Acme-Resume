# NAME

Acme::Resume - Write a humuan-readable rÃ©sumÃ© in Perl

# VERSION

Version 0.0001, released 2015-03-28.

# SYNOPSIS

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

# DESCRIPTION

Acme::Resume is a framework for writing human-readable, computer-executable, object-oriented résumés in Perl.

`Acme::Resume` is a wrapper around [Moops](https://metacpan.org/pod/Moops) that imports [Acme::Resume::Moose](https://metacpan.org/pod/Acme::Resume::Moose), which adds all the methods. It also adds
the [Acme::Resume::MoopsParserTrait](https://metacpan.org/pod/Acme::Resume::MoopsParserTrait) which includes the `resume` keyword (just an alias for a standard Moops `class`) and
adds special handling of the package name:

If the package doesn't contain `::`, as in the synopsis, the package name will have `Acme::Resume::For::` automatically prepended.

# METHODS

## name

Your full name.

## email

Your email address.

## phone

Your phone number.

## address

An array reference of address parts.

## education

Can be used multiple times. Adds an [Acme::Resume::Types::Education](https://metacpan.org/pod/Acme::Resume::Types::Education) to the list of educations.

## job

Can be used multiple times. Adds a [Acme::Resume::Types::Job](https://metacpan.org/pod/Acme::Resume::Types::Job) to the list of jobs.

# USAGE

One way to read a résumé (apart from reading the source) is with one-liners:

    $ perl -MAcme::Resume::For::ExAmple -E 'say Acme::Resume::For::ExAmple->new->get_job(-1)->started->year'

The [Acme::Resume::Output::ToPlain](https://metacpan.org/pod/Acme::Resume::Output::ToPlain) role (used by default) adds a `to_plain` method:

    $ perl -MAcme::Resume::For::Tester -E 'say Acme::Resume::For::Tester->new->to_plain'

# TODO

More documentation and a complete example.

# SOURCE

[https://github.com/Csson/p5-Acme-Resume](https://github.com/Csson/p5-Acme-Resume)

# HOMEPAGE

[https://metacpan.org/release/Acme-Resume](https://metacpan.org/release/Acme-Resume)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Erik Carlsson <info@code301.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
