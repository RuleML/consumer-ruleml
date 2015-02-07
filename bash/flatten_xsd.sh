#!/bin/bash
# flatten
# Instructions:
# apply the XSLT transformation in xslt/rnc2xsd after flattening
#
# configure the path to the oxygen installation
OXYGEN_HOME=/Applications/oxygen

#   use oxygen to flatten the XSD driver in the $TMP directory and output to the $XSD_HOME directory
sh "$OXYGEN_HOME"/flattenSchemaMac.sh "$1" "$2"

