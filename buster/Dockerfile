###########################################################
# Dockerfile that builds a NS2 Gameserver
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="esion@esion.net"

ENV STEAMAPPID 4940
ENV STEAMAPP ns2
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV CONFIGDIR "${HOMEDIR}/.config"
ENV DLURL https://raw.githubusercontent.com/esion-net/ns2_server-docker

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.20.1-1.1 \
	&& wget "${DLURL}/main/etc/entry.sh" -O "${HOMEDIR}/entry.sh" --no-cache \
	&& mkdir -p "${STEAMAPPDIR}" "${CONFIGDIR}" \
	&& chmod 755 "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" "${CONFIGDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" "${CONFIGDIR}" \
	&& rm -rf /var/lib/apt/lists/*

ENV NS2_NAME="NS2 Server" \
	NS2_PLAYERLIMIT=16 \
	NS2_PASSWORD="" \
	NS2_MODS=""
	
USER ${USER}

WORKDIR ${HOMEDIR}

VOLUME "${STEAMAPPDIR}" \
	"${CONFIGDIR}"

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 8766/udp 27015/udp 27016/udp 
