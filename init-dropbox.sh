#!/bin/sh
mount -o loop Dropbox.img Dropbox
./dropbox.py start
echo "Waiting for dropbox to start..."
while true
do
    STATUS=$(./dropbox.py status)
    case "$STATUS" in
      "Up to date")
        echo "Dropbox running and up to date!"
        break
        ;;
      *cli_link_nonce*)
        [ "$LINK_PRINTED" = true ] && echo -n "." || echo "$STATUS"
        LINK_PRINTED=true
        ;;
      *)
        echo "$STATUS"
        ;;
    esac
    sleep 1
done
