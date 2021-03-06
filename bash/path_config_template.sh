#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Configure path variables
# Dependencies:
# From oXygen XML
#   - Jing
#   - Trang
#   - Sax
#   - XSD flattening script
#   - schema docs generation script
#   - instance generation script
# External libraries
#   - JAXB
# Installed packages
#  - java (1.6+)
#  - php5
#  - curl
#  - libxml2-utils (for xmllint)
#  - zip  
# Note: copy to path_config.sh and then
# change the parameters accordingly
# JAXB (jaxb-ri) should be installed in the Oxygen /lib directory
PLATFORM="Linux"
OXY_VERSION="17"
OXY_HOME="/home/taraathan/oxygen 17/"
FLATTEN_SCRIPT="${OXY_HOME}flattenSchema.sh"
if [[ ${OXY_VERSION} == "14" && ${PLATFORM} == "Mac" ]]; then 
  FLATTEN_SCRIPT="${OXY_HOME}flattenSchemaMac.sh"
fi  
GENERATE_SCRIPT="${OXY_HOME}xmlGenerator.sh"
if [[ ${OXY_VERSION} == "14" && ${PLATFORM} == "Mac" ]]; then 
  GENERATE_SCRIPT="${OXY_HOME}xmlGeneratorMac.sh"
fi  
DOC_SCRIPT="${OXY_HOME}schemaDocumentation.sh"
if [[ ${OXY_VERSION} == "14" && ${PLATFORM} == "Mac" ]]; then 
  DOC_SCRIPT="${OXY_HOME}schemaDocumentationMac.sh"
fi  
OXY_LIB="${OXY_HOME}lib/"
SAX_HOME="${OXY_LIB}"
JING="${OXY_LIB}jing.jar"
TRANG="${OXY_LIB}trang.jar"
JAXB_HOME="${OXY_LIB}"jaxb-ri/
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
DREPO_HOME="${REPO_HOME}../deliberation ruleml/"
RNC_HOME="${REPO_HOME}relaxng/"
DRIVER_HOME="${RNC_HOME}drivers/"
DRIVER_COMPACT_HOME="${DRIVER_HOME}"
TMP="${RNC_HOME}tmp-std2xsd.rng"
#MYNG_BACK_END="${RNC_HOME}schema_rnc.php"
#PHP_CLI_INI="${RNC_HOME}php-cli.ini"
DESIGN_HOME="${REPO_HOME}designPattern/"
TEST_HOME="${REPO_HOME}relaxng/test/"
RNC4SIMP_HOME="${REPO_HOME}relaxng/drivers4simp/"
RNC4XSD_HOME="${REPO_HOME}relaxng/drivers4xsd/" 
RNC4XSD_MIN_HOME="${REPO_HOME}relaxng/drivers4xsd_min/" 
RNC_TEST_SUITE_HOME="${REPO_HOME}test/rnc-test-suites/"
TMP_MODULES="${RNC_HOME}tmp/modules/"
SIMP_HOME="${REPO_HOME}simplified/"
XSD_HOME="${REPO_HOME}xsd/"
XSD_MIN_HOME="${REPO_HOME}xsd_min/"
XSLT2_HOME="${REPO_HOME}xslt/rnc2xsd/"
XSD_HOME="${REPO_HOME}xsd/"
XSD_TEST_SUITE_HOME="${REPO_HOME}test/xsd-test-suites/"
COMPACT_SUITE_HOME="${REPO_HOME}test/compactifier-test-suites/"
XSLT_HOME="${REPO_HOME}xslt/"
COMPACT_XSLT_HOME="${XSLT_HOME}compactifier/"
NORMAL_SUITE_HOME="${REPO_HOME}test/normalizer-test-suites/"
NORMAL_XSLT_HOME="${XSLT_HOME}normalizer/"
TMP_HOME="${RNC_HOME}tmp/"
TMP_RNG="${TMP_HOME}tmp-std2xsd.rng"
MODULE_HOME="${REPO_HOME}relaxng/modules/"
TMPDIR="${XSD_HOME}/tmp/"
ZIP_HOME="${REPO_HOME}zip/"
GIT_HOME="${REPO_HOME}../"
REACTION_CONFIG="${BASH_HOME}/settings/reaction-config.xml"
COMPACT_CONFIG="${BASH_HOME}/settings/compact-config.xml"
NORMAL_CONFIG="${BASH_HOME}/settings/normal-config.xml"
INSTANCE_HOME="${REPO_HOME}test/reaction-test-suites/"
INSTANCE_COMPACT_HOME="${REPO_HOME}test/compact-test-suites/"
INSTANCE_NORMAL_HOME="${REPO_HOME}test/normal-test-suites/"
INSTANCE_XSLT_HOME="${XSLT_HOME}instance-postprocessor/"
REACTION_XSD_HOME="${REPO_HOME}../reaction-ruleml/xsd/"
