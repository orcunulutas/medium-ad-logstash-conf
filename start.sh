#!/bin/sh

LOGSTASH_NAME="badPassword"
WORKDIR="/badpassword"


nohup ${WORKDIR}/logstash/bin/logstash \
--node.name "${LOGSTASH_NAME}" \
--path.data ${WORKDIR}/data/${LOGSTASH_NAME} \
--config.reload.automatic \
-f ${WORKDIR}/config/badPassword-log_logstash.json > ../scripts/nohup_${LOGSTASH_NAME}.out 2>&1 &



echo "${WORKDIR}/logstash/bin/logstash \
--node.name "${LOGSTASH_NAME}" \
--path.data ${WORKDIR}/data/${LOGSTASH_NAME} \
--config.reload.automatic \
-f ${WORKDIR}/config/badPassword-log_logstash.json > /badpassword/log/nohup_${LOGSTASH_NAME}.out 2>&1 &" >> log.log


tail -f ../scripts/nohup_${LOGSTASH_NAME}.out
