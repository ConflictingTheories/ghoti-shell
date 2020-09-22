`Ghoti `__ - the friendly interactive shell |Build Status|
=================================================================================

Ghoti is a Joke first and foremost - lookup the word on [wikipedia](https://en.wikipedia.org/wiki/Ghoti) and you will see it is a joke based on english linguistics.

Since there is a [Fish Shell](https://fishshell.com/) - I have decided to fork the project for fun and have Ghotishell

Ghoti is a smart and user-friendly command line shell for macOS, Linux,
and the rest of the family. ghoti includes features like syntax
highlighting, autosuggest-as-you-type, and fancy tab completions that
just work, with no configuration required.

For more on ghoti’s design philosophy, see the `design
document <https://ghotishell.com/docs/current/design.html>`__.

Quick Start
-----------

Ghoti generally works like other shells, like bash or zsh. A few
important differences can be found at 
https://fishshell.com/docs/current/tutorial.html (just replace everything with ghoti where its fish) by searching for the
magic phrase “unlike other shells”.

Detailed user documentation is available by running ``help`` within
ghoti, and also at https://fishshell.com/docs/current/index.html (again - just replace fish with ghoti)

You can quickly play with ghoti right in your browser by clicking the
button below:

|Try in browser|

Getting Ghoti
------------

Building from source
~~~~~~~~~~~~~~~~~~~~

*Building* section for instructions.

* Apologies -- I doubt I will be able to do justice to this - please check out the official shell ([fish-shell](https://github.com/fish-shell/fish-shell)) for options

Running Ghoti
------------

Once installed, run ``ghoti`` from your current shell to try ghoti out!

Dependencies
~~~~~~~~~~~~

Running ghoti requires:

-  curses or ncurses (preinstalled on most \*nix systems)
-  some common \*nix system utilities (currently ``mktemp``), in
   addition to the basic POSIX utilities (``cat``, ``cut``, ``dirname``,
   ``ls``, ``mkdir``, ``mkfifo``, ``rm``, ``sort``, ``tee``, ``tr``,
   ``uname`` and ``sed`` at least, but the full coreutils plus find, sed
   and awk is preferred)
-  The gettext library, if compiled with
   translation support

The following optional features also have specific requirements:

-  builtin commands that have the ``--help`` option or print usage
   messages require ``ul`` and either ``nroff`` or ``mandoc`` for
   display
-  automated completion generation from manual pages requires Python 3.5+
-  the ``ghoti_config`` web configuration tool requires Python 3.5+ and a web browser
-  system clipboard integration (with the default Ctrl-V and Ctrl-X
   bindings) require either the ``xsel``, ``xclip``,
   ``wl-copy``/``wl-paste`` or ``pbcopy``/``pbpaste`` utilities
-  full completions for ``yarn`` and ``npm`` require the
   ``all-the-package-names`` NPM module

Switching to ghoti
~~~~~~~~~~~~~~~~~

If you wish to use ghoti as your default shell, use the following
command:

::

   chsh -s /usr/local/bin/ghoti

``chsh`` will prompt you for your password and change your default
shell. (Substitute ``/usr/local/bin/ghoti`` with whatever path ghoti was
installed to, if it differs.) Log out, then log in again for the changes
to take effect.

Use the following command if ghoti isn’t already added to ``/etc/shells``
to permit ghoti to be your login shell:

::

   echo /usr/local/bin/ghoti | sudo tee -a /etc/shells

To switch your default shell back, you can run ``chsh -s /bin/bash``
(substituting ``/bin/bash`` with ``/bin/tcsh`` or ``/bin/zsh`` as
appropriate).

Building
--------

.. _dependencies-1:

Dependencies
~~~~~~~~~~~~

Compiling ghoti requires:

-  a C++11 compiler (g++ 4.8 or later, or clang 3.3 or later)
-  CMake (version 3.2 or later)
-  a curses implementation such as ncurses (headers and libraries)
-  PCRE2 (headers and libraries) - a copy is included with ghoti
-  gettext (headers and libraries) - optional, for translation support

Sphinx is also optionally required to build the documentation from a
cloned git repository.

Additionally, running the test suite requires Python 3.5+ and the pexpect package.

Building from source (all platforms) - Makefile generator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install into ``/usr/local``, run:

.. code:: bash

   mkdir build; cd build
   cmake ..
   make
   sudo make install

The install directory can be changed using the
``-DCMAKE_INSTALL_PREFIX`` parameter for ``cmake``.

Building from source (macOS) - Xcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: bash

   mkdir build; cd build
   cmake .. -G Xcode

An Xcode project will now be available in the ``build`` subdirectory.
You can open it with Xcode, or run the following to build and install in
``/usr/local``:

.. code:: bash

   xcodebuild
   xcodebuild -scheme install

The install directory can be changed using the
``-DCMAKE_INSTALL_PREFIX`` parameter for ``cmake``.

Help, it didn’t build!
~~~~~~~~~~~~~~~~~~~~~~

If ghoti reports that it could not find curses, try installing a curses
development package and build again.

On Debian or Ubuntu you want:

::

   sudo apt-get install build-essential cmake ncurses-dev libncurses5-dev libpcre2-dev gettext

On RedHat, CentOS, or Amazon EC2:

::

   sudo yum install ncurses-devel

Contributing Changes to the Code
--------------------------------

See the `Guide for Developers <CONTRIBUTING.rst>`__.

Contact Us
----------

Questions, comments, rants and raves can be posted to the official ghoti
mailing list at https://lists.sourceforge.net/lists/listinfo/ghoti-users
or join us on our `gitter.im
channel <https://gitter.im/ghoti-shell/ghoti-shell>`__. Or use the `ghoti
tag on
Stackoverflow <https://stackoverflow.com/questions/tagged/ghoti>`__ for
questions related to ghoti script and the `ghoti tag on
Superuser <https://superuser.com/questions/tagged/ghoti>`__ for all other
questions (e.g., customizing colors, changing key bindings).

Found a bug? Have an awesome idea? Please `open an
issue <https://github.com/ghoti-shell/ghoti-shell/issues/new>`__.

.. |Build Status| image:: https://travis-ci.org/ghoti-shell/ghoti-shell.svg?branch=master
   :target: https://travis-ci.org/ghoti-shell/ghoti-shell
.. |Try in browser| image:: https://cdn.rawgit.com/rootnroll/library/assets/try.svg
   :target: https://rootnroll.com/d/ghoti-shell/
