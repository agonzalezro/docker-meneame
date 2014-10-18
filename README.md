meneame's docker container
==========================

**Disclaimer:** This a work in progress, user it on your own responsability.

Run the meneame.net application inside a docker container.

The init script will fill a DB for you if you don't define your own volume with
the meneame DB.

Quick start
-----------

    docker run -d -p 80:80 --name meneame agonzalezro/meneame

Notes
-----

The container will also expose the port 3306 (MySQL) in case that you need it.
