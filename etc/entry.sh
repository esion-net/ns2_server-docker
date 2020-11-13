#!/bin/bash -l -c
exec "id"
exec "${STEAMCMDDIR}/steamcmd.sh" +login ${STEAM_USER} ${STEAM_PASS}\
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" \
				validate \
				+quit

exec "${STEAMAPPDIR}/x64/server_linux" \
			-name "${NS2_NAME}" \
			-map "${NS2_MAP}" \
			-limit "${NS2_PLAYERLIMIT}" \
			-mods "${NS2_MODS}"

