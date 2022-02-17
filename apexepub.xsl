<?xml version="1.0" encoding="utf-8"?>
<!--
    This code is licensed under a
    Creative Commons Attribution 4.0 Unported License,
    available at http://creativecommons.org/licenses/by/4.0/
    (C) 2021 by Timothy Prescott
 -->
<xsl:stylesheet
    version="1.0"
    xmlns:f = "http://dlmf.nist.gov/LaTeXML/functions"
    xmlns:func  = "http://exslt.org/functions"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    xmlns:xhtml = "http://www.w3.org/1999/xhtml"
    xmlns:m="http://www.w3.org/1998/Math/MathML"
    extension-element-prefixes="func f"
    exclude-result-prefixes = "ltx f func">
<!-- <xsl:import href="/home/timothy.prescott/.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.6/lib/LaTeXML/resources/XSLT/LaTeXML-epub3.xsl"/>-->
  <xsl:import href="../LaTeXML/lib/LaTeXML/resources/XSLT/LaTeXML-epub3.xsl"/>

  <!-- todo latexml: exeternal files are not allowed -->
  <xsl:template mode="inhead"
      match="ltx:resource[starts-with(@src,'https:') or starts-with(@src,'http:')]">
    <xsl:message>Removing external resource: <xsl:value-of select="@src" /></xsl:message>
  </xsl:template>
  <xsl:template mode="inhead"
      match="ltx:resource[@type='text/javascript' and @src='LaTeXML-maybeMathJax.js']">
    <xsl:message>
        Removing external loading resource: <xsl:value-of select="@src" />
    </xsl:message>
  </xsl:template>

  <!-- todo latexml -->
  <!-- the validator wasn't liking links to ./ -->
  <func:function name="f:url">
    <xsl:param name="url"/>
    <func:result>
      <xsl:value-of select="f:if($url='./','index.xhtml',$url)"/>
    </func:result>
  </func:function>

  <!-- todo latexml
  we aren't allowed to have span[@colspan],
  which latexml likes to do in display math if there aren't enough & in a row:
  \begin{align*}1,1&1,2\\2,1\end{align*} % missing &2,2
  how to remove?
  -->
 
  <!-- todo latexml
  several epub readers don't like <mpadded width="(length)">
  (which can come from, eg, \!).
  -->
  <xsl:template match="m:mpadded[@width]">
     <xsl:apply-templates />
  </xsl:template>

  <!-- todo latexml?
  if @type and @media inherited by default, then we'd just need to drop media
  -->
  <!-- Mac's Books.app doesn't seem to apply the media attribute,
  so lets remove it.
  or maybe they only work in epub3?
  <xsl:template match="ltx:resource[@type='text/css' and @src='style-narrow.css']" mode="inhead">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:element name="link" namespace="{$html_ns}">
      <xsl:attribute name="rel">stylesheet</xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@src" /></xsl:attribute>
      <xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
    </xsl:element>
  </xsl:template> -->
 
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

</xsl:stylesheet>
