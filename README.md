rpi-inadyn
---

Docker container for running [inadyn](https://github.com/troglobit/inadyn) on ARM

Multi-stage build will compile from source and then copy the binary to the final container.

# Build

Just run `docker build -t inadyn .` to build a container.

# Customize

Create a config file for inadyn and ADD or mount it to /etc/inadyn.conf

Example inadyn.conf
```
# In-A-Dyn v2.0 configuration file format
period          = 300
user-agent      = Mozilla/5.0

# The FreeDNS username must be in lower case
# The password (max 16 chars) is case sensitive
provider freedns {
    username    = lower-case-username
    password    = case-sensitive-pwd
    hostname    = some.example.com
}
```

# Run

```
docker run -d rothgar/rpi-inadyn:v2.3.1
```
