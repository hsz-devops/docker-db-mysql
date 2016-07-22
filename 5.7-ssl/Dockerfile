# v1.0.0    2016-06-20     webmaster@highskillz.com
#
FROM mysql:5.7

MAINTAINER HighSkillz <webdev@highskillz.com>

# ------------------------------------------------------------
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
    && \
    apt-get install -y \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        openssl \
        ssl-cert \
        less \
        pwgen \
    && \
    echo "..."

# ------------------------------------------------------------
VOLUME [ "/var/lib/mysql", "/var/log/mysql" ]

# ------------------------------------------------------------
WORKDIR /opt/.docker-build/
ADD     ./src/  ./
RUN chmod -R a+x ./*.sh

# # since the mysql:5.7 runs the init scripts as mysql, we need to do this
# RUN echo "!includedir /opt/.docker-build/cnf/" >> /etc/mysql/my.cnf

ENV MYSQL_RANDOM_ROOT_PASSWORD=1

# ------------------------------------------------------------
# scripts in /docker-entrypoint-initdb.d are executed as user 'mysql'""
# RUN cp ./0000-ssl-and-sanity.sh /docker-entrypoint-initdb.d

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD ["mysqld"]
