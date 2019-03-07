IMG="org-automation-service"
CONTAINER="org-automation"

if [ -z "$(docker images -q $IMG 2> /dev/null)" ]
then
    echo "*** IMAGE NOT FOUND. BUILDING..."
    docker build \
           --tag org-automation-service \
           .
else
    echo "*** IMAGE FOUND. SKIPPING BUILD."
fi

if [ -z "$(docker container ls -a -f name=^$CONTAINER --format '{{.Names}}')" ]
then
    echo "CONTAINER NOT FOUND. RUNNING FOR FIRST TIME."
    docker run \
           --interactive \
           --tty \
           --name "$CONTAINER" \
           --privileged \
           -p 9010:9010 \
           "$IMG"
else
    echo "CONTAINER FOUND. STARTING EXISTING CONTAINER."
    docker start \
           --attach \
           --interactive \
           "$CONTAINER"
fi
