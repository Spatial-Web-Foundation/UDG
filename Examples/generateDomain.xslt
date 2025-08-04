<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    
    <!-- Root template -->
    <xsl:template match="/hsml">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title><xsl:value-of select="domain/name"/> - Scene Frames</title>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/10.6.1/mermaid.min.js"></script>
                <style>
                    * {
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 0;
                        padding: 20px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        min-height: 100vh;
                        color: white;
                    }
                    
                    .container {
                        max-width: 1400px;
                        margin: 0 auto;
                        background: rgba(255, 255, 255, 0.1);
                        backdrop-filter: blur(10px);
                        border-radius: 20px;
                        padding: 30px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                    }
                    
                    h1 {
                        text-align: center;
                        margin-bottom: 10px;
                        font-size: 2.5em;
                        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                    }
                    
                    .description {
                        text-align: center;
                        margin-bottom: 30px;
                        font-size: 1.2em;
                        opacity: 0.9;
                    }
                    
                    .tab-container {
                        background: rgba(255, 255, 255, 0.05);
                        border-radius: 15px;
                        overflow: hidden;
                        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
                    }
                    
                    .tab-header {
                        display: flex;
                        background: rgba(255, 255, 255, 0.1);
                        border-bottom: 2px solid rgba(255, 255, 255, 0.1);
                        flex-wrap: nowrap;
                        overflow-x: auto;
                    }
                    
                    .tab-button {
                        flex: 1;
                        padding: 15px 20px;
                        background: transparent;
                        border: none;
                        color: rgba(255, 255, 255, 0.7);
                        font-size: 1.1em;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        border-right: 1px solid rgba(255, 255, 255, 0.1);
                        position: relative;
                        white-space: nowrap;
                        min-width: 120px;
                    }
                    
                    .tab-button:last-child {
                        border-right: none;
                    }
                    
                    .tab-button:hover {
                        background: rgba(255, 255, 255, 0.1);
                        color: rgba(255, 255, 255, 0.9);
                    }
                    
                    .tab-button.active {
                        background: rgba(255, 255, 255, 0.2);
                        color: white;
                        font-weight: bold;
                    }
                    
                    .tab-button.active::after {
                        content: '';
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        right: 0;
                        height: 3px;
                        background: linear-gradient(90deg, #4CAF50, #81C784);
                        box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
                    }
                    
                    .tab-content {
                        background: rgba(255, 255, 255, 0.95);
                        padding: 20px;
                        min-height: 600px;
                    }
                    
                    .tab-pane {
                        display: none;
                    }
                    
                    .tab-pane.active {
                        display: block !important;
                        visibility: visible !important;
                    }
                    
                    .frame-info {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 15px 20px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                    }
                    
                    .frame-info h3 {
                        margin: 0 0 10px 0;
                        font-size: 1.4em;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }
                    
                    .frame-info p {
                        margin: 0;
                        opacity: 0.9;
                        font-size: 1.1em;
                    }
                    
                    .mermaid-wrapper {
                        background: white;
                        border-radius: 10px;
                        padding: 20px;
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                        overflow: auto;
                    }
                    
                    .mermaid {
                        width: 100%;
                        height: auto;
                    }
                    
                    .time-badge {
                        background: rgba(255, 255, 255, 0.2);
                        padding: 5px 12px;
                        border-radius: 20px;
                        font-size: 0.9em;
                        font-weight: bold;
                    }
                    
                    @media (max-width: 768px) {
                        .tab-header {
                            flex-wrap: nowrap;
                            overflow-x: auto;
                        }
                        
                        .tab-button {
                            min-width: 100px;
                            font-size: 0.9em;
                            padding: 12px 15px;
                        }
                        
                        .container {
                            padding: 15px;
                        }
                        
                        h1 {
                            font-size: 2em;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1><xsl:value-of select="domain/name"/></h1>
                    <p class="description"><xsl:value-of select="domain/description"/></p>
                    
                    <div class="tab-container">
                        <div class="tab-header">
                            <xsl:for-each select="domain/scene/frame">
                                <button class="tab-button" onclick="showTab({position()})">
                                    <xsl:if test="position() = 1">
                                        <xsl:attribute name="class">tab-button active</xsl:attribute>
                                    </xsl:if>
                                    Frame <xsl:value-of select="position()"/>
                                    <br/>
                                    <span class="time-badge"><xsl:value-of select="@duration"/></span>
                                </button>
                            </xsl:for-each>
                        </div>
                        
                        <div class="tab-content">
                            <xsl:for-each select="domain/scene/frame">
                                <xsl:variable name="frameIndex" select="position()"/>
                                <div class="tab-pane" id="frame{$frameIndex}">
                                    <xsl:if test="position() = 1">
                                        <xsl:attribute name="class">tab-pane active</xsl:attribute>
                                    </xsl:if>
                                    
                                    <div class="frame-info">
                                        <h3>
                                            <xsl:choose>
                                                <xsl:when test="position() = 1">🌅</xsl:when>
                                                <xsl:when test="position() = 2">☀️</xsl:when>
                                                <xsl:when test="position() = 3">🌞</xsl:when>
                                                <xsl:when test="position() = 4">🌆</xsl:when>
                                                <xsl:when test="position() = 5">🌙</xsl:when>
                                                <xsl:otherwise>🕐</xsl:otherwise>
                                            </xsl:choose>
                                            Frame <xsl:value-of select="$frameIndex"/> - <xsl:value-of select="@duration"/>
                                        </h3>
                                        <p>Scene state at <xsl:value-of select="@duration"/> showing device configurations and properties.</p>
                                    </div>
                                    
                                    <div class="mermaid-wrapper">
                                        <!-- Generate node ID based on frame position to ensure uniqueness -->
                                        <xsl:variable name="nodePrefix">
                                            <xsl:choose>
                                                <xsl:when test="position() = 1">node1</xsl:when>
                                                <xsl:when test="position() = 2">node2</xsl:when>
                                                <xsl:when test="position() = 3">node3</xsl:when>
                                                <xsl:when test="position() = 4">node4</xsl:when>
                                                <xsl:when test="position() = 5">node5</xsl:when>
                                                <xsl:otherwise>node<xsl:value-of select="position()"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        
                                        <div class="mermaid" id="mermaid{$frameIndex}">
                                            <xsl:text>flowchart TD&#10;</xsl:text>
                                            
                                            <!-- Domain node with unique ID -->
                                            <xsl:text>    </xsl:text>
                                            <xsl:value-of select="$nodePrefix"/>
                                            <xsl:text>_domain[fa:fa-globe </xsl:text>
                                            <xsl:value-of select="../../name"/>
                                            <xsl:text>&lt;br/&gt;</xsl:text>
                                            <xsl:value-of select="../../description"/>
                                            <xsl:text>]&#10;</xsl:text>
                                            
                                            <!-- Place nodes with unique IDs -->
                                            <xsl:for-each select="../place">
                                                <xsl:variable name="placeIcon">
                                                    <xsl:choose>
                                                        <xsl:when test="type = 'room'">fa:fa-home</xsl:when>
                                                        <xsl:when test="type = 'office'">fa:fa-building</xsl:when>
                                                        <xsl:when test="type = 'kitchen'">fa:fa-utensils</xsl:when>
                                                        <xsl:when test="type = 'bedroom'">fa:fa-bed</xsl:when>
                                                        <xsl:when test="type = 'bathroom'">fa:fa-bath</xsl:when>
                                                        <xsl:otherwise>fa:fa-map-marker-alt</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                
                                                <xsl:text>    </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_</xsl:text>
                                                <xsl:value-of select="@id"/>
                                                <xsl:text>[</xsl:text>
                                                <xsl:value-of select="$placeIcon"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="name"/>
                                                <xsl:text>&lt;br/&gt;</xsl:text>
                                                <xsl:value-of select="description"/>
                                                <xsl:if test="properties/property[@value]">
                                                    <xsl:text>&lt;br/&gt;---&lt;br/&gt;</xsl:text>
                                                    <xsl:for-each select="properties/property[@value]">
                                                        <xsl:value-of select="@name"/>
                                                        <xsl:text>: </xsl:text>
                                                        <xsl:value-of select="@value"/>
                                                        <xsl:if test="position() != last()">
                                                            <xsl:text>&lt;br/&gt;</xsl:text>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <xsl:text>]&#10;</xsl:text>
                                            </xsl:for-each>
                                            
                                            <!-- Thing nodes for this frame with unique IDs -->
                                            <xsl:for-each select="thing">
                                                <xsl:variable name="thingRef" select="@ref"/>
                                                <xsl:variable name="thingDef" select="../../../defs/thing[@id=$thingRef]"/>
                                                <xsl:variable name="currentThing" select="."/>
                                                
                                                <xsl:variable name="thingIcon">
                                                    <xsl:choose>
                                                        <xsl:when test="$thingDef/type = 'light'">fa:fa-lightbulb</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'thermostat'">fa:fa-thermometer-half</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'camera'">fa:fa-video</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'speaker'">fa:fa-volume-up</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'sensor'">fa:fa-wifi</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'lock'">fa:fa-lock</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'switch'">fa:fa-toggle-on</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'fan'">fa:fa-fan</xsl:when>
                                                        <xsl:when test="$thingDef/type = 'tv'">fa:fa-tv</xsl:when>
                                                        <xsl:otherwise>fa:fa-microchip</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                
                                                <xsl:text>    </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_</xsl:text>
                                                <xsl:value-of select="@ref"/>
                                                <xsl:text>[</xsl:text>
                                                <xsl:value-of select="$thingIcon"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="$thingDef/name"/>
                                                <xsl:text>&lt;br/&gt;</xsl:text>
                                                <xsl:value-of select="../@duration"/>
                                                <xsl:text>&lt;br/&gt;---&lt;br/&gt;</xsl:text>
                                                
                                                <!-- Show current property values -->
                                                <xsl:for-each select="$thingDef/properties/property">
                                                    <xsl:variable name="propId" select="@id"/>
                                                    <xsl:variable name="instanceValue" select="$currentThing/@*[name() = $propId]"/>
                                                    
                                                    <xsl:value-of select="@id"/>
                                                    <xsl:text>: </xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="$instanceValue">
                                                            <xsl:value-of select="$instanceValue"/>
                                                        </xsl:when>
                                                        <xsl:when test="@value">
                                                            <xsl:value-of select="@value"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:text>not set</xsl:text>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <xsl:if test="position() != last()">
                                                        <xsl:text>&lt;br/&gt;</xsl:text>
                                                    </xsl:if>
                                                </xsl:for-each>
                                                <xsl:text>]&#10;</xsl:text>
                                            </xsl:for-each>
                                            
                                            <!-- Relationships with unique node IDs -->
                                            <xsl:text>&#10;    %% Relationships&#10;</xsl:text>
                                            <xsl:for-each select="../place">
                                                <xsl:text>    </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_domain --> </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_</xsl:text>
                                                <xsl:value-of select="@id"/>
                                                <xsl:text>&#10;</xsl:text>
                                                
                                                <xsl:variable name="placeId" select="@id"/>
                                                <xsl:for-each select="../frame[$frameIndex]/thing">
                                                    <xsl:text>    </xsl:text>
                                                    <xsl:value-of select="$nodePrefix"/>
                                                    <xsl:text>_</xsl:text>
                                                    <xsl:value-of select="$placeId"/>
                                                    <xsl:text> --> </xsl:text>
                                                    <xsl:value-of select="$nodePrefix"/>
                                                    <xsl:text>_</xsl:text>
                                                    <xsl:value-of select="@ref"/>
                                                    <xsl:text>&#10;</xsl:text>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                            
                                            <!-- Styling -->
                                            <xsl:text>&#10;    %% Styling&#10;</xsl:text>
                                            <xsl:text>    classDef domain fill:#e1f5fe,stroke:#0277bd,stroke-width:3px&#10;</xsl:text>
                                            <xsl:text>    classDef room fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px&#10;</xsl:text>
                                            <xsl:text>    classDef light fill:#fff3e0,stroke:#f57c00,stroke-width:2px&#10;</xsl:text>
                                            <xsl:text>    classDef thermostat fill:#fce4ec,stroke:#c2185b,stroke-width:2px&#10;</xsl:text>
                                            
                                            <xsl:text>&#10;    class </xsl:text>
                                            <xsl:value-of select="$nodePrefix"/>
                                            <xsl:text>_domain domain&#10;</xsl:text>
                                            <xsl:for-each select="../place">
                                                <xsl:text>    class </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_</xsl:text>
                                                <xsl:value-of select="@id"/>
                                                <xsl:text> room&#10;</xsl:text>
                                            </xsl:for-each>
                                            <xsl:for-each select="thing">
                                                <xsl:variable name="thingRef" select="@ref"/>
                                                <xsl:variable name="thingType" select="../../../defs/thing[@id=$thingRef]/type"/>
                                                <xsl:text>    class </xsl:text>
                                                <xsl:value-of select="$nodePrefix"/>
                                                <xsl:text>_</xsl:text>
                                                <xsl:value-of select="@ref"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="$thingType"/>
                                                <xsl:text>&#10;</xsl:text>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
                
                <script>
                    // Initialize Mermaid
                    mermaid.initialize({
                        startOnLoad: true,
                        theme: 'default',
                        flowchart: {
                            useMaxWidth: true,
                            htmlLabels: true
                        }
                    });
                    
                    function showTab(tabNumber) {
                        // Hide all tab panes
                        const tabPanes = document.querySelectorAll('.tab-pane');
                        tabPanes.forEach(pane => pane.classList.remove('active'));
                        
                        // Remove active class from all tab buttons
                        const tabButtons = document.querySelectorAll('.tab-button');
                        tabButtons.forEach(button => button.classList.remove('active'));
                        
                        // Show selected tab pane
                        const selectedPane = document.getElementById(`frame${tabNumber}`);
                        if (selectedPane) {
                            selectedPane.classList.add('active');
                        }
                        
                        // Add active class to selected tab button
                        const selectedButton = document.querySelectorAll('.tab-button')[tabNumber - 1];
                        if (selectedButton) {
                            selectedButton.classList.add('active');
                        }
                    }
                    
                    // Initialize on page load
                    document.addEventListener('DOMContentLoaded', function() {
                        showTab(1);
                    });
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>