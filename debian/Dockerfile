FROM debian:stretch-slim

MAINTAINER Guillaume CONNAN "guillaume.connan44@gmail.com"

LABEL version="0.3.0"               \
      jre_version="1.8.0_144"       \
      minecraft_version="1.12.1"

ENV DEBIAN_FRONTEND noninteractive

RUN (                                                                                                                                  \
        echo "deb http://deb.debian.org/debian stretch main contrib non-free"                                                          \
             >  /etc/apt/sources.list                                                                                               && \
        echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free"                                                  \
             >> /etc/apt/sources.list                                                                                               && \
        echo "deb http://security.debian.org stretch/updates main contrib non-free"                                                    \
             >> /etc/apt/sources.list                                                                                               && \
        apt-get update                                                                                                              && \
        apt-get -y -q upgrade                                                                                                       && \
        apt-get -y -q dist-upgrade                                                                                                  && \
        apt-get -y -q autoclean                                                                                                     && \
        apt-get -y -q autoremove                                                                                                    && \
        apt-get -y -q install sudo                                                                                                     \
                              screen                                                                                                   \
                              cron                                                                                                     \
                              wget                                                                                                  && \
        groupadd -g 1000 minecraft                                                                                                  && \
        useradd -u 1000 -s /bin/false -d /minecraft -g minecraft minecraft                                                          && \
        mkdir /minecraft                                                                                                            && \
        chown -R minecraft:minecraft /minecraft                                                                                     && \
        wget --quiet                                                                                                                   \
             --continue                                                                                                                \
             --no-check-certificate                                                                                                    \
             --header "Cookie: oraclelicense=a"                                                                                        \
             --output-document /opt/jre-8u144-linux-x64.tar.gz                                                                         \
             "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jre-8u144-linux-x64.tar.gz"    && \
        tar xvf /opt/jre-8u144-linux-x64.tar.gz -C /opt/                                                                            && \
        rm -fr /opt/*.tar.gz                                                                                                        && \
        mv /opt/jre* /opt/jre                                                                                                       && \
        chown -R root:root /opt/jre                                                                                                 && \
        wget --quiet                                                                                                                   \
             --output-document /opt/minecraft_server.jar                                                                               \
             "https://s3.amazonaws.com/Minecraft.Download/versions/1.12.1/minecraft_server.1.12.1.jar"                              && \
        apt-get -y -q purge wget                                                                                                    && \
        apt-get -y -q autoremove                                                                                                    && \
        apt-get clean                                                                                                               && \
        rm -fr /tmp/*                                                                                                               && \
        rm -fr /var/tmp/*                                                                                                           && \
        rm -fr /var/lib/apt/lists/*                                                                                                    \
    )

ENV PATH            "$PATH:/opt/jre/bin"
ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/opt/jre/lib/amd64:/opt/jre/lib/amd64/server"

COPY run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

USER root
EXPOSE 25565
VOLUME ["/minecraft"]
CMD ["run.sh"]
