Running the container
---------------------
If you start the container from scratch, you'll have to authorize access to the dropbox account by visiting a link shown in the terminal. NOTE: This container runs on the aioobe.service account.

You can avoid this step by starting / stopping the same container (i.e. *not* use the --rm option for docker run). See ./start.sh

Triggering an org-todo
----------------------
curl -v "http://HOST:9010/hooks/org-todo?file=handla.org&search-string=Test2"
