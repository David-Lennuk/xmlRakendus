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
					<xsl:value-of select="nimi"/>
					,
					<xsl:value-of select="@saasta"/>
					: <i>
						<xsl:value-of select="concat(nimi, ', ', @saasta, '.')"/>
					</i>
					, vanus:
					<xsl:value-of select="2025 - number(@saasta)"/>
				</li>
			</xsl:for-each>
		</ul>

		<strong>Kõik andmed tabelina</strong>
		<table border="1">
			<tr>
				<th width="199" height="50">Nimi</th>
				<th width="199" height="50">Sünd.aasta</th>
				<th width="199" height="50">Vanus</th>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>
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
				<strong>Kõik andmed tabelina vanematega</strong>
		<table border="1">
			<th width="199" height="50">Nimi</th>
			<th width="199" height="50">Saasta</th>
			<th width="199" height="50">Laps</th>
			<th width="199" height="50">Vanus</th>
			<xsl:for-each select="//inimene">
					<tr>
						<td>
							<xsl:value-of select="../../nimi"/>
						</td>
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td>
							<xsl:value-of select="@saasta"/>
						</td>
						<td>
							<xsl:value-of select="2025-@saasta"/>
						</td>
					</tr>
			</xsl:for-each>
		</table>
		<strong>Iga inimese kohta näita mitmendal oma vanema sünniaastal ta sündis</strong>
		<table border="1">
			<tr>
				<th width="199" height="50">Nimi</th>
				<th width="199" height="50">Lapsevanema Vanus</th>
				<th width="199" height="50">Sünd.aasta</th>
				<th width="199" height="50">Vanus</th>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>
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
		<strong>
			<ol>
				<li>
					Count() - kogus - üldkogus - kõik nimed xml jadas:
					<xsl:value-of select="count(//nimi)"/>
				</li>
				<li>
					substring() - eralda kolm esimest tähte nimest
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, 1, 3)"/>
					</xsl:for-each>
				</li>
				<li>
					substring() - eralda kolm viimast tähte nimest
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, string-length(nimi)-2,3)"/>
					</xsl:for-each>
				</li>
				<li>starts-with</li>
				<xsl:for-each select ="//inimene[starts-with(nimi, 'E')]">
					<xsl:value-of select="nimi"/>, 
				</xsl:for-each>
			</ol>
		</strong>
	</xsl:template>
</xsl:stylesheet>
