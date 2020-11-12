###########################################################
# Dockerfile that builds a Mordhau Gameserver
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="esion@esion.net"

ENV STEAMAPPID 4940
ENV STEAMAPP ns2
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/esion-net/ns2_server-docker

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.20.1-1.1 \
	&& wget "${DLURL}/master/etc/entry.sh" -O "${HOMEDIR}/entry.sh" \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chmod 755 "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& rm -rf /var/lib/apt/lists/*

ENV NS2_NAME="NS2 Server" \
	NS2_PLAYERLIMIT=16 \
	NS2_PASSWORD="" \
	NS2_MODS=""
	
USER ${USER}

WORKDIR ${HOMEDIR}

VOLUME $STEAMAPPDIR

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 27015/udp 27016/udp 
