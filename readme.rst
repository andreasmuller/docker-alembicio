Alembic & Docker
================

This repo is just a bit of fun with building a Microservice to query the contents of Alembic files, using alembic binaries, and a custom PyAlembic script.

Usage
-----

You'll need to install docker: https://www.docker.com/community-edition#/download

.. code::

  $ make build run

The service can be invoked with:

``curl --data-binary "@test_data/rocket.abc" http://localhost:9090/abcecho``

``curl --data-binary "@test_data/rocket.abc" http://localhost:9090/abctree``

``curl --data-binary "@test_data/rocket.abc" http://localhost:9090/pyalembic``
