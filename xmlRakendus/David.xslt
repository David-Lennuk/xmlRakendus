<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	

		<table border="1">
			<tr>
				<th width="199" height="50">Vanem</th>
				<th width="199" height="50">Lapsed</th>
				<th width="199" heighr="58">Riik</th>
				<th width="199" height="50">Lapsevanema Vanus</th>
				<th width="199" height="50">Sünd.aasta</th>
				<th width="199" height="50">Vanus</th>
				<th width="199" height="50">Loom</th>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>				
					<xsl:if test="count(Lapsed/inimene) &gt;= 2">
						<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					</xsl:if>
					<td>
						<xsl:value-of select="../../nimi"/>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="contains(nimi, 'e')">
								<span style="color: red;">
									<xsl:value-of select="nimi"/>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="nimi"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="../../riik"/>
					</td>
					<td>
						<xsl:if test="../..">
							<xsl:value-of select="../../@saasta - @saasta"/>.aasta
						</xsl:if>
					</td>
					<td>
						<xsl:value-of select="@saasta"/>
					</td>
					<td>
						<xsl:value-of select="2025 - number(@saasta)"/>
					</td>
					<td>
						<xsl:value-of select="../../loom"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<strong>Kõik nimed, mis sisaldavad tähte "e", on kirjutatud punasega; nimed on esile tõstetud kollasega, kui vanemal on 2 last.</strong>
		<strong>Minu isiklik ülesanne: lisasin lemmikloomadega veeru.</strong>
	</xsl:template>
</xsl:stylesheet>
