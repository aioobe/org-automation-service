# org-automation-service
A Docker/Dropbox/webhook/emacs based service for automating updates to org files.

- Spins up a container configured with Dropbox.
- Starts serving HTTP requests on port 9010.
- Hitting `/hooks/org-todo?file=FILE&search-string=STRING` will
  1. Open `~/Dropbox/org/FILE`
  2. Search for `STRING` in the file
  3. Trigger `org-todo` which cycles the todo state
  4. Save the buffer

## Running the container
The first time you start the container, you'll have to authorize access to the dropbox account by visiting a link shown in the terminal.

**Important note:** The account you are logged in to in the browser will be the account associated with the container.

You can avoid this step by starting/stopping the same container (i.e. *not* use the `--rm` option for docker run). See `./start.sh`.

## Triggering an org-todo

    curl -v "http://HOST:9010/hooks/org-todo?file=work.org&search-string=Coffee"
