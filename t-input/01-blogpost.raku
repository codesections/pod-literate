=begin pod
+++
=begin comment
The extra line breaks here are currently needed to prevent Pod from collapsing
the text into a single line, breaking the TOML formatting for zola frontmatter.
Once the S<…> block from S26 is implemented (https://design.raku.org/S26.html#Space-preserving_text)
we can/should switch to that. 
=end comment
title = "Peas in a Pod6"

date = 2020-09-09T07:55:24-04:00

+++

Maybe you already know this, but it took me I<way> too long to realize it so I'm going to
talk about it anyway: B<Pod is not Pod6>.

<aside>

This post is entirely about the Pod6 documentation language.  If you're not familiar with
Pod6, it's a lightweight markup language that can be rendered to Markdown, HTML,
plaintext, or a variety of other output formats; you can think of it a bit like a more
powerful and flexible version of Markdown.  It was originally designed to L<make inline
Raku documentation |https://docs.raku.org/language/pod> as pleasant as possible to write,
but you can use it anywhere you might want to generate HTML or another output format – in
fact, I've started L<writing this blog
|https://github.com/codesections-personal/codesections/tree/master/pod-src> in Pod6.
There's even a dedicated L<editor |
https://zahatski.com/2020/7/22/1/podlite-open-source-pod6-markup-language-editor> for
writing Pod6 and rendering realtime HTML output.</aside>

I want to be clear about what I'm I<not> saying.  My point isn't that Pod6 is not L<POD |
https://perldoc.perl.org/perlpod.html>, aka Plain Ol' Documentation, the markup language
used for Perl 5 documentation.  That's I<true>, of course – Pod6 and POD are not the same
language – but I'm making a different point.

The point I'm making is that Pod6 and Pod aren't the same language any more that JSON and
JavaScript objects are the same language.  In fact, Pod6 and Pod have a relationship that
is exactly analogous to JSON and JavaScript objects: like JSON, Pod6 is a notation for
writing plaintext files that can be read both by humans and machines; like a JavaScript
object, Pod is an in-memory representation of that content.

Put differently, Pod6 is a B<markup language>, and Pod is a B<data format>. 

Here's an example of Pod6:

=begin code :lang<raku>
 =begin pod
 Hello, B<world>!
 =end pod
=end code

And here's some Raku code that reads that same Pod6, parses it into Pod, and then prints a
textual representation of the Pod (I<not> the Pod6).

=end pod

use Pod::Load;

my $pod = load(q:to/EOF/);
    =begin pod
    Hello, B<world>!
    =end pod
    EOF

$pod.raku.say

=begin pod

And here's the output produced by running that code (or by, you know, running the
L<tangled output | @/blog/weaving-raku/> of this post's L<source code |
https://github.com/codesections-personal/codesections/blob/master/pod-src/peas-in-a-pod6.raku>).

=begin code 
$[ Pod::Block::Named.new(
       name => "pod",
       config => {},
       contents => [ Pod::Block::Para.new(
                         config => {},
                         contents => [ "Hello, ",
                                       Pod::FormattingCode.new(
                                           type => "B",
                                           meta => [],
                                           config => {},
                                           contents => ["world"]),
                                       "!"])])]
=end code


=end pod
