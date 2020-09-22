.. _cmd-ghoti_config:

ghoti_config - start the web-based configuration interface
=========================================================

Synopsis
--------

::

    ghoti_config [TAB]

Description
-----------

``ghoti_config`` starts the web-based configuration interface.

The web interface allows you to view your functions, variables and history, and to make changes to your prompt and color configuration.

``ghoti_config`` starts a local web server and then opens a web browser window; when you have finished, close the browser window and then press the Enter key to terminate the configuration session.

``ghoti_config`` optionally accepts name of the initial configuration tab. For e.g. ``ghoti_config history`` will start configuration interface with history tab.

If the ``BROWSER`` environment variable is set, it will be used as the name of the web browser to open instead of the system default.


Example
-------

``ghoti_config`` opens a new web browser window and allows you to configure certain ghoti settings.
