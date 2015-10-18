#!/bin/bash
# Prerequisites: batch_rnc2xsd.sh
# Dependecies: 
# aux_valxsd.sh
#  Validate RuleML instances by XSD
# Instructions:
# run this script from the command line or another script after batch_rnc2xsd.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the xsd directory if they doesn't exist, and clears them, in case they already have contents
mkdir -p "${COMPACT_SUITE_HOME}"
rm "${COMPACT_SUITE_HOME}"* >> /dev/null 2>&1

  schemaname="consumer-compact.rnc"
  schemasupname="consumer-relaxed.rnc"
  sfile="${DRIVER_HOME}${schemaname}"       
  sfilesup="${DRIVER_HOME}${schemasupname}"       
  "${BASH_HOME}aux_valrnc.sh" "${sfile}"
  exitvalue=$?
  echo ${exitvalue}
  if [[ "${exitvalue}" -ne "0" ]]; then
       echo "Schema Validation Failed for ${schemaname}"
       exit 1
   fi   

# Apply compactificaton XSLT transforamtions
# transform files in TEST_SUITE_HOME ending in .ruleml
# output to COMPACT_SUITE_HOME
for f in "${RNC_TEST_SUITE_HOME}"*/*.ruleml
do
  filename=$(basename "$f")
  "${BASH_HOME}aux_xslt.sh" "${f}" "${COMPACT_XSLT_HOME}1.03_compactifier.xslt" "${COMPACT_SUITE_HOME}${filename}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed"
     exit 1
   fi
done

for file in "${COMPACT_SUITE_HOME}"*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
    "${BASH_HOME}aux_valrnc.sh" "${sfilesup}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Supremum Validation Failed for Compact ${file}"
          exit 1
     else
        if [[ "${file}" =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Supremum Validation Succeeded for Compact Failure Test ${file}"
           exit 1
         fi
    fi       
    "${BASH_HOME}aux_valrnc.sh" "${sfile}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for Compact ${file}"
          exit 1
     else
        if [[ "${file}" =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Validation Succeeded for Compact Failure Test ${file}"
           exit 1
         fi
    fi       
done
