# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt-get update && apt-get install -y pptpd iptables

# Setup service
RUN mkdir -p /etc/service/pptpd
ADD etc/service/pptpd/run /etc/service/pptpd/run
RUN chmod +x etc/service/pptpd/run

# Enable IPv4 forwarding
RUN echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/30-ipforward.conf

# Startup scripts
RUN mkdir -p /etc/my_init.d
ADD etc/my_init.d/iptables.sh /etc/my_init.d/iptables.sh
ADD etc/my_init.d/logfile-init.sh /etc/my_init.d/logfile-init.sh
RUN chmod +x /etc/my_init.d/*

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

