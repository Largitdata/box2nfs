# Box davfs2 to nfsv4

## Getting Started

```
# Set two env var
export BOX_USER=ianchen@gmail.com
export BOX_PW=big\ apple\ iphone\ nice
```


```
docker run -p 127.0.0.1:111:111 -p 127.0.0.1:2049:2049 --privileged -it --rm davfs2-service:1506598896 /bin/bash
```
