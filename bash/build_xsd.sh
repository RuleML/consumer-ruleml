#!/bin/bash
# Fully local test script for XSD
# Dependencies
# batch_rnc2xsd.sh
# batch_xsd-test-suite.sh
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/

# Generate XSD, and validate
${BASH_HOME}batch_rnc2xsd.sh
if [ "$?" -ne "0" ]; then
     echo "Generation of XSD Failed"
     exit 1
fi
   
# Validate Examples in Test Suites
${BASH_HOME}batch_xsd-test-suite.sh  >> /dev/null 2>&1
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSD Schema Failed"
     exit 1
fi

# Normalized and Validate Examples Test Suites
#${BASH_HOME}batch_xsd-normal-suite.sh  >> /dev/null 2>&1
${BASH_HOME}batch_xsd-normal-suite.sh
if [ "$?" -ne "0" ]; then
     echo "Local Testing of XSD Normal Schema Failed"
     exit 1
fi
