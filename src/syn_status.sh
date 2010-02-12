#!/bin/sh
# ============================================================================
# Project:	git-ccm	(http://github.com/gmacario/git-ccm)
#
# Description:
#	Verify the contents of a  Synergy CM working area
#
# Language:
#	Unix Shell Script
#
# Tested on Cygwin under Windows XP Professional SP3
# ============================================================================

. syn_common.sh || exit 1

set -x

ccm start -q -n ${CCM_USER} -pw ${CCM_PASS} -rc -h ${engine_hostname} -p ${project_spec} -nogui

cd "${HOME}/ccm_wa/TRAINING70/LupinTest-macario/LupinTest"
ccm dir -m

ccm stop

# === EOF ===