<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
  <!-- dc:rights [ 'Copyright 2015 RuleML Inc. - Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ] -->
  
  <!-- Remove almost all white space between elements -->
  <xsl:preserve-space elements="xs:schema"/>
  <!--<xsl:strip-space elements="*"/>-->

  <!-- Add the  <?xml version="1.0" ?> at the top of the result.-->
  <xsl:output method="xml" version="1.0" indent="no" exclude-result-prefixes="xs"/>

  <xsl:template match="xs:schema[@targetNamespace='http://ruleml.org/spec']">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xs:import namespace="http://www.w3.org/XML/1998/namespace"
            schemaLocation="http://www.w3.org/2009/01/xml.xsd"/>
          <xs:include schemaLocation="http://deliberation.ruleml.org/1.02/datatypes/SimpleWithAttributes.xsd"/>
          <xsl:apply-templates select="text()|processing-instruction()|*[ name()!='xs:import']"/>
        </xsl:copy>
  </xsl:template>
  
  <!-- Fix elements with wild-card content. -->
  <xsl:template match="xs:element[@name='Data']">
    <xs:element name="Data" type="xs:anyType"/>
  </xsl:template>

  <!-- Fix elements with required index attribute. -->
  <xsl:template match="*[not (@name='formula_And-datt.choice') and not (@name='formula_Or-datt.choice')]/xs:attributeGroup[@ref='ruleml:index-attrib.choice']">
    <xs:attributeGroup ref="ruleml:index.attrib.def"/>
  </xsl:template>
  

  <!-- Remove groups like 
  <xs:group name="_1">-->
  <xsl:template match="xs:group[@name='_1']"> </xsl:template>
  <xsl:template match="xs:group[@name='_2']"> </xsl:template>

  <xsl:template match="xs:attribute[@name='id']">
    <xs:attribute name="id" type="xs:ID"/>
  </xsl:template>

  <!-- Remove existing includes -->
  <xsl:template match="xs:include"/>
  
  <!-- Remove dummy elements -->
  <xsl:template match="xs:element[@name='Closure']"></xsl:template>
  <xsl:template match="xs:element[@name='Type']"></xsl:template>
  <xsl:template match="xs:element[@name='Dummy']"></xsl:template>
  <xsl:template match="xs:element[@name='Base']"></xsl:template>
  <xsl:template match="xs:element[@name='Card']"></xsl:template>
  <xsl:template match="xs:element[@name='Common']"></xsl:template>
  <xsl:template match="xs:element[@name='Key']"></xsl:template>
  <xsl:template match="xs:element[@name='Material']"></xsl:template>
  <xsl:template match="xs:element[@name='Per']"></xsl:template>
  <xsl:template match="xs:element[@name='Skip']"></xsl:template>
  <xsl:template match="xs:element[@name='ValAbsence']"></xsl:template>
  
  <!-- Remove unused Node.choice and edge.choice -->
  <xsl:template match="xs:group[@name='Node.choice']"></xsl:template>
  <xsl:template match="xs:group[@name='edge.choice']"></xsl:template>  
    
  <!-- Copies everything to the transformation output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
