Flycheck checker for Haskell using hdevtools
============================================

This library provides a [flycheck][flycheck] checker for Haskell
source code using [hdevtools][hdevtools]. The checker was split out
from the main `flycheck` codebase at the end of November 2013.

**Latest stable version**: see the
[latest numbered tag][tags],
which will also be the latest version available via Marmalade.

Installation
============

If you're an Emacs 24 user or you have a recent version of
`package.el` you can install this package from the [MELPA][melpa]
repository. The version of `haskell-hdevtools` there will always be
up-to-date. There are also packages in [Marmalade][marmalade].

Otherwise, first ensure `flycheck` is installed, then download this
code and add the directory to your Emacs `load-path`.

Then, simply `(require 'flycheck-hdevtools)` to add this checker to
`flycheck`'s list of active checkers.

Note the `hdevtools` binary must be present on Emacs' `exec-path` for
the checker to be activated.

[flycheck]: https://github.com/flycheck/flycheck
[tags]: https://github.com/flycheck/flycheck-hdevtools/tags
[hdevtools]: https://github.com/bitc/hdevtools
[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.milkbox.net

About
=====

`flycheck-hdevtools` is code originally submitted to `flycheck` by
[Steve Purcell](https://github.com/purcell).

<hr>

Author links:

[![](http://api.coderwall.com/purcell/endorsecount.png)](http://coderwall.com/purcell)

[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://uk.linkedin.com/in/stevepurcell)

[Steve Purcell's blog](http://www.sanityinc.com/) // [@sanityinc on Twitter](https://twitter.com/sanityinc)
