FROM ubuntu:latest
MAINTAINER QAutomatron

ENV PROXY_VER=0.8.8
ENV login=ledniy
ENV password=7728822

RUN apt-get -q update &&\
	DEBIAN_FRONTEND=noninteractive &&\
	apt-get -qy --force-yes dist-upgrade &&\
	# Install req software
	apt-get install -qy --force-yes  build-essential libevent-dev libssl-dev wget &&\
	# Install 3proxy
	wget https://github.com/z3APA3A/3proxy/archive/3proxy-${PROXY_VER}.tar.gz &&\
	tar xzfv 3proxy-${PROXY_VER}.tar.gz -C /tmp &&\
	# Enable anonymous mode
	echo '#define ANONYMOUS 1' >> /tmp/3proxy-3proxy-${PROXY_VER}/src/3proxy.h &&\
	make -C /tmp/3proxy-3proxy-${PROXY_VER} -f Makefile.Linux &&\
	make -C /tmp/3proxy-3proxy-${PROXY_VER} -f Makefile.Linux install &&\
	rm 3proxy-${PROXY_VER}.tar.gz &&\
	# For log to stdout
	ln -sf /dev/stdout /var/log/3proxy.log &&\
	# Clean
	apt-get purge -y --auto-remove build-essential wget &&\
	apt-get clean &&\
	rm -rf /var/lib/apt/lists/* /tmp/* &&\
	mkdir /var/log/3proxy/

# Add config file
ADD 3proxy.cfg /etc/3proxy/3proxy.cfg

# Ports
#EXPOSE 8080 3128

STOPSIGNAL SIGTERM

COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]

CMD [ "/usr/local/bin/3proxy", "/etc/3proxy/3proxy.cfg" ]
