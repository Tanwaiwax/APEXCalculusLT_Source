<!--
    This code is licensed under a
    Creative Commons Attribution 4.0 Unported License,
    available at http://creativecommons.org/licenses/by/4.0/
    (C) 2021 by Timothy Prescott
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ltx="http://dlmf.nist.gov/LaTeXML" version="1.0" exclude-result-prefixes="ltx">
 <xsl:param name="latexmldir"/>
 <!-- can't be import because that would have to come before the param -->
 <xsl:include href="{$latexmldir}/lib/LaTeXML/resources/XSLT/LaTeXML-html5.xsl"/>

 <!--
 "Watch the video: hyperlink" already comes before the iframe.
 We'll just delete the iframe.
 -->
 <xsl:template match="ltx:rawhtml[xhtml:iframe/@title='Embedded video']"/>

 <xsl:template match="ltx:inline-block[@class='includedAsy']">
  <xsl:variable name="filename" select="ltx:rawhtml/xhtml:iframe/@src" />
  <xsl:element name="img" namespace="{$html_ns}">
   <xsl:attribute name="src">
    <xsl:value-of select="substring-before($filename,'.html')" />
    <xsl:text>.png</xls:text>
   </xsl:attribute>
   <xsl:attribute name="width">
    <xsl:value-of select="ltx:rawhtml/xhtml:iframe/@width" />
   </xsl:attribute>
   <xsl:attribute name="height">
    <xsl:value-of select="ltx:rawhtml/xhtml:iframe/@height" />
   </xsl:attribute>
  </xsl:element>
 </xsl:template>

<!--
<xsl:template match="ltx:rawhtml[ltx:block/@class='iframe']">
<xsl:element name="br" namespace="{$html_ns}"/>
<xsl:element name="iframe" namespace="{$html_ns}">
<xsl:attribute name="class">embeddedVideo</xsl:attribute>
<xsl:attribute name="width">
<xsl:value-of select="ltx:block/@width"/>
</xsl:attribute>
<xsl:attribute name="height">
<xsl:value-of select="ltx:block/@height"/>
</xsl:attribute>
<xsl:attribute name="src">
<xsl:value-of select="ltx:block//ltx:ref/@href"/>
</xsl:attribute>
<xsl:attribute name="frameborder">0</xsl:attribute>
<xsl:attribute name="scrolling">no</xsl:attribute>
<xsl:attribute name="seamless"/>
<xsl:attribute name="allowfullscreen"/>
<xsl:attribute name="webkitallowfullscreen"/>
<xsl:attribute name="mozallowfullscreen"/>
</xsl:element>
<xsl:element name="br" namespace="{$html_ns}"/>
</xsl:template>
-->
</xsl:stylesheet>
