<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kc="urn:jboss:domain:keycloak-server:1.1">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template xmlns="urn:jboss:domain:keycloak-server:1.1"  match="//kc:subsystem/kc:theme">
        <xsl:copy>
            <!--<xsl:apply-templates select="node()|@*"/>-->
            <staticMaxAge>${env.THEME_MAX_AGE:2592000}</staticMaxAge>
            <cacheThemes>${env.CACHE_THEME:true}</cacheThemes>
            <cacheTemplates>${env.CACHE_TEMPLATES:true}</cacheTemplates>
            <dir>${jboss.home.dir}/themes</dir>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>