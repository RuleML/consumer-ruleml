<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ruleml="http://ruleml.org/spec">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  <!-- dc:description [ 'Transformation to correct incomplete termination in instance generation by post-processing. 
       Target schema is normalized or relaxed serialization with equality and conjunctive heads of implications. ' ] -->
  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="ruleml:*"/>
  <!--<xsl:strip-space elements="*"/>-->

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="yes"/>

  <xsl:template match="ruleml:arg[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:Ind/>
  </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:repo[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:Var/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:resl[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:Var/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:slot[not(*)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:Ind/>
      <ruleml:Ind/>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Equal[not(ruleml:left) or not(ruleml:right)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:left><ruleml:Ind/></ruleml:left>
      <ruleml:right><ruleml:Ind/></ruleml:right>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Naf[not(ruleml:weak)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:weak><ruleml:Equal><ruleml:left><ruleml:Ind/></ruleml:left><ruleml:right><ruleml:Ind/></ruleml:right></ruleml:Equal></ruleml:weak>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Not[not(ruleml:strong)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:strong><ruleml:Equal><ruleml:left><ruleml:Ind/></ruleml:left><ruleml:right><ruleml:Ind/></ruleml:right></ruleml:Equal></ruleml:strong>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Equivalent[not(ruleml:torso[2])]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:torso><ruleml:And/></ruleml:torso>
      <ruleml:torso><ruleml:And/></ruleml:torso>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Implies[not(ruleml:if) or not(ruleml:then)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:if><ruleml:And/></ruleml:if>
      <ruleml:then><ruleml:And/></ruleml:then>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Exists[not(ruleml:declare) or not(ruleml:formula)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:declare><ruleml:Var/></ruleml:declare>
      <ruleml:formula><ruleml:And/></ruleml:formula>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="ruleml:Forall[not(ruleml:declare) or not(ruleml:formula)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ruleml:declare><ruleml:Var/></ruleml:declare>
      <ruleml:formula><ruleml:And/></ruleml:formula>
    </xsl:copy>
  </xsl:template>  
  
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
