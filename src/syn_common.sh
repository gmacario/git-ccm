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
# Default Parameters
# They should be defined in the caller program

# Telelogic Synergy Client v7.0 Installation directory
#CCM_HOME=/cygdrive/c/Programmi/Telelogic/Telelogic\ Synergy\ 7.0

# Username that will connect to Synergy server
#CCM_USER=macario
#CCM_PASS=xxxxx

#engine_hostname=unfs06.venaria.marelli.it
#router_hostname=${engine_hostname}
#project_spec=/projects/TRAINING70

# Variables as per http://maven.apache.org/scm/synergy.html
#database_delimiter=-
#database_delimiter=~
#
#project_name=Apache_Ant
#project_version=Release_1.7.0_20080701
#release=
#purpose=

# ----------------------------------------------------------------------------
# Sanity Checks

# Verify that all the environment variables have been properly defined
if [ "${CCM_HOME}" == "" ]; then 
    echo "ERROR: CCM_HOME must be defined"
	exit 1
fi
if [ "${CCM_USER}" == "" ]; then 
    echo -n "Enter CCM_USER: "
	read CCM_USER
fi
if [ "${CCM_PASS}" == "" ]; then 
    echo -n "Enter CCM_PASS for user ${CCM_USER} on ${engine_hostname}: "
	stty -echo
	read CCM_PASS
	stty echo
	echo ""
fi

# Make sure that CCM_HOME/bin is in PATH
which ccm 2>/dev/null || PATH=${PATH}:${CCM_HOME}/bin
#echo DBG: PATH=${PATH}

# Make sure that CCM router is same as router_hostname
router_hostname=${engine_hostname}

echo "DBG: Printing _router.adr"
cat "${CCM_HOME}/etc/_router.adr"
echo "DBG: END"
echo "DBG: router_hostname=${router_hostname}"

router_ok=$(grep "^${router_hostname}" "${CCM_HOME}/etc/_router.adr" | wc -l)
echo "DBG: router_ok=${router_ok}"
if [ ${router_ok} != 1 ]; then
	echo "Please provide link to ${router_hostname}"
	echo "into ${CCM_HOME}/etc/_router.adr"
	exit 1
fi

# === EOF ===
