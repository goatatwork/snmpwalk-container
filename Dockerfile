FROM alpine:3.13
RUN apk add --no-cache net-snmp-tools
ENTRYPOINT ["snmpwalk"]
