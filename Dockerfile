FROM isdnetworks/centos:8-ko
LABEL maintainer="is:-D Networks Docker Maintainers <jhcheong@isdnetworks.pe.kr>"

ADD geth-alltools-linux-amd64-1.9.25-e7872729.tar.gz /usr/local/
WORKDIR /usr/local/geth-alltools-linux-amd64-1.9.25-e7872729
RUN chown -R 0:0 . \
 && cp * /usr/bin \
 && cd .. \
 && rm -rf geth-alltools-linux-amd64-1.9.25-e7872729 \
 && useradd -m -s /bin/bash -u 1000 ethereum

WORKDIR /home/ethereum
USER ethereum
RUN mkdir .ethereum .ethash \
 && chmod 700 .ethereum .ethash

VOLUME ["/home/ethereum/.ethereum", "/home/ethereum/.ethash"]

EXPOSE 30303/tcp 30303/udp 8545/tcp 8546/tcp

STOPSIGNAL SIGINT

CMD ["geth"]

