#!/bin/bash
# Prerequisites: batch_rnc2xsd.sh
# Dependecies: 
# aux_valxsd.sh
#  Validate RuleML instances by XSD
# Instructions:
# run this script from the command line or another script after batch_rnc2xsd.sh
# FIXME use configuration script to validate test files against multiple schemas, including fail tests
# This will remove the fragile schema detection method now implemented.
#
# globstar is only available in bash 4
#shopt -s globstar
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the xsd directory if it doesn't exist, and clears it, in case it already has contents
mkdir -p ${NORMAL_SUITE_HOME}
rm ${NORMAL_SUITE_HOME}* >> /dev/null 2>&1


  schemaname=consumer-normal.rnc
  schemasupname=consumer-relaxed.rnc
  sfile=${DRIVER_HOME}${schemaname}       
  sfilesup=${DRIVER_HOME}${schemasupname}       
  ${BASH_HOME}aux_valrnc.sh "${sfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   

# Apply normalization XSLT transforamtions
# transform files in TEST_SUITE_HOME ending in .ruleml
# output to NORMAL_SUITE_HOME
# FIXME write an aux script for the xslt call
for f in ${RNC_TEST_SUITE_HOME}*/*.ruleml
do
  filename=$(basename "$f")
  echo "Transforming " "${filename}"
  java -jar "${SAX_HOME}saxon9ee.jar" -s:"${f}" -xsl:"${NORMAL_XSLT_HOME}1.02_normalizer.xslt"  -o:"${NORMAL_SUITE_HOME}${filename}"   >> /dev/null 2>&1
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed for " "${filename}"
     exit 1
   fi
done

for file in ${NORMAL_SUITE_HOME}*.ruleml ${NORMAL_SUITE_HOME}*/*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
    ${BASH_HOME}aux_valrnc.sh "${sfilesup}" "${file}"
    exitvalue=$?
    if [[ ! ${file} =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Supremum Validation Failed for Normal ${file}"
          exit 1
     else
        if [[ ${file} =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Supremum Validation Succeeded for Normal Failure Test ${file}"
           exit 1
         fi
    fi       
    ${BASH_HOME}aux_valrnc.sh "${sfile}" "${file}"
    exitvalue=$?
    if [[ ! ${file} =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for Normal ${file}"
          exit 1
     else
        if [[ ${file} =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Validation Succeeded for Normal Failure Test ${file}"
           exit 1
         fi
    fi       
done