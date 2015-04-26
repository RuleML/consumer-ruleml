#!/bin/bash
# Prerequisites: batch_(web)config2rnc4xsd.sh 
# Dependencies:
# rnc2xsd.sh
# rnc2xsd.xslt
# rnc2xsd_min.xslt
# aux_valxsd.sh
# saxon9ee.jar
# FIXME use configuration script to set path variables
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC4XSD_HOME=${REPO_HOME}relaxng/drivers4xsd/
XSD_HOME=${REPO_HOME}xsd/
OXY_HOME=/Applications/oxygen/
SAX_HOME=${OXY_HOME}lib/
XSLT_HOME=${REPO_HOME}xslt/
RNC2XSD_HOME=${XSLT_HOME}rnc2xsd/
#
# creates the xsd directory if they doesn't exist, and clears them, in case they already have contents
mkdir -p ${XSD_HOME}
rm ${XSD_HOME}*.xsd >> /dev/null 2>&1

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
for f in ${RNC4XSD_HOME}*.rnc
do
  filename=$(basename "$f")
  #extension="${filename##*.}"
  filenameNE="${filename%.*}"
  ${BASH_HOME}rnc2xsd.sh "$f" ${XSD_HOME}"$filenameNE".xsd "{$simplify}" "{$finish}"
done
# temporary exit
#exit 2

rm ${XSD_HOME}xml.xsd  >> /dev/null 2>&1
# Apply XSLT transforamtions
# transform in place for files in XSD_HOME
# FIXME write an aux script for the xslt call
for f in ${XSD_HOME}*.xsd
do
  filename=$(basename "$f")
  echo "Transforming " "${filename}"
  java -jar ${SAX_HOME}saxon9ee.jar -s:"${f}" -xsl:"${RNC2XSD_HOME}rnc2xsd.xslt"  -o:"${f}"   >> /dev/null 2>&1
  if [ "$?" -ne "0" ]; then
     echo "XSLT Transformation Failed for " "${filename}"
     exit 1
   fi
done

# Validate the resulting XSD schemas
for f in ${XSD_HOME}*.xsd
do
  filename=$(basename "$f")
  echo "Validating " "${filename}"
  ${BASH_HOME}aux_valxsd.sh "${f}"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${filename}"
     exit 1
   fi
done
