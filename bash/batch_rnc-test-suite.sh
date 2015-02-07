#!/bin/bash
# Prerequisites: batch_config2rnc.sh
# Dependecies: 
# aux_valrnc.sh
# test/rnc-test-suites/*.ruleml
# relaxng/test/*.rnc
#  Validate RuleML instances by RNC
# Instructions:
# run this script from the command line or another script after batch_config2rnc.sh
# FIXME use configuration script to validate test files against multiple schemas, including fail tests
# This will remove the fragile schema detection method now implemented.
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_TEST_HOME=${REPO_HOME}relaxng/drivers/
TEST_SUITE_HOME=${REPO_HOME}test/rnc-test-suites/

for file in ${TEST_SUITE_HOME}*/*.ruleml ${TEST_SUITE_HOME}*/*/*.ruleml
do
  filename=$(basename "${file}")
  echo "File "${filename}
  while read -r; do
     #echo "Line ${REPLY}"
     if [[ ${REPLY} =~ ^..xml-model ]]
     then     
       tail=${REPLY#*\"}
       #echo "Tail ${tail}"
       url=${tail%%\"*}
       #echo "URL ${url}"
       schemaname=${url##*/}
       #echo "Schema ${schemaname}"       
       sfile=${RNC_TEST_HOME}${schemaname}       
       ${BASH_HOME}aux_valrnc.sh "${sfile}"
       exitvalue=$?
       if [ "${exitvalue}" -ne "0" ]; then
          echo "Schema Validation Failed for ${schemaname} called in ${file}"
          exit 1
       fi   
       ${BASH_HOME}aux_valrnc.sh "${sfile}" "${file}"
       exitvalue=$?
       if [[ ! ${file} =~ fail ]] && [ "${exitvalue}" -ne "0" ]; then
          echo "Validation Failed for ${file}"
          exit 1
       else
         if [[ ${file} =~ fail ]] && [ "${exitvalue}" == "0" ]; then
           echo "Validation Succeeded for Failure Test ${file}"
           exit 1
         fi
       fi
       break
     fi
  done < "${file}"
done
