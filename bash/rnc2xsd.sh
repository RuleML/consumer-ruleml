#!/bin/bash
# Auto-generate XSD from RNC
# Prerequisites:
#   Installation of Java and Jing/Trang. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
# Caution: Jing simplification cannot handle specified qualified names in content
# Dependencies:
# Jing
# Trang
# FIXME use configuration script to set path variables
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/
TMP_HOME=${RNC_HOME}tmp/
TMP_RNG=${TMP_HOME}tmp-std2xsd.rng

# creates the temporary directory if they doesn't exist, and clears them, in case they already have contents
mkdir -p ${TMP_HOME}
rm ${TMP_HOME}* >> /dev/null 2>&1


# Finds the filename without extension
filename1=$(basename "$1")
echo "Filename: " $filename1
extension1="${filename1##*.}"
#filenameNE="${filename1%.*}"

# Verifies that input schema name ends in ".rnc"
if [ "${extension1}" != "rnc" ];then
   echo "Input extension is not .rnc"
   exit 1
fi

# Finds the filename without extension
filename2=$(basename "$2")
extension2="${filename2##*.}"
#filenameNE="${filename2%.*}"

# Verifies that output name ends in ".xsd"
if [ "${extension2}" != "xsd" ];then
   echo "Output extension is not .xsd"
   exit 1
fi
infile="$1"
outfile="${TMP_HOME}$filename2"
echo "${infile}"
if [ "$3" = true ]; then
    echo "Start simplification."
    java -jar "${CP1}" -cs "$1" > ${TMP_RNG}
    if [ "$?" != "0" ];then
      echo "Simplification Failed."
      exit 1
    fi
    infile="${TMP_RNG}"
    outfile="$2"
fi  

echo "Start conversion of " "$infile"
java -jar "${CP2}" -o disable-abstract-elements -o any-process-contents=lax "${infile}" "${outfile}"
if [ "$?" != "0" ];then
   echo "Conversion to XSD Failed."
   exit 1
fi
if [ $3 != true ]; then
  ${BASH_HOME}flatten_xsd.sh "${outfile}" "$2" 
fi
if [ "$4" = true ]; then
  function finish {
    rm ${TMP}
  }
  trap finish EXIT
fi