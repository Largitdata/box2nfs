#!/bin/bash
trap "stop; exit 0;" SIGTERM SIGINT
mkdir /box

# escape whitespaces in password
echo "https://dav.box.com/dav ${BOX_USER} ${BOX_PW}" >> /etc/davfs2/secrets
chmod 600 /etc/davfs2/secrets

mount /box

/usr/sbin/exportfs -r
/sbin/rpcbind --
/usr/sbin/rpc.statd
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd -F
