![docker build automated](https://img.shields.io/docker/cloud/automated/dotriver/cups)
![docker build status](https://img.shields.io/docker/cloud/build/dotriver/cups)
![docker build status](https://img.shields.io/docker/pulls/dotriver/cups)

# CUPS with ton of drivers

Cups Server with `hplip` and `openprinting` drivers (~11000 drivers)

# Auto configuration parameters :

- CUPS_USER_ADMIN=admin          ( user to configure cups )
- CUPS_USER_PASSWORD=admin       ( password of this user )

# To use it on your local computer:

On the local machine, disable local Cups server and add this line to your `.profile`:
```
export CUPS_SERVER=IP_DU_SERVER_CUPS
```

# Compose file example

```
version: '3.1'

services:

  cups:
    build: .
    restart: unless-stopped
    environment:
      - CUPS_USER_ADMIN=admin
      - CUPS_USER_PASSWORD=admin
    ports:
      - 631:631/tcp
```