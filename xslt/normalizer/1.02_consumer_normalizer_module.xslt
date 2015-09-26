<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  

  <!-- Phase I: insert stripes if skipped -->

  <!-- Wraps the naked RuleML children of Implies in the cases where:
        -the only children of Implies are <left>, <right> and <oid> which can appear before <if> and <then> - does not handle foreign elements in the last or second to last position
        -if both children are already wrapped then they will be copied unchanged
        -neither children are wrapped, then the second to last child is wrapped in <if> and the last child is wrapped <then>
        -the second to last child is wrapped in <then>, and the last child is not wrapped, then the last child is wrapped in <if>, in all other cases,
        the last child is wrapped in <then>
        -the last child is wrapped in <if> and the second to last child is not wrapped, then the second to last child is wrapped in <then>,
        in all other cases, the second to last child is wrapped in <if>
        Does not normalize cases where:
        -there are foreign elements as the last or second to last child
        -there are foreign elements between the last and second to last child
    -->
  
  <!-- Wraps the second to last RuleML child of Rule. -->
  <xsl:template
    match="ruleml:Rule/*[namespace-uri(.)='http://ruleml.org/spec' and position()=last()-1]"
    mode="phase-1">
    <!--<xsl:comment>second to last</xsl:comment>-->
    <xsl:choose>
      <xsl:when test="local-name()='if' or local-name()='then'">
        <xsl:call-template name="copy-1"/>
      </xsl:when>
      <xsl:when test="local-name(following-sibling::*[1])='if'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">then</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">if</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- Wraps the last RuleML child of Rule -->
  <xsl:template
    match="ruleml:Rule/*[namespace-uri(.)='http://ruleml.org/spec' and position()=last()]"
    mode="phase-1">
    <!--<xsl:comment>last</xsl:comment>-->
    <xsl:choose>
      <xsl:when test="local-name()='if' or local-name()='then'">
        <xsl:call-template name="copy-1"/>
      </xsl:when>
      <xsl:when test="local-name(preceding-sibling::*[1])='then'">
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">if</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="wrap">
          <xsl:with-param name="tag">then</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  

  <!-- Wraps the naked children of Time. -->
  <xsl:template
    match="ruleml:Time/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked children of Spatial. -->
  <xsl:template
    match="ruleml:Spatial/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked children of Interval. -->
  <xsl:template
    match="ruleml:Interval/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">arg</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Wraps the naked RuleML children of generics Operation and Negation.-->
  <xsl:template
    match="ruleml:*[local-name() = 'Operation' or local-name() = 'Negation']/*[namespace-uri(.)='http://ruleml.org/spec' and not(matches(local-name(.),'^[a-z].*'))]"
    mode="phase-1">
    <xsl:call-template name="wrap">
      <xsl:with-param name="tag">formula</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Wraps the naked RuleML children of Allen operators.-->
  <xsl:template
    match="ruleml:*[local-name() = 'During' 
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
    match="ruleml:*[local-name() = 'After' 
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


  <!-- Builds canonically-ordered content of Time, Spatial, Interval. -->
  <xsl:template match="ruleml:*[self::ruleml:Time or self::ruleml:Spatial or self::ruleml:Interval ]" mode="phase-2">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="phase-2"/>
      <xsl:apply-templates select="comment()" mode="phase-2"/>
      <xsl:apply-templates select="*[namespace-uri(.)!='http://ruleml.org/spec']" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:meta" mode="phase-2"/>
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
      <xsl:apply-templates select="ruleml:oid" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:degree" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:op" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:arg" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:repo" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:slot" mode="phase-2"/>
      <xsl:apply-templates select="ruleml:resl" mode="phase-2"/>
    </xsl:copy>
  </xsl:template>

  <!-- Phase III: add required attributes -->
  <!-- Adds the required index attribute to the formula tag in Operation -->
  <xsl:template match="*[self::ruleml:Operation]/ruleml:formula[not(@index)]" mode="phase-3">
    <xsl:variable name="index_value">
      <xsl:value-of select="count(preceding-sibling::ruleml:formula)+1"/>
    </xsl:variable>
    <xsl:element name="ruleml:formula">
      <xsl:attribute name="index">
        <xsl:value-of select="$index_value"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="phase-3"/>
    </xsl:element>
  </xsl:template>
  
  
  <!-- Phase IV: sort by required attributes -->
  
  <!-- Sorts by the required index attribute to the formula tag in Operation -->
  <xsl:template match="*[self::ruleml:Operation]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::ruleml:formula)]"  mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:formula"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  
  
  <!-- Sorts by the required index attribute to the content tag -->
  <xsl:template match="*[ruleml:content]" mode="phase-sort">
    <xsl:copy>
      <xsl:apply-templates select="@*"  mode="phase-sort"/>
      <xsl:apply-templates select="node()[not(self::ruleml:content)]"  mode="phase-sort"/>
      <xsl:apply-templates select="ruleml:content"  mode="phase-sort">
        <xsl:sort select="@index"  data-type="number"/>                
      </xsl:apply-templates>
    </xsl:copy>  
  </xsl:template>
  
  <!-- Pretty Print -->
  

</xsl:stylesheet>
