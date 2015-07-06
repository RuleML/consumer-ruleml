<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://ruleml.org/spec" xmlns:r="http://ruleml.org/spec" exclude-result-prefixes="#all">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <xsl:import href="http://deliberation.ruleml.org/1.02/xslt/normalizer/1.02_normalizer.xslt"/>
  

  <!-- Phase I: insert stripes if skipped -->


  <!-- Wraps the naked children of Time. -->
  <xsl:template
    match="r:Time/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked children of Spatial. -->
  <xsl:template
    match="r:Spatial/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked children of Interval. -->
  <xsl:template
    match="r:Interval/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Wraps the naked RuleML children of generics Operation and Negation.-->
  <xsl:template
    match="r:*[local-name() = 'Operation' or local-name() = 'Negation']/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked RuleML children of Allen operators.-->
  <xsl:template
    match="r:*[local-name() = 'During' 
    or local-name() = 'Overlaps'
    or local-name() = 'Starts'
    or local-name() = 'Precedes'
    or local-name() = 'Succeeds'
    or local-name() = 'Meets'
    or local-name() = 'Finishes'
    ]/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Wraps the naked RuleML children of interval constructors.-->
  <xsl:template
    match="r:*[local-name() = 'After' 
    or local-name() = 'Before'
    or local-name() = 'Every'
    or local-name() = 'Any'
    or local-name() = 'Timer'
    ]/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  

  <!-- Phase II: rearrange into canonical ordering -->


  <!-- Builds canonically-ordered content of Atom. -->
  <xsl:template match="r:*[self::r:Time or self::r:Spatial or self::r:Interval ]" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="r:meta" mode="phase-2"/>
      <xsl:apply-templates
        select="*[
              namespace-uri(.)='http://ruleml.org/spec' and 
              local-name()!= 'meta' and 
              local-name()!= 'oid' and 
              local-name()!= 'degree' and 
              local-name()!= 'op' and 
              local-name()!= 'arg' and 
              local-name()!='repo' and 
              local-name()!='slot' and 
              local-name()!='resl']"
        mode="phase-2"/>
      <xsl:apply-templates select="r:oid" mode="phase-2"/>
      <xsl:apply-templates select="r:degree" mode="phase-2"/>
      <xsl:apply-templates select="r:op" mode="phase-2"/>
      <xsl:apply-templates select="r:arg" mode="phase-2"/>
      <xsl:apply-templates select="r:repo" mode="phase-2"/>
      <xsl:apply-templates select="r:slot" mode="phase-2"/>
      <xsl:apply-templates select="r:resl" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>

  <!-- Phase III: add required attributes -->
  <!-- Phase IV: sort by required attributes -->
  <!-- Sorts by the required index attribute to the arg tag 
        There are errors with the indexing when the argument is within a slot-->
  
  <xsl:template match="*[r:content]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::r:content)]"  mode="phase-sort"/>
      <xsl:apply-templates select="r:content"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  
  <!-- Pretty Print -->
  

</xsl:stylesheet>
