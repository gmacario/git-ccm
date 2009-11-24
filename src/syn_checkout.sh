#!/bin/sh
# ============================================================================
# Project:	git-ccm	(http://github.com/gmacario/git-ccm)
#
# Description:
#	Execute a checkout of a project from Synergy CM
#
# Language:
#	Unix Shell Script
#
# Tested on Cygwin under Windows XP Professional SP3
#
# See also:
#	http://publib.boulder.ibm.com/infocenter/rsdp/v1r0m0/topic/com.ibm.help.download.synergy.doc/pdf70/help_cli.pdf
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

set -x

# Login on server $engine_hostname with username $CCM_USER and password $CCM_PASS.
# Note that the password is in plain text
ccm start -q -n ${CCM_USER} -pw ${CCM_PASS} -rc -h ${engine_hostname} -p ${project_spec} -nogui

# (Mario) Checkout project "LupinTestDash" from version 2 to 3
# ccm co -p LupinTestDash-2 -path "$(pwd)" -versions 2:3

# ==> GUI will save work area under
#     D:\Documents and Settings\macario\ccm_wa\TRAINING70\LupinTestDash-macario1\LupinTestDash
#                                                        ^
#                                                        \___ work area path = D:\...\TRAINING70
#                                              ^
#                                              \___ database name = TRAINING70
#
# ??? ccm checkout -project LupinTestDash-2 -versions 2:3
ccm checkout -project ${project_name}${database_delimiter}${project_version}

#+ ccm checkout -project LinuxProj
#Project reference requires name and version optionally followed by instance: 'LinuxProj'
#Failed to set Work Area Properties
#Copy Project failed: Invalid project.
#Derive failed for project ''
#Copy Project complete.


# Copy to file system (GUI: Object > Create work area snapshot)
#
# Note: can make wa_snapshots only of projects that are static (ie in state "integrate" or "release"?)
# ccm copy_to_file_system project_spec [project_spec] [-p|-path path] [-r|-recurse]

ccm stop

# === EOF ===