#!/bin/bash
#Couchpotato Removal

user=$(_get_master_username)
systemctl disable --now -q couchpotato
rm /etc/systemd/system/couchpotato.service
rm -rf /opt/couchpotato
rm -rf /home/"${user}"/.config/couchpotato
rm -rf /opt/.venv/couchpotato
if [ -z "$(ls -A /opt/.venv)" ]; then
    rm -rf /opt/.venv
fi
rm -f /etc/nginx/apps/couchpotato.conf
systemctl reload nginx
rm /install/.couchpotato.lock
