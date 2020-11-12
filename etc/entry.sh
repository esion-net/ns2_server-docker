#!/bin/bash
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" \
				+quit

bash "${STEAMAPPDIR}/x64/server_linux32" \
			-name "${NS2_NAME}" \
			-map "${NS2_MAP}" \
			-limit "${NS2_PLAYERLIMIT}"
			-mods "${NS2_MODS}" \

