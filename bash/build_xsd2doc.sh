#!/bin/bash
# dcterms:rights [ "TBD" ]
# Auto-generate Schema Docs from XSD
# FIXME use configuration script to set path variables
# FIXME use a configuration text file to loop over doc creation

shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
XSD_HOME=${REPO_HOME}xsd/
OXY_HOME=/Applications/oxygen/
DOC_SCRIPT=${OXY_HOME}schemaDocumentationMac.sh

${DOC_SCRIPT}  ${XSD_HOME}consumer_normal.xsd  -cfg:${BASH_HOME}settings/doc.xml
 