#!/bin/bash

useradd --no-create-home --shell /bin/false prometheus
mkdir /etc/prometheus
mkdir /var/lib/prometheus
wget -P /root/ https://github.com/prometheus/prometheus/releases/download/v2.11.1/prometheus-2.11.1.linux-amd64.tar.gz
tar -C /root/ -xvzf /root/prometheus-2.11.1.linux-amd64.tar.gz
mv /root/prometheus-2.11.1.linux-amd64 /root/prometheus-files
cp -v /root/prometheus-files/./prometheus /usr/local/bin/
cp -v /root/prometheus-files/./promtool /usr/local/bin/
cp -vr /root/prometheus-files/consoles /etc/prometheus
cp -vr /root/prometheus-files/console_libraries /etc/prometheus
cp -v /root/prometheus-files/prometheus.yml /etc/prometheus
wget -P /etc/systemd/system https://github.com/carnagebek/somestuff/blob/master/prometheus.service
chown -R prometheus:prometheus /etc/prometheus
chown -R prometheus:prometheus /var/lib/prometheus
chown prometheus:prometheus /usr/local/bin/prometheus
chown prometheus:prometheus /usr/local/bin/promtool
systemctl enable prometheus.service
systemctl start prometheus.service

