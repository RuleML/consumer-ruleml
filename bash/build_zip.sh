#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${ZIP_HOME}"
rm "${ZIP_HOME}"*.zip >> /dev/null 2>&1
cd "${GIT_HOME}"
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}bash/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}relaxng/modules/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}relaxng/drivers/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}relaxng/driver4simp/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}relaxng/driver4xsd/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}test/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${REPO_HOME}xslt/"*
zip -r9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}datatypes/"*
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/atom_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/andor_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/implication_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/quantification_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/expr_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/folog_cl_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/folog_closure_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/default_inf_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/default_absent_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/default_absent_folog_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/default_present_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/termseq_poly_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/ordered_groups_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/stripe_skipping_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/stripe_skipping_ifthen_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/stripe_skipping_op_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/attribute_skipping_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/explicit_datatyping_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/explicit_datatyping_annotation_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/explicit_datatyping_value_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/dataterm_simple_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/data_simple_content_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/xsi_schemalocation_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/web_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/iri_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/fuzzy_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/neg_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/naf_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/xml_base_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/xml_id_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/equivalent_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/material_attrib_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/material_non-default_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/material_default_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/oid_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/slot_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/card_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/equal_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/type_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/dataterm_any_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/data_any_content_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/skolem_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/individual_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/variable_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/closure_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/resl_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/repo_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/plex_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/val_absence_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "${DREPO_HOME}relaxng/modules/init_expansion_module.rnc"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "oasis-intellectual_property_rights_ipr_policy-2013-07-31.pdf"
zip -9 "${ZIP_HOME}ConsumerRuleML1.02.zip" "CopyrightLicense_AppendixB_RuleML.pdf"
