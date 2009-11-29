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
project_spec=/project/TRAINING70

# Variables as per http://maven.apache.org/scm/synergy.html
database_delimiter=-
#database_delimiter=~
#
project_name=Apache_Ant
project_version=Release_1.7.0_20080701
#release=
#purpose=

JJOHNNY_GITCCM_HOME=${HOME}/MYGIT/jjohnny-git-ccm-clone

# ----------------------------------------------------------------------------
# Sanity checks, default parameters, etc
#
. ./syn_common.sh

which git-ccm 2>/dev/null || PATH="${JJOHNNY_GITCCM_HOME}:${PATH}"

# ----------------------------------------------------------------------------
echo "DBG: PATH=${PATH}"
echo "DBG: CCM_USER=${CCM_USER}"
echo "DBG: CCM_PASS=${CCM_PASS}"

export CCM_USER CCM_PASS

# Try one of the following:
#
#  git-ccm init --help
#  git-ccm clone --help
#git-ccm

# git-ccm [options]
# Options:
#    -h, --help				show this help message and exit
#	 -s SERVER, --server=SERVER
#							resolvable name/IP and the ccm server.
#	 -d DB, --database=DB	database path on the ccm host
#git-ccm init --help

#git-ccm init \
#		--server=${engine_hostname} \
#		--database=${project_spec}

#Usage: git-ccm [options]
#
#Options:
#  -h, --help            show this help message and exit
#  -s SERVER, --server=SERVER
#                        resolvable name/IP of the ccm server.
#  -d DB, --database=DB  database path on the ccm host
#  -p PROJECT, --project=PROJECT
#                        Project name~version to checkout
#  -r RELEASE, --release=RELEASE
#                        release name of the project
#  -c COMMENT, --comment=COMMENT
#                        Initial comment for checking out
#git-ccm clone --help

set -x

#GIT_CCM="python -m pdb ${JJOHNNY_GITCCM_HOME}/git-ccm"
GIT_CCM=git-ccm

# DBG DBG DBG
#export CCM_WORKAREA=D:/temp

${GIT_CCM} clone \
		--server=${engine_hostname} \
		--database=${project_spec} \
		--project=${project_name}${database_delimiter}${project_version}

# === EOF ===
