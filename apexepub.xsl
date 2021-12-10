<?xml version="1.0" encoding="utf-8"?>
<!--
    This code is licensed under a
    Creative Commons Attribution 4.0 Unported License,
    available at http://creativecommons.org/licenses/by/4.0/
    (C) 2021 by Timothy Prescott
 -->
<xsl:stylesheet
    version="1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    xmlns:xhtml = "http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="ltx">
 <xsl:import href="/home/timothy.prescott/.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.6/lib/LaTeXML/resources/XSLT/LaTeXML-epub3.xsl"/>

 <!-- exeternal javascript is not allowed -->
 <xsl:template
    match="ltx:resource[@type='text/javascript' and starts-with(@src,'http')]" />
 <xsl:template
    match="ltx:resource[@type='text/javascript' and @src='LaTeXML-maybeMathJax.js']"
 />
<!-- <xsl:template-->
<!--    match="html:script[@type='text/javascript' and starts-with(@src,'http')]" />-->
<!-- <xsl:template-->
<!--    match="xhtml:script[@type='text/javascript' and @src='LaTeXML-maybeMathJax.js']"-->
<!-- />-->
 
 <xsl:template match="ltx:resource[@src='style-narrow.css']/@media" />
<!-- <xsl:template match="xhtml:link[@rel='stylesheet' and @href='style-narrow.css']/@media" />-->
 <!--
 "Watch the video: hyperlink" already comes before the iframe.
 We'll just delete the iframe.
 -->
 <xsl:template match="ltx:rawhtml[xhtml:iframe/@title='Embedded video']"/>

 <xsl:template match="ltx:inline-block[contains(@class,'includedAsy')]">
  <xsl:variable name="filename" select="ltx:rawhtml/xhtml:iframe/@src" />
  <xsl:element name="img" namespace="{$html_ns}">
   <xsl:attribute name="src">
    <xsl:value-of select="substring-before($filename,'.html')" />
    <xsl:text>.png</xsl:text>
   </xsl:attribute>
   <xsl:attribute name="width">
    <xsl:value-of select="ltx:rawhtml/xhtml:iframe/@width" />
   </xsl:attribute>
   <xsl:attribute name="height">
    <xsl:value-of select="ltx:rawhtml/xhtml:iframe/@height" />
   </xsl:attribute>
  </xsl:element>
 </xsl:template>

 <!-- maybe not necessary: https://www.w3.org/TR/epub-33/#sec-data-urls
 <xsl:template match="xhtml:footer[@class='ltx_page_footer']/xhtml:div[@class='ltx_page_logo']/xhtml:a/xhtml:img[@alt='[LOGO]']/@src">
  <xls:attribute name="src" value='figures/raw/latexml-logo.png' />
 </xsl:template>
 -->
 
</xsl:stylesheet>
