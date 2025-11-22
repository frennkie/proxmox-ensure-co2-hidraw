# proxmox-ensure-co2-hidraw
On Proxmox ensure the correct hidraw for co2 monitoring

systemctl daemon-reload
systemctl enable ensure-co2-hidraw.service
systemctl start ensure-co2-hidraw.service
