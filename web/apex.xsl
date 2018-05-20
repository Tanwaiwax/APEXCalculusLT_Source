<!--
    This code is licensed under a
    Creative Commons Attribution 4.0 Unported License,
    available at http://creativecommons.org/licenses/by/4.0/
    (C) 2011-2016 by Timothy Prescott
-->

<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes = "ltx">

  <xsl:import href="/Users/tprescott/Documents/programming/github/LaTeXML/lib/LaTeXML/resources/XSLT/LaTeXML-html5.xsl" />

  <!--
  <xsl:template match="/" mode="head-begin">
    <xsl:element name="base">
      <xsl:attribute name="target">_top</xsl:attribute>
    </xsl:element>
  </xsl:template>

    -->

  <xsl:template match="ltx:rawhtml[ltx:block/@class='iframe']">
    <xsl:element name="br" namespace="{$html_ns}" />
    <xsl:element name="iframe" namespace="{$html_ns}">
      <xsl:attribute name="class">embeddedVideo</xsl:attribute>
      <xsl:attribute name="width">
	<xsl:value-of select="ltx:block/@width" />
      </xsl:attribute>
      <xsl:attribute name="height">
	<xsl:value-of select="ltx:block/@height" />
      </xsl:attribute>
      <xsl:attribute name="src">
	<xsl:value-of select="ltx:block//ltx:ref/@href" />
      </xsl:attribute>
      <xsl:attribute name="frameborder">0</xsl:attribute>
      <xsl:attribute name="scrolling">no</xsl:attribute>
      <xsl:attribute name="seamless" />
      <xsl:attribute name="allowfullscreen" />
      <xsl:attribute name="webkitallowfullscreen" />
      <xsl:attribute name="mozallowfullscreen" />
    </xsl:element>
    <xsl:element name="br" namespace="{$html_ns}" />
  </xsl:template>

</xsl:stylesheet>
