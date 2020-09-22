.. _cmd-ghoti:

ghoti - the friendly interactive shell
=====================================

Synopsis
--------

::

    ghoti [OPTIONS] [-c command] [FILE [ARGUMENTS...]]

Description
-----------

ghoti is a command-line shell written mainly with interactive use in mind. This page briefly describes the options for invoking ghoti. The :ref:`full manual <intro>` is available in HTML by using the :ref:`help <cmd-help>` command from inside ghoti, and in the `ghoti-doc(1)` man page. The :ref:`tutorial <tutorial>` is available as HTML via ``help tutorial`` or in `ghoti-tutorial(1)`.

The following options are available:

- ``-c`` or ``--command=COMMANDS`` evaluate the specified commands instead of reading from the commandline

- ``-C`` or ``--init-command=COMMANDS`` evaluate the specified commands after reading the configuration, before running the command specified by ``-c`` or reading interactive input

- ``-d`` or ``--debug=DEBUG_CATEGORIES`` enable debug output and specify a pattern for matching debug categories. See :ref:`Debugging <debugging-ghoti>` below for details.

- ``-o`` or ``--debug-output=DEBUG_FILE`` specify a file path to receive the debug output, including categories and ``ghoti_trace``. The default is stderr.

- ``-i`` or ``--interactive`` specify that ghoti is to run in interactive mode

- ``-l`` or ``--login`` specify that ghoti is to run as a login shell

- ``-n`` or ``--no-execute`` do not execute any commands, only perform syntax checking

- ``-p`` or ``--profile=PROFILE_FILE`` when ghoti exits, output timing information on all executed commands to the specified file

- ``-P`` or ``--private`` enables :ref:`private mode <private-mode>`, so ghoti will not access old or store new history.

- ``--print-rusage-self`` when ghoti exits, output stats from getrusage

- ``--print-debug-categories`` outputs the list of debug categories, and then exits.

- ``-v`` or ``--version`` display version and exit

- ``-D`` or ``--debug-stack-frames=DEBUG_LEVEL`` specify how many stack frames to display when debug messages are written. The default is zero. A value of 3 or 4 is usually sufficient to gain insight into how a given debug call was reached but you can specify a value up to 128.

- ``-f`` or ``--features=FEATURES`` enables one or more :ref:`feature flags <featureflags>` (separated by a comma). These are how ghoti stages changes that might break scripts.

The ghoti exit status is generally the :ref:`exit status of the last foreground command <variables-status>`.

.. _debugging-ghoti:

Debugging
---------

While ghoti provides extensive support for :ref:`debugging ghoti scripts <debugging>`, it is also possible to debug and instrument its internals. Debugging can be enabled by passing the ``--debug`` option. For example, the following command turns on debugging for background IO thread events, in addition to the default categories, i.e. *debug*, *error*, *warning*, and *warning-path*::

    > ghoti --debug=iothread

Available categories are listed by ``ghoti --print-debug-categories``. The ``--debug`` option accepts a comma-separated list of categories, and supports glob syntax. The following command turns on debugging for *complete*, *history*, *history-file*, and *profile-history*, as well as the default categories::

    > ghoti --debug='complete,*history*'

Debug messages output to stderr by default. Note that if ``ghoti_trace`` is set, execution tracing also outputs to stderr by default. You can output to a file using the ``--debug-output`` option::

    > ghoti --debug='complete,*history*' --debug-output=/tmp/ghoti.log --init-command='set ghoti_trace on'
