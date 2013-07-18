#!/bin/bash -e
# Common definitions used by SOCI build scripts at travis-ci.org
#
# Copyright (c) 2013 Mateusz Loskot <mateusz@loskot.net>
#
if [[ "$TRAVIS" != "true" ]] ; then
	echo "Running this script makes no sense outside of travis-ci.org"
	exit 1
fi
# Functions
tmstamp() { echo -n "[$(date '+%H:%M:%S')]" ; }
# Environment
TCI_BLD_DIR=${TRAVIS_BUILD_DIR}/_build
TCI_SRC_DIR=${TRAVIS_BUILD_DIR}/src
TCI_NUMTHREADS=2
if [[ -f /sys/devices/system/cpu/online ]]; then
	# Calculates 1.5 times physical threads
	TCI_NUMTHREADS=$(( ( $(cut -f 2 -d '-' /sys/devices/system/cpu/online) + 1 ) * 15 / 10  ))
fi
export ORACLE_HOME=/opt/instantclient_11_2
export LD_LIBRARY_PATH=${ORACLE_HOME}:${LD_LIBRARY_PATH}

