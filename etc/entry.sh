#!/bin/bash
echo "Steam Login with user ${STEAM_USER}"
bash "${STEAMCMDDIR}/steamcmd.sh" +login ${STEAM_USER} ${STEAM_PASS}\
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" \
				+quit

echo "Starting ${NS2_NAME} (${NS2_PLAYERLIMIT} slots)"
bash "${STEAMAPPDIR}/x64/server_linux" \
			-name "${NS2_NAME}" \
			-map "${NS2_MAP}" \
			-limit "${NS2_PLAYERLIMIT}" \
			-mods "${NS2_MODS}"

