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
# ============================================================================

. syn_common.sh || exit 1

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