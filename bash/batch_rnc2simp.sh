#!/bin/bash
# dcterms:rights [ "TBD" ]
# Batch generate Simplified RNC from MYNG RNC
# Prerequisites:
#  Installation of curl
# Prerequisites: batch_(web)config2rnc4simp.sh 
# Dependencies:
# rnc2simp.sh
# relaxng/rnc4simp/*.rnc
# This script will remove the contents of a sibling directory named /simplified.
# Instructions:
# run this script from the command line
#
# Notes
# due to problems in Jing with simplification of qualified names as content, the explicit datatyping feature is not included.
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/
RNC4SIMP_HOME=${RNC_HOME}drivers4simp/
SIMP_HOME=${RNC_HOME}simplified/

# 
# creates the simplifed directory if it doesn't exist, and clears it, in case it already has contents
mkdir -p ${SIMP_HOME}
rm ${SIMP_HOME}*.rnc

for file in ${RNC4SIMP_HOME}*.rnc
do
  filename=$(basename "$file")
  ${BASH_HOME}rnc2simp.sh "$file" "${SIMP_HOME}${filename}"
  if [ "$?" -ne "0" ]; then
     echo "Simplification Failed for " "${filename}"
     exit 1
   fi
done
# Validate simplified RNC
for file in ${SIMP_HOME}*.rnc
do
  filename=$(basename "$file")
  ${BASH_HOME}aux_valrnc.sh "${file}" >> /dev/null 2>&1
  if [ "$?" -ne "0" ]; then
     echo "Simplified RNC Validation Failed for " "${filename}"
     exit 1
  fi
done
