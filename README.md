flycheck-hdevtools
==================

A [Flycheck][] syntax checker based on [hdevtools][] for Haskell.

hdevtools is a syntax and type checker which caches information in persistent
background daemons, and thus checks faster than plain GHC.

This syntax checker split out from Flycheck until the end of November 2013,
because of various issues.  See
[#275](https://github.com/flycheck/flycheck/issues/275) for details.

Installation
------------

As usual, from [MELPA][] or [Marmalade][] via `M-x package-install`.

Or in your [`Cask`](https://github.com/cask/cask) file:

```lisp
(source gnu)
(source melpa)

(depends-on "flycheck-hdevtools")
```

Then, in your `init.el`:

```lisp
(eval-after-load 'flycheck
  '(require 'flycheck-hdevtools))

(global-flycheck-mode)
```

Make sure that the `hdevtools` binary is present on Emacs' `exec-path`, or
customize `flycheck-haskell-hdevtools-executable` to point to the `hdevtools`
binary.

Usage
-----

Just visit buffers with Haskell source.  Flycheck will automatically check these
with `hdevtools` then.

License
-------

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see http://www.gnu.org/licenses/.

See
[COPYING](https://github.com/flycheck/flycheck-hdevtools/blob/master/COPYING)
for details.

About
-----

`flycheck-hdevtools` is code originally submitted to `flycheck` by
[Steve Purcell](https://github.com/purcell).

<hr>

Author links:

[![](http://api.coderwall.com/purcell/endorsecount.png)](http://coderwall.com/purcell)

[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://uk.linkedin.com/in/stevepurcell)

[Steve Purcell's blog](http://www.sanityinc.com/) // [@sanityinc on Twitter](https://twitter.com/sanityinc)

[flycheck]: https://github.com/flycheck/flycheck
[tags]: https://github.com/flycheck/flycheck-hdevtools/tags
[hdevtools]: https://github.com/bitc/hdevtools
[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.milkbox.net
