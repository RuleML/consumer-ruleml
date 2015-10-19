#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the test directory if it doesn't exist, and clears it, in case it already has contents
mkdir -p "${NORMAL_SUITE_HOME}"
if [[ ${NORMAL_SUITE_HOME} ]]; then rm "${NORMAL_SUITE_HOME}"* >> /dev/null 2>&1; fi


  schemaname="consumer-normal.rnc"
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

# Apply normalization XSLT transforamtions
# transform files in RNC_TEST_SUITE_HOME ending in .ruleml
# output to NORMAL_SUITE_HOME
for f in "${RNC_TEST_SUITE_HOME}"*/*.ruleml
do
  filename=$(basename "$f")
  "${BASH_HOME}aux_xslt.sh" "${f}" "${NORMAL_XSLT_HOME}1.03_normalizer.xslt" "${NORMAL_SUITE_HOME}${filename}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed"
     exit 1
   fi
done

for file in "${NORMAL_SUITE_HOME}"*.ruleml "${NORMAL_SUITE_HOME}"*/*.ruleml
do
  filename=$(basename "${file}")
  echo "File ${filename}"
    "${BASH_HOME}aux_valrnc.sh" "${sfilesup}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Supremum Validation Failed for Normal ${file}"
          exit 1
     else
        if [[ "${file}" =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Supremum Validation Succeeded for Normal Failure Test ${file}"
           exit 1
         fi
    fi       
    "${BASH_HOME}aux_valrnc.sh" "${sfile}" "${file}"
    exitvalue=$?
    if [[ ! "${file}" =~ fail ]] && [[ "${exitvalue}" -ne "0" ]]; then
          echo "Validation Failed for Normal ${file}"
          exit 1
     else
        if [[ "${file}" =~ fail ]] && [[ "${exitvalue}" == "0" ]]; then
           echo "Validation Succeeded for Normal Failure Test ${file}"
           exit 1
         fi
    fi       
done
