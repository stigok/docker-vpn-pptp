# docker-vpn-pptp

## Usage

```
make install
```

For some more details read the Makefile or the complete source itself.

```
cat Makefile
```

## Gotchas

- Using [phusion/baseimage][1] as the base image
- Container is running in privileged mode and using docker host network driver
- IP forwarding must be enabled and GRE packets must be properly forwarded
- `/var/log` is a mounted volume named `pptpd-logs`
- `chap-secrets` is on a mounted docker volume named `pptpd-users`
- Max connections set to 5
- Using DNS servers from OpenNIC project
- Expecting clients to use MSCHAPv2 with 128-bit MPPE encryption
- Verbosely logging clients on connect to `/var/log/`

## Credits

Forked from the great work of https://github.com/mobtitude/docker-vpn-pptp

[1]: https://github.com/phusion/baseimage-docker
