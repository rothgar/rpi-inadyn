rpi-inadyn
---

Docker container for running [inadyn](https://github.com/troglobit/inadyn)

Compiled from [rpi-inadyn-build](https://github.com/rothgar/rpi-inadyn-build)

Run with
```
docker run -d -e SYSTEM=default@domains.google.com -e USERNAME=$USERNAME -e PASSWORD=$PASSWORD -e ALIAS=example.com rothgar/rpi-inadyn:1.99.15
```

If you need more runtime options then you can add an /etc/inadyn.conf file are change the run command.
