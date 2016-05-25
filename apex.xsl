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
    xmlns:svg = "http://www.w3.org/2000/svg"
    xmlns:f   = "http://dlmf.nist.gov/LaTeXML/functions"
    extension-element-prefixes="f"
    exclude-result-prefixes = "ltx f svg">

  <xsl:import href="/Users/tprescott/Documents/programming/github/LaTeXML/lib/LaTeXML/resources/XSLT/LaTeXML-html5.xsl" />

  <xsl:template match="/" mode="head-begin">
    <xsl:element name="base">
      <xsl:attribute name="target">_top</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="/" mode="body-begin">
    <xsl:if test="//ltx:TOC/@name">
      <xsl:attribute name="class">inIframe</xsl:attribute>
    </xsl:if>
    <xsl:if test="not(//ltx:TOC/@name)">
      <xsl:attribute name="class">hasIframe</xsl:attribute>
      <xsl:element name="iframe" namespace="{$html_ns}">
	<xsl:attribute name="height">100%</xsl:attribute>
	<xsl:attribute name="width">25%</xsl:attribute>
	<xsl:attribute name="src">index.html</xsl:attribute>
	<xsl:attribute name="id">toc</xsl:attribute>
	<xsl:attribute name="frameborder">0</xsl:attribute>
	<xsl:attribute name="seamless" />
	<xsl:attribute name="name">toc_window</xsl:attribute>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!-- modify the next from LaTeXML-structure-xhtml.xsl to get proper headings
  <xsl:template name="maketitle">
    <xsl:element name="h{f:section-head-level(parent::*)}" namespace="{$html_ns}">
      <xsl:call-template name="add_id"/>
      <xsl:call-template name="add_attributes"/>
      <xsl:apply-templates select="." mode="begin"/>
      <xsl:apply-templates/>
    </xsl:element>
    <!- - include parent's author, subtitle & date (if any)- ->
    <xsl:call-template name="authors"/>
    <xsl:apply-templates select="../ltx:subtitle" mode="intitle"/>
    <xsl:apply-templates select="../ltx:date" mode="intitle"/>
    <xsl:apply-templates select="." mode="end"/>
    <xsl:text>&#x0A;</xsl:text>
    <xsl:apply-templates select="parent::*" mode="auto-toc"/>
    </xsl:template>
     -->

  <!-- modify the next from LaTeXML-picture-xhtml.xsl to get rid of svg[fragid][unitlength] -->
  <xsl:template match="svg:*">
    <xsl:element name="{local-name()}" namespace="{$svg_ns}">
      <xsl:for-each select="@*">
        <xsl:choose>
          <xsl:when test="local-name() = 'id'">
            <xsl:attribute name="{f:if($USE_NAMESPACES,'xml:id','id')}">
              <xsl:value-of select="."/>
            </xsl:attribute>
          </xsl:when>
          <!-- are these the attributes to watch for in svg? (urls)-->
          <xsl:when test="name() = 'href' or name() = 'src'">
            <xsl:attribute name="{local-name()}">
              <xsl:value-of select="f:url(.)"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="name()='xlink:href' or name()='xlink:role' or name()='xlink:arcrole'">
            <xsl:attribute name="{local-name()}"
                           namespace="{f:if($USE_NAMESPACES,namespace-uri(),'')}">
              <xsl:value-of select="f:url(.)"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="namespace-uri() = $SVG_NAMESPACE">
            <xsl:attribute name="{local-name()}" namespace="{f:if($USE_NAMESPACES,namespace-uri(),'')}">
              <xsl:value-of select="."/>
            </xsl:attribute>
          </xsl:when>
	  <xsl:when test="name()='fragid' or name()='unitlength'">
	    <!-- all of this just to skip these attributes -->
	  </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:choose>
        <!-- If foreignObject in a DIFFERENT namespace, copy as foreign markup -->
        <xsl:when test="local-name()='foreignObject-xml'
                        and not(namespace-uri(child::*) = $SVG_NAMESPACE)">
          <xsl:apply-templates mode='copy-foreign'/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

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
	<xsl:value-of select="ltx:block/ltx:ref/@href" />
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
