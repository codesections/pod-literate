[![Actions Status](https://github.com/codesections/pod-literate/workflows/test/badge.svg)](https://github.com/codesections/pod-literate/actions)

NAME
====

Pod::Literate - A library for parsing Raku files into Pod and Code

SYNOPSIS
========

```raku
use Pod::Literate;
Pod::Literate.parsefile($filename.IO);
```

DESCRIPTION
===========

Pod::Literate is an extremely simple library for parsing Raku source files into Pod blocks and Code blocks (i.e., everything that isn't a Pod block). The goal of doing so is to support basic [literate programming](https://en.wikipedia.org/wiki/Literate_programming) in Raku. Pod::Literate is intended to be used with Pod::Weave::To::$format and/or Pod::Tangle.

For additional details, please see the announcement blog post: [www.codesections.com/blog/weaving-raku](https://www.codesections.com/blog/weaving-raku).

AUTHOR
======

codesections <daniel@codesections.com>

COPYRIGHT AND LICENSE
=====================

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

