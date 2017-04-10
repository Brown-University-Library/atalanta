<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:af="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Mar 31, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> elli</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
<!-- line break in output file; improves human readability of xml output -->
<xsl:variable name="newline"><xsl:text> 
</xsl:text></xsl:variable>
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Atalanta Transcription Proofreading</title>
                <link rel="stylesheet" type="text/css" href="resources/atalantaProof.css" media="screen" />
            </head>
            
            
            
            <body>
               <xsl:apply-templates/>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="af:teiHeader"/>
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="af:body">
        <xsl:apply-templates/>
        
    </xsl:template>
    <xsl:template match="af:div[@type='emblem']">
        <h2 class="pageTitle">Proofreading Atalanta Emblem <xsl:value-of select="@n"/></h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="af:div[@type='title | epigram | discourse']">
        <h3 class="label"><xsl:value-of select="upper-case(@type)"/></h3>
        <div class="{name()}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="af:head">
        <h3 class="{parent::af:div/@type}"><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="af:lg">
        <div class="verse">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="af:l">
       <br />
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="af:milestone">
        <span class="milestone"><xsl:value-of select="@n"/></span>
    </xsl:template>
    
    <xsl:template match="af:pb">
        <span class="pb"><xsl:value-of select="@n"/></span>
    </xsl:template>
    
    <xsl:template match="af:lb">
        <xsl:if test="@break='no'">
        <xsl:text>-</xsl:text>
        </xsl:if>
        <br />
    </xsl:template>
    
    <xsl:template match="af:ab">
        <div class="ab">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="af:choice | af:reg">  <!-- choice/orig/reg -->
        <span class="{name()}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="af:orig">      
        <xsl:choose>
            <xsl:when test="parent::af:choice"><span class="orig"><xsl:apply-templates/></span></xsl:when>
            <xsl:otherwise><span class="orig-solo"><xsl:apply-templates/></span></xsl:otherwise>
        </xsl:choose>      
    </xsl:template>
       
    <xsl:template match="af:unclear | af:supplied | af:subst | af:add | af:del | af:pc | af:fw">
       <span class="{name()}">
           <xsl:apply-templates/>
       </span>
   </xsl:template>
    
    <xsl:template match="af:seg[@rend='underline']">
        <span class="underline"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="af:seg[@rend='superscript']">
        <span class="superscript"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="af:note">*
        <xsl:if test="@place='margin'">
            <div class="margin-note"><xsl:text>[*] </xsl:text><xsl:apply-templates/>
        </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="c">
        <xsl:choose>
            <xsl:when test="@rend='double-hyphen'">
            <xsl:text>=</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    

        
</xsl:stylesheet>
