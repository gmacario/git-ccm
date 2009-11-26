#!/bin/sh
# ============================================================================
# Project:	http://gitorious.org/git-ccm
#
# Description:
#	Helper script with configurations and sanity checks
#	(the other scripts will source this file)
#
# Language:
#	Unix Shell Script
# ============================================================================

# ----------------------------------------------------------------------------
# Configurable Parameters
# TODO: Should fetch them from environment or config file

# Telelogic Synergy Client v7.0 Installation directory
CCM_HOME=/cygdrive/c/Programmi/Telelogic/Telelogic\ Synergy\ 7.0

# Username that will connect to Synergy server
CCM_USER=macario
#CCM_PASS=xxxxx
engine_hostname=unfs06.venaria.marelli.it
project_spec=/projects/TRAINING70

# Variables as per http://maven.apache.org/scm/synergy.html
database_delimiter=-
#database_delimiter=~
#
project_name=Apache_Ant
project_version=Release_1.7.0_20080701
#release=
#purpose=

MAINLINE_HOME=${HOME}/MYGIT/mainline

# ----------------------------------------------------------------------------
# Sanity checks, default parameters, etc
#
. ./syn_common.sh

which git-ccm 2>/dev/null || PATH="${MAINLINE_HOME}:${PATH}"

# ----------------------------------------------------------------------------
echo "DBG: PATH=${PATH}"
echo "DBG: CCM_USER=${CCM_USER}"
echo "DBG: CCM_PASS=${CCM_PASS}"

#git-ccm init --help
git-ccm init --server=${engine_hostname} --database=${project_spec}

# === EOF ===
