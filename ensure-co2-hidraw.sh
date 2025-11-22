#!/bin/bash

# ensure-co2-hidraw.sh

# be strict on errors
set -e


CONTAINER_ID="101"

echo "[DBG] running ensure-co-hidraw.sh"

# 1. Get config value
CONFIG_VALUE=$(grep dev0 /etc/pve/lxc/${CONTAINER_ID}.conf | cut -d "/" -f3- | cut -d ',' -f1)

# 2. Get real/system value
SYSTEM_VALUE=$(dmesg | grep "Holtek USB-zyTemp" | grep -o 'hidraw[0-9]')


echo "[DBG] CONFIG_VALUE: ${CONFIG_VALUE}"
echo "[DBG] SYSTEM_VALUE: ${SYSTEM_VALUE}"

if [ "${CONFIG_VALUE}" == "${SYSTEM_VALUE}" ]; then
  echo "[DBG] values are the same"
else
  echo "[DBG] values are different - replacing"
  sed -i "s/${CONFIG_VALUE}/${SYSTEM_VALUE}/" /etc/pve/lxc/${CONTAINER_ID}.conf

fi

exit 0

# EOF
