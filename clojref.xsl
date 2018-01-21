<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/reference">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/reference/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="clojref.css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="section">
        <h2>
            <xsl:value-of select="@name"/>
        </h2>
        <hr/>
        <dl>
            <xsl:apply-templates/>
        </dl>
    </xsl:template>

    <xsl:template match="spec">
        <dt><span class="spec"><xsl:apply-templates/></span></dt>
    </xsl:template>

    <xsl:template match="desc">
        <dd><span class="desc">&#9655; <xsl:apply-templates/></span></dd>
        <br/>
    </xsl:template>

    <xsl:template match="optional">&#8990;<xsl:apply-templates/>&#8989;</xsl:template>

    <xsl:template match="place">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="onemore">
        <xsl:apply-templates/>
        <span class="repeatmodifier">+</span>
    </xsl:template>

    <xsl:template match="nonemore">
        <xsl:apply-templates/>
        <span class="repeatmodifier">*</span>
    </xsl:template>

    <xsl:template match="defaulted">
        <xsl:apply-templates/>
        <span class="defaultValue">
            <xsl:value-of select="@default"/>
        </span>
    </xsl:template>

    <xsl:template match="function">
        <span class="keywordDecorator">f</span>
        <span class="keyword"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="macro">
        <span class="keywordDecorator">m</span>
        <span class="keyword"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="special">
        <span class="keywordDecorator">s</span>
        <span class="keyword"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="exception">
        <span class="keywordDecorator">e</span>
        <span class="keyword"><xsl:apply-templates/></span>
    </xsl:template>
    

    <xsl:template match="block">
        <mfenced>
            <xsl:apply-templates/>
        </mfenced>
    </xsl:template>

    <xsl:template match="returnvalue">
        <span class="returnValue">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
