.. _cmd-ghoti_add_path:

ghoti_add_path - add to the path
==============================================================

Synopsis
--------

::

   ghoti_add_path [paths...]
   ghoti_add_path (-h | --help)
   ghoti_add_path [(-g | --global) | (-U | --universal) | (-P | --path)] [(-m | --move)] [(-a | --append) | (-p | --prepend)] [(-v | --verbose) | (-n | --dry-run)] [paths...]


Description
-----------

``ghoti_add_path`` is a simple way to add more components to ghoti's $PATH. It does this by adding the components either to $ghoti_user_paths or directly to $PATH (if the ``--path`` switch is given).

It is (by default) safe to use ``ghoti_add_path`` in config.ghoti, or it can be used once, interactively, and the paths will stay in future because of :ref:`universal variables <variables-universal>`. This is a "do what I mean" style command, if you need more control, consider modifying the variable yourself.

Components are normalized by :ref:`realpath <cmd-realpath>`. This means that trailing slashes are ignored and relative paths are made absolute (but symlinks are not resolved). If a component already exists, it is not added again and stays in the same place unless the ``--move`` switch is given.

Components are added in the order they are given, and they are prepended to the path unless ``--append`` is given (if $ghoti_user_paths is used, that means they are last in $ghoti_user_paths, which is itself prepended to $PATH, so they still stay ahead of the system paths).

If no component is new, the variable ($ghoti_user_paths or $PATH) is not set again or otherwise modified, so variable handlers are not triggered.

If a component is not an existing directory, ``ghoti_add_path`` ignores it.

Options
-------

- ``-a`` or ``--append`` causes the components to be added to the *end* of the variable
- ``-p`` or ``--prepend`` causes the components to be added to the *front* of the variable (this is the default)
- ``-g`` or ``--global`` means to use a global $ghoti_user_paths
- ``-U`` or ``--universal`` means to use a universal $ghoti_user_paths - this is the default if it doesn't already exist
- ``-P`` or ``--path`` means to use $PATH directly
- ``-m`` or ``--move`` means to move already existing components to the place they would be added - by default they would be left in place and not added again
- ``-v`` or ``--verbose`` means to print the :ref:`set <cmd-set>` command used
- ``-n`` or ``--dry-run`` means to print the ``set`` command that would be used without executing it

If ``--move`` is used, it may of course lead to the path swapping order, so you should be careful doing that in config.ghoti.


Example
-------


::

   # I just installed mycoolthing and need to add it to the path to use it.
   ghoti_add_path /opt/mycoolthing/bin

   # I want my ~/.local/bin to be checked first.
   ghoti_add_path -m ~/.local/bin

   # I prefer using a global ghoti_user_paths
   ghoti_add_path -g ~/.local/bin ~/.otherbin /usr/local/sbin

   # I want to append to the entire $PATH because this directory contains fallbacks
   ghoti_add_path -aP /opt/fallback/bin

   # I want to add the bin/ directory of my current $PWD (say /home/nemo/)
   > ghoti_add_path -v bin/
   set ghoti_user_paths /home/nemo/bin /usr/bin /home/nemo/.local/bin

   # I have installed ruby via homebrew
   ghoti_add_path /usr/local/opt/ruby/bin
