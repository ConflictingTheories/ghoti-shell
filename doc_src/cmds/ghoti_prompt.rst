.. _cmd-ghoti_prompt:

ghoti_prompt - define the appearance of the command line prompt
==============================================================

Synopsis
--------

::

  function ghoti_prompt
      ...
  end


Description
-----------

The ``ghoti_prompt`` function is executed when the prompt is to be shown, and the output is used as a prompt.

The exit status of commands within ``ghoti_prompt`` will not modify the value of :ref:`$status <variables-status>` outside of the ``ghoti_prompt`` function.

``ghoti`` ships with a number of example prompts that can be chosen with the ``ghoti_config`` command.


Example
-------

A simple prompt:



::

    function ghoti_prompt -d "Write out the prompt"
        printf '%s@%s%s%s%s> ' (whoami) (hostname | cut -d . -f 1) \
            (set_color $ghoti_color_cwd) (prompt_pwd) (set_color normal)
    end


