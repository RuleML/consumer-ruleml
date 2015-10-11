#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

#
# creates the xsd directory if they doesn't exist, and clears them, in case they already have contents
mkdir -p "${XSD_HOME}"
rm "${XSD_HOME}"*.xsd >> /dev/null 2>&1

# simplify before converting
#simplify= true
# 
# don't simplify before converting
# instead, flatten after converting
simplify= false
# applies the script rnc2xsd.sh to all RNC4XSD schemas
# for debugging, do not remove the temporary RNG
finish= false
# for a clean build, remove the temporary RNG
# finish= true
#
for f in "${RNC4XSD_HOME}"*.rnc
do
  filename=$(basename "$f")
  filenameNE="${filename%.*}"
  "${BASH_HOME}rnc2xsd.sh" "$f" "${XSD_HOME}""$filenameNE".xsd "{$simplify}" "{$finish}"
done

rm "${XSD_HOME}"xml.xsd  >> /dev/null 2>&1
# Apply XSLT transforamtions
# transform in place for files in XSD_HOME
for f in "${XSD_HOME}"*.xsd
do
  filename=$(basename "$f")
  "${BASH_HOME}aux_xslt.sh" "${f}" "${XSLT2_HOME}rnc2xsd.xslt" "${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation Failed"
     exit 1
   fi
done

# Validate the resulting XSD schemas
for f in "${XSD_HOME}"*.xsd
do
  filename=$(basename "$f")
  echo "Validating  ${filename}"
  "${BASH_HOME}aux_valxsd.sh" "${f}"
  if [[ "$?" -ne "0" ]]; then
     echo "Validation Failed for  ${filename}"
     exit 1
   fi
done
