# docker-vpn-pptp

Based on the great work of https://github.com/mobtitude/docker-vpn-pptp

## Differences from mobtitude/docker-vpn-pptp

- Using phusion/baseimage as base image
- Lots of other stuff... See history for details

## Gotchas

- `/var/log` is a mounted volume named `pptpd-logs`
- `chap-secrets` is on a mounted docker volume named `pptpd-users`
