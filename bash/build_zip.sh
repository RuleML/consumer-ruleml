#!/bin/bash
# Dependencies
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
ZIP_HOME="${REPO_HOME}zip/"
GIT_HOME="${REPO_HOME}../"
mkdir -p "${ZIP_HOME}"
rm "${ZIP_HOME}"*.zip >> /dev/null 2>&1
cd "${GIT_HOME}"
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/bash/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/relaxng/modules/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/relaxng/drivers/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/relaxng/driver4simp/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/relaxng/driver4xsd/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/test/*
zip -r9 ${ZIP_HOME}ConsumerRuleML1.02.zip consumer-ruleml/xslt/*
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/atom_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/andor_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/implication_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/quantification_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/expr_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/folog_cl_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/folog_closure_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/default_inf_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/default_absent_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/default_absent_folog_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/default_present_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/termseq_poly_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/unordered_groups_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/ordered_groups_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/unordered_deterministic_groups_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/stripe_skipping_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/attribute_skipping_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/explicit_datatyping_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/dataterm_simple_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/data_simple_content_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/xsi_schemalocation_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/web_expansion_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/iri_expansion_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/fuzzy_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/neg_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/naf_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/xml_base_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/xml_id_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/andor_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/andor_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/equivalent_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/material_attrib_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/material_non-default_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/material_default_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/oid_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/slot_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/card_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/equal_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/type_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/dataterm_any_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/data_any_content_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/skolem_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/individual_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/variable_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/closure_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/resl_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/repo_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/plex_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/val_absence_expansion_module.rnc
zip -9 ${ZIP_HOME}ConsumerRuleML1.02.zip deliberation-ruleml/relaxng/modules/init_expansion_module.rnc
