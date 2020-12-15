from dotriver/ubuntu-s6

ENV DEBIAN_FRONTEND noninteractive
ENV HPLIP_VERSION 3.20.11

run apt update && \
	apt install -y cups cups-pdf cups-filters wget \
                   foomatic-db-compressed-ppds openprinting-ppds openprinting-ppds printer-driver-all \
        --no-install-recommends &&\
	apt clean &&\
	apt auto-clean

RUN  wget http://prdownloads.sourceforge.net/hplip/hplip-${HPLIP_VERSION}.tar.gz -O /tmp/hplip.tar.gz &&\
     apt install -y build-essential libjpeg-dev libsnmp-dev libcups2-dev libusb-1.0-0-dev python3-dev libsane-dev libdbus-1-dev libavahi-client-dev libavahi-core-dev &&\
     tar xvfz /tmp/hplip.tar.gz &&\
     cd hplip-${HPLIP_VERSION} &&\
     sh configure && make -j 4 && make install &&\
     apt remove -y build-essential libjpeg-dev libsnmp-dev libcups2-dev libusb-1.0-0-dev python3-dev libsane-dev libdbus-1-dev libavahi-client-dev libavahi-core-dev &&\
     cd / && rm hplip-${HPLIP_VERSION} -r || true

ADD conf/ /
