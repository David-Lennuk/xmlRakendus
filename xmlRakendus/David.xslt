<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<strong>Näitane kõik nimed</strong>
		<ul>
			<xsl:for-each select ="//inimene">
				<xsl:sort select="@saasta" order="descending"/>
				<li>
					<xsl:choose>
						<xsl:when test="contains(nimi, 'a')">
							<span style="color: red;">
								<xsl:value-of select="nimi"/>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="nimi"/>
						</xsl:otherwise>
					</xsl:choose>
					,
					<xsl:value-of select="@saasta"/>
					: <i>
						<xsl:value-of select="concat(nimi, ', ', @saasta, '.')"/>
					</i>
					, vanus:
					<xsl:value-of select="2025 - number(@saasta)"/>
					,
					<xsl:value-of select="riik"/>
				</li>
			</xsl:for-each>
		</ul>

		<strong>Iga inimese kohta näita mitmendal oma vanema sünniaastal ta sündis</strong>
		<table border="1">
			<tr>
				<th width="199" height="50">Vanem</th>
				<th width="199" height="50">Nimi</th>
				<th width="199" heughr="58">Riik</th>
				<th width="199" height="50">Lapsevanema Vanus</th>
				<th width="199" height="50">Sünd.aasta</th>
				<th width="199" height="50">Vanus</th>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>
					<td>
						<xsl:value-of select="../../nimi"/>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="count(Lapsed/inimene) &gt;= 2">
								<span style="background-color: yellow;">
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
							-lapsevanema vanus oli
							<xsl:value-of select="../../@saasta - @saasta"/>aasta vana
						</xsl:if>
					</td>
					<td>
						<xsl:value-of select="@saasta"/>
					</td>
					<td>
						<xsl:value-of select="2025 - number(@saasta)"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
