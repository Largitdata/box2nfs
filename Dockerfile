FROM alpine:3.6
MAINTAINER Ian Chen <ian@largitdata.com>

RUN apk add --no-cache davfs2 bash nfs-utils && \
    rm -rf /var/cache/apk/* /tmp/* && \
    rm -f /sbin/halt /sbin/poweroff /sbin/reboot && \
    mkdir -p /var/lib/nfs/rpc_pipefs && \
    mkdir -p /var/lib/nfs/v4recovery && \
    mkdir -p /box && \
    mkdir -p /root/.davfs2 && \
    echo "rpc_pipefs    /var/lib/nfs/rpc_pipefs rpc_pipefs      defaults        0       0" >> /etc/fstab && \
    echo "nfsd  /proc/fs/nfsd   nfsd    defaults        0       0" >> /etc/fstab && \
    echo "https://dav.box.com/dav /box davfs rw,user,noauto 0 0" >> /etc/fstab && \
    echo "/box *(rw,async,no_subtree_check,no_root_squash,insecure,fsid=0)" >> /etc/exports

COPY nfsd.sh /usr/bin/nfsd.sh
EXPOSE 111/udp 2049/tcp
RUN chmod +x /usr/bin/nfsd.sh
ENTRYPOINT ["/usr/bin/nfsd.sh"]

