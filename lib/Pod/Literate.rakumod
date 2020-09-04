unit grammar Pod::Literate:ver<0.0.1>;

token TOP { [ <pod> | <code> ]* }

token pod  { ^^  '=begin' <.ws> (\w+)
             .*? '=end'   <.ws> $0 \N* \n}
token code { [ ^^ <![=]> \N* \n]+ }

=begin pod

=head1 NAME

Pod::Literate - A library for parsing Raku files into Pod and Code

=head1 SYNOPSIS

=begin code :lang<raku>

use Pod::Literate;
Pod::Literate.parsefile($filename.IO);

=end code

=head1 DESCRIPTION

Pod::Literate is an extremely simple library for parsing Raku source files into Pod blocks
and Code blocks (i.e., everything that isn't a Pod block).  The goal of doing so is to
support basic L<literate programming|https://en.wikipedia.org/wiki/Literate_programming>
in Raku.  Pod::Literate is intended to be used with Pod::Weave::To::$format and/or
Pod::Tangle.

For additional details, please see the announcement blog post:
L<www.codesections.com/blog/weaving-raku|https://www.codesections.com/blog/weaving-raku>.

=head1 AUTHOR

codesections <daniel@codesections.com>

=head1 COPYRIGHT AND LICENSE

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod