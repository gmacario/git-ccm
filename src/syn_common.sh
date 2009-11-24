#!/bin/sh
# ============================================================================
# Project:	git-ccm
#
# Description:
#	Common script with configurations and sanity checks
#	(the other scripts will source this file)
#
# Language:
#	Unix Shell Script
# ============================================================================

# ----------------------------------------------------------------------------
# Configurable Parameters

# Username that will connect to Synergy server
CCM_USER=macario
#CCM_PASS=xxxxx
engine_hostname=unfs06.venaria.marelli.it
project_spec=/projects/TRAINING70

# Telelogic Synergy Client v7.0 Installation directory
CCM_HOME=/cygdrive/c/Programmi/Telelogic/Telelogic\ Synergy\ 7.0

# ----------------------------------------------------------------------------
# Sanity Checks

if [ "${CCM_USER}" == "" ]; then 
    echo -n "Enter CCM_USER: "
	read CCM_USER
fi
if [ "${CCM_PASS}" == "" ]; then 
    echo -n "Enter CCM_PASS for user \"${CCM_USER}\": "
	stty -echo
	read CCM_PASS
	stty echo
	echo ""
fi

# Make sure that CCM_HOME/bin is in PATH
which ccm 2>/dev/null || PATH=${PATH}:${CCM_HOME}/bin
#echo DBG: PATH=${PATH}

# Variables as per http://maven.apache.org/scm/synergy.html
database_delimiter=-
#database_delimiter=~
#
project_name=Apache_Ant
project_version=Release_1.7.0_20080701
#release=
#purpose=

# === EOF ===