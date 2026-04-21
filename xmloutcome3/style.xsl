<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <head><meta charset="UTF-8"/><title>Activity Badges</title></head>
  <body>
    <h1>Activity Badges</h1>
    <xsl:for-each select="badges/badge[@type='activity']">
      <xsl:sort select="name" order="ascending"/>
      <div style="border:1px solid #ccc; margin:10px; padding:10px;">
        <h2><xsl:value-of select="name"/></h2>
        <p><xsl:value-of select="description"/></p>
        <h3>Availability:</h3>
        <ul>
          <xsl:for-each select="levels/availability">
            <li>
              <xsl:choose>
                <xsl:when test="@level='beaver'">Beaver: </xsl:when>
                <xsl:when test="@level='cub'">Cub: </xsl:when>
                <xsl:when test="@level='scout'">Scout: </xsl:when>
                <xsl:otherwise><xsl:value-of select="@level"/>: </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="normalize-space()='Available'">Available</xsl:when>
                <xsl:otherwise>Not Available</xsl:otherwise>
              </xsl:choose>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </xsl:for-each>
    <hr/>
    <p><i>&#xA9; College Productions Ltd</i></p>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
