FROM oraclelinux:7.6

USER root 

RUN groupadd -g 501 oinstall \
  && groupadd -g 502 dba \
  && groupadd -g 503 oper \
  && useradd -m -g oinstall -G oinstall,dba,oper -u 501 oracle \
  && echo 'oracle:oracle' | chpasswd

 RUN rpm --rebuilddb \
 && yum -y install file openssl lsof sudo sysstat tree wget which  \
 && yum clean all \
 && rm -rf /var/cache/yum/*

RUN echo "oracle ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && echo "Defaults !requiretty"  >> /etc/sudoers \
  && mkdir -p /opt/oracle \
  && mkdir -p /install \
  && mkdir -p /home/oracle/bin \
  && chown -R oracle:oinstall /opt/oracle \
  && chown -R oracle:oinstall /home/oracle/bin

COPY software/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm /install
COPY software/oracle-database-xe-18c-1.0-1.x86_64.rpm /install/
ENV ORACLE_DOCKER_INSTALL=true
RUN cd /install \
  && yum -y localinstall oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm  \
  && yum -y localinstall oracle-database-xe-18c-1.0-1.x86_64.rpm  \
  && yum clean all \
  && rm -rf /var/cache/yum/* \
  && rm -rf /install/oracle*.rpm

EXPOSE 1521 5500

RUN yum -y install vim
RUN yum -y install expect
COPY script.exp /script.exp
RUN chmod +x /script.exp 
ARG CACHEBUST=1 
RUN hostname
ARG CACHEBUST=2
RUN cat /etc/hosts
#RUN sed -i -e "s/^.*memlock.*//g" /etc/security/limits.d/oracle-database-preinstall-18c.conf \
#  &&  /script.exp 
#RUN sed -i -e "s/^.*memlock.*//g" /etc/security/limits.d/oracle-database-preinstall-18c.conf
#ARG CACHEBUST=1 
#RUN /script.exp 

# COPY scripts/manage-xe.sh /home/oracle/bin
# RUN chown oracle:oinstall /home/oracle/bin/manage-xe.sh \
#    && chmod 775 /home/oracle/bin/manage-xe.sh

# USER oracle
# WORKDIR /home/oracle

# ENV ORACLE_DOCKER_INSTALL=true \
#   ORACLE_BASE=/opt/oracle \
#   ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE \
#   PATH=/home/oracle/bin:/opt/oracle/product/18c/dbhomeXE/bin:$PATH \
#   NLS_DATE_FORMAT="dd/mm/yyyy:hh24:mi:ss" \
#   ORACLE_SID=XE


# RUN history -c

# CMD ["/home/oracle/bin/manage-xe.sh", "-o", "start"]
