#!/bin/bash
trap "stop; exit 0;" SIGTERM SIGINT

# escape whitespaces in password
echo "https://dav.box.com/dav ${BOX_USER} ${BOX_PW}" >> /etc/davfs2/secrets
chmod 600 /etc/davfs2/secrets
mount /box
echo "Exporting File System..."
/usr/sbin/exportfs -rv
echo "Starting NFS in the background..."
echo "Starting Mountd in the foreground..."
/usr/sbin/rpc.nfsd --debug 8 --no-udp --no-nfs-version 2 --no-nfs-version 3 |:
/usr/sbin/rpc.mountd --debug all --no-udp --no-nfs-version 2 --no-nfs-version 3 -F
