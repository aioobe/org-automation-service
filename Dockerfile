FROM frolvlad/alpine-glibc
WORKDIR /root

# Install prerequisits
RUN apk update
RUN apk add wget python3 e2fsprogs emacs-nox

# Install Dropbox
# https://www.dropbox.com/install-linux
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
RUN wget -O dropbox.py 'https://www.dropbox.com/download?dl=packages/dropbox.py'
RUN chmod +x dropbox.py

# Prep Dropbox storage
RUN dd if=/dev/zero of=Dropbox.img bs=1M count=100
RUN mkfs.ext4 Dropbox.img

RUN mkdir Dropbox

COPY init-dropbox.sh .
COPY webhook .
COPY hooks.yaml .
COPY org-todo.sh .

CMD ./init-dropbox.sh ; ./webhook -port 9010 -verbose -hooks hooks.yaml
