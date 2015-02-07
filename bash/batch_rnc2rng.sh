#!/bin/bash
# Dependencies
# aux_rnc2rng.sh
# aux_valdesign.sh
# relaxng/modules
# FIXME use named pipes with mkfifo to eliminate temporary files
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/
TMP_HOME=${RNC_HOME}tmp/modules/
# convert all RNC modules to RNG in preparation
# for validation against the schema for the design pattern
#
# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${TMP_HOME}"
rm "${TMP_HOME}"*.rng >> /dev/null 2>&1

# applies the auxiliary script aux_rnc2rng.sh to all RNC expansion modules
for file in "${RNC_HOME}modules/"*.rnc 
do 
  filename=$(basename "$file")
  #extension="${filename##*.}"
  #filenameNE="${filename%.*}"
  ${BASH_HOME}aux_rnc2rng.sh "${file}" "${TMP_HOME}"
   if [ "$?" -ne "0" ]; then
     echo "Conversion Failed for " "${filename}"
     exit 1
   fi
done
rngfiles=("${TMP_HOME}"*.rng) # array initialization
numrng=${#rngfiles[@]}
#echo ${numrng}
if [ "${numrng}" == "0" ]; then
  echo "No Conversion"
  exit 1
fi
# Validate against ../designPattern/include_expansion_schema.rng
for file in "${TMP_HOME}"*.rng
do
  filename=$(basename "$file")
  ${BASH_HOME}aux_valdesign.sh "${file}" >> /dev/null 2>&1
   if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${filename}"
     exit 1
   fi
done

# remove the temporary files and directory
function finish {
  rm ${TMP_HOME}*
  rmdir ${TMP_HOME}
}
trap finish EXIT 