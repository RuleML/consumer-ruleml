#!/bin/bash
# Apply an XSLT transformation to an XML file
# Instructions:
# run this script from the command line or another script with three arguments
# the input file, the xslt file, and the output file
#
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

# creates the output directory if it doesn't exist
mkdir -p $(dirname "${3}")

echo "Transforming  ${1}"
java -jar "${SAX_HOME}saxon9ee.jar" -s:"${1}" -xsl:"${2}"  -o:"${3}"

if [[ "$?" -ne "0" ]]; then
     echo "XSLT Transformation with ${2} Failed"
     exit 1
fi
