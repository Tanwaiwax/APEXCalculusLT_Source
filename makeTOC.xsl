<!--
    This code is licensed under a
    Creative Commons Attribution 4.0 Unported License,
    available at http://creativecommons.org/licenses/by/4.0/
    (C) 2011-2016 by Timothy Prescott
-->

<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml = "http://www.w3.org/1999/xhtml">

  <!-- delete everything -->
  <xsl:template match="*|/" />
  <xsl:template match="text()|@*" />

  <!-- except head and ul -->
  <xsl:template match="[//head]">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="head//">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="[//ul]">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="ul//">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="ul//ul//ul//ul//" />
  <xsl:template match='[contains(@class,"ltx_toc_appendix")]//ul//' />
  
  <!--
  <xsl:template match="text()|@*">
    <xsl:value-of select="."/>
  </xsl:template>
  -->
  
  <xsl:template match="body@class">
    <xsl:text>inIframe</xsl:text>
  </xsl:template>

</xsl:stylesheet>
