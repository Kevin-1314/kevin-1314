<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

<xsl:template match="/">
<html lang="en">
<head>
<meta charset="UTF-8"/>
<title>Scout Activity Badges | Badge Directory</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: #eef2f5; font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif; padding: 30px 20px; color: #1a2c3e; }
.container { max-width: 1100px; margin: 0 auto; }
.main-title { text-align: center; font-size: 2.2rem; letter-spacing: 1px; color: #2c5a2e; border-bottom: 4px solid #ffb74d; display: inline-block; width: auto; margin: 0 auto 30px auto; padding-bottom: 8px; }
.badge-card { background: white; border-radius: 28px; box-shadow: 0 12px 24px rgba(0,0,0,0.08); margin-bottom: 32px; padding: 24px 30px; transition: transform 0.2s, box-shadow 0.2s; border-left: 8px solid #ffa000; }
.badge-card:hover { transform: translateY(-3px); box-shadow: 0 20px 30px rgba(0,0,0,0.12); }
.badge-name { font-size: 1.8rem; color: #1e4a2f; font-weight: 700; margin-bottom: 12px; border-left: 5px solid #ffa000; padding-left: 18px; }
.description { font-size: 1rem; line-height: 1.5; color: #2c3e44; background: #fef7e0; padding: 14px 18px; border-radius: 20px; margin: 16px 0 20px 0; border: 1px solid #ffe0a3; }
.levels-section { background: #f9fafb; border-radius: 24px; padding: 12px 20px; margin-top: 12px; }
.levels-title { font-weight: 600; font-size: 1.1rem; color: #5d4037; margin-bottom: 12px; display: inline-block; background: #ffecb3; padding: 4px 16px; border-radius: 40px; }
.level-list { display: flex; flex-wrap: wrap; gap: 18px; margin-top: 12px; }
.level-item { background: white; border-radius: 36px; padding: 8px 22px; box-shadow: 0 2px 6px rgba(0,0,0,0.05); font-weight: 500; border: 1px solid #e0e4e8; min-width: 140px; text-align: center; }
.level-label { font-weight: 700; color: #b85c00; }
.available-yes { color: #2b7a3e; font-weight: 600; margin-left: 6px; }
.available-no { color: #b33e2e; font-weight: 600; margin-left: 6px; }
.copyright { text-align: center; margin-top: 45px; padding: 18px; font-size: 0.85rem; color: #6c7a7f; border-top: 1px dashed #cdd7dc; background: #ffffffd9; border-radius: 60px; }
@media (max-width: 650px) { .badge-card { padding: 18px; } .level-list { flex-direction: column; gap: 8px; } .level-item { text-align: left; } }
</style>
</head>
<body>
<div class="container">
<div style="text-align: center;">
<h1 class="main-title">🏕️ Activity Badges · Skills Honor Roll</h1>
</div>
<xsl:for-each select="badges/badge[@type='activity']">
<xsl:sort select="name" order="ascending"/>
<div class="badge-card">
<div class="badge-name"><xsl:value-of select="name"/></div>
<div class="description">📖 <xsl:value-of select="description"/></div>
<div class="levels-section">
<span class="levels-title">✨ Applicable Levels &amp; Availability</span>
<div class="level-list">
<xsl:for-each select="levels/availability">
<div class="level-item">
<xsl:choose>
<xsl:when test="@level='beaver'"><span class="level-label">🐾 Beaver:</span></xsl:when>
<xsl:when test="@level='cub'"><span class="level-label">🐻 Cub:</span></xsl:when>
<xsl:when test="@level='scout'"><span class="level-label">⛰️ Scout:</span></xsl:when>
<xsl:otherwise><span class="level-label">📌 Other:</span></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="normalize-space(.)='Available'"><span class="available-yes">✅ Available</span></xsl:when>
<xsl:when test="normalize-space(.)='Not Available'"><span class="available-no">❌ Not Available</span></xsl:when>
<xsl:otherwise><span><xsl:value-of select="."/></span></xsl:otherwise>
</xsl:choose>
</div>
</xsl:for-each>
</div>
</div>
</div>
</xsl:for-each>
<div class="copyright">
<i>&#xA9; College Productions Ltd — Official Scout Activity Badges Reference</i><br/>
<span style="font-size:0.75rem;">Page generated via XSLT transformation | Data sourced from remote XML document</span>
</div>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
