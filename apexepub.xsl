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
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    xmlns:xhtml = "http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="ltx">
 <xsl:import href="/home/timothy.prescott/.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.6/lib/LaTeXML/resources/XSLT/LaTeXML-epub3.xsl"/>

 <!-- todo latexml: exeternal javascript is not allowed -->
 <xsl:template
    match="ltx:resource[@type='text/javascript' and starts-with(@src,'https:')]"
    mode="inhead"/>
 <xsl:template
    match="ltx:resource[@type='text/javascript' and starts-with(@src,'http:')]"
    mode="inhead"/>
 <xsl:template
    match="ltx:resource[@type='text/javascript' and @src='LaTeXML-maybeMathJax.js']"
    mode="inhead" />
 
 <!-- todo latexml
 we aren't allowed to have span[@colspan],
 which latexml likes to do in display math if there aren't enough & in a row:
 \begin{align*}1,1&1,2\\2,1\end{align*} % missing &2,2
 how to remove?
 -->
 
 <!-- todo latexml?
 if @type and @media inherited by default, then we'd just need to drop media
 -->
 <!-- Mac's Books.app doesn't seem to apply the media attribute,
 so lets remove it -->
 <xsl:template match="ltx:resource[@type='text/css' and @src='style-narrow.css']" mode="inhead">
   <xsl:text>&#x0A;</xsl:text>
   <xsl:element name="link" namespace="{$html_ns}">
     <xsl:attribute name="rel">stylesheet</xsl:attribute>
     <xsl:attribute name="href"><xsl:value-of select="@src" /></xsl:attribute>
     <xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
   </xsl:element>
 </xsl:template>
 
 <!-- todo latexml -->
 <func:function name="f:url">
   <xsl:param name="url"/>
   <func:result>
       <xsl:value-of select="f:if($url='./','index.xhtml',$url)"/>
   </func:result>
<!--   <xsl:choose>-->
<!--       <xsl:when test="$url='./'">-->
<!--           <func:result>index.xhtml</func:result>-->
<!--       </xsl:when>-->
<!--       <xsl:otherwise>-->
<!--           <func:result><xsl:value-of select="$url"/></func:result>-->
<!--        </xsl:otherwise>-->
<!--    </xsl:choose>-->
 </func:function>

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
