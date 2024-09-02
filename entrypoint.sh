#!/bin/sh

# Check if necessary environment variables are set
if [ -z "${IODINE_IP}" ]; then
  echo "Error: IODINE_IP is not set."
  exit 1
fi

if [ -z "${IODINE_DOMAIN}" ]; then
  echo "Error: IODINE_DOMAIN is not set."
  exit 1
fi

# Initialize command arguments
CMD_ARGS="${IODINE_EXTRA_ARGS}"

# Add compression flag if enabled
if [ "${IODINE_ENABLE_COMPRESSION}" = "true" ]; then
  CMD_ARGS="${CMD_ARGS} -c"
fi

# Add password if set
if [ -n "${IODINE_PASSWORD}" ]; then
  CMD_ARGS="${CMD_ARGS} -P ${IODINE_PASSWORD}"
fi

# Execute the iodine daemon with the provided arguments
exec iodined -f ${CMD_ARGS} ${IODINE_IP} ${IODINE_DOMAIN}
