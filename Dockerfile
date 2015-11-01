FROM ubuntu:15.04
MAINTAINER moremagic <itoumagic@gmail.com>

RUN apt-get update && apt-get install -y wget curl openssh-server openssh-client
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN apt-get install -y xauth dbus dbus-x11 x11-apps language-pack-ja-base language-pack-ja ibus-mozc
RUN sed -i -e 's/#11DisplayOffset 10/X11DisplayOffset 10/g' /etc/ssh/sshd_config
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN echo LANG="ja_JP.UTF-8" > /etc/idefaut/locale.conf
RUN echo LANGAGE="ja_JP.UTF-8" >> /etc/idefaut/locale.conf


RUN apt-get install -y firefox

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

