# docker-efs-mount

A docker tool to mount and access aws efs drives.


## Getting Started

### Dependencies

* Have docker installed.
* Have AWS credential set up.
* Make sure the default region was set up in credential. Check with 
```
aws configure get region
```
### Build

Ignore build if running from dockerhub
```
docker build -t efs-mount .
```

### Executing program

```
docker run -dit -e EFS_ID=$EFS_ID -v '$YOUR_AWS_CERT_PATH':'/root/.aws' --name jing8h-docker-efs-mount --privileged jing8h/docker-efs-mount
```
Replace the image name if build from local.

For example, if your EFS id is abcdef, your aws cert is under /Users/jack/.aws, the command would be:
```
docker run -dit -e EFS_ID=abcdef -v '/Users/jack/.aws':'/root/.aws' --name jing8h-docker-efs-mount --privileged jing8h/docker-efs-mount
```

Next, you can shell into the docker to access the drive.
```
docker exec -it jing8h-docker-efs-mount /bin/bash -c "bin/sh"
```

The mounted drive is under /mnt
```
cd /mnt
ls
```

### Clean up

You might not be able to stop your container if you don't unmount the drive.
Please cd out of /mnt and then unmount the drive before stopping the container.

```
umount -f /mnt
```

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

