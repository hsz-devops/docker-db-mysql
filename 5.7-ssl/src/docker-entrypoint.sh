#!/usr/bin/env bash
set -eu
set -x

# ------------------------------------------------------------------
# let's make sure we have our configs always enabled, even if they are in a volume
cp ./cnf/*.cnf /etc/mysql/conf.d

# ------------------------------------------------------------------
## force generation of certificates...
## although 5.7.x should already take care of this, I can't seem to find exact instructions to get it running
##
#MYSQL_CERT_DIR="/etc/mysql/_cert"
#mkdir -p "${MYSQL_CERT_DIR}"
#mysql_ssl_rsa_setup --datadir="${MYSQL_CERT_DIR}"
#chown -R mysql:mysql /etc/mysql/_cert

# ------------------------------------------------------------------
#./gen_self_signed_cert.sh "${MYSQL_CERT_DIR}"

# using exec as per https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#entrypoint
exec /entrypoint.sh "$@"
