<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>AChecker API</title>
</head>

<body>
	<cfoutput>
		<cfparam name="form.uri" default="http://www.google.com">
		<form action="?" method="post">
			<input type="text" name="uri" placeholder="http://www.google.com" value="#form.uri#" />
			<input type="submit" name="check" value="Check" />
		</form>
		<cfif isdefined("form.check")><!---https://achecker.ca/checkacc.php?uri=#form.uri#&id=ca19cea64becd610d59bbe9e5d385db02296bd2c&output=rest&guide=STANCA,WCAG2-AA&offset=10
			<cfhttp url="http://achecker.ca/checkacc.php?uri=#form.uri#&id=ca19cea64becd610d59bbe9e5d385db02296bd2c&output=rest&guide=STANCA,WCAG2-AA&offset=10" charset="utf-16" useragent="" method="get" result="httpResponse">
			</cfhttp>--->
			<cfhttp url="#form.uri#" useragent="Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/533.7 (KHTML, like Gecko) Chrome/5.0.391.0 Safari/533.7" result="httpResponse" redirect="false">
				<cfhttpparam type="header" name="HTTP_REFERER" value="http://example.com/feed/" >
				<cfhttpparam type="header" name="Accept-Encoding" value="gzip,deflate,sdch" >
				<cfhttpparam type="header" name="Proxy-Connection" value="keep-alive" >
				<cfhttpparam type="header" name="Accept" value="application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5">
				<cfhttpparam type="header" name="Accept-Language" value="en-US,en;q=0.8">
				<cfhttpparam type="header" name="Accept-Charset" value="ISO-8859-1,utf-8;q=0.7,*;q=0.3">
				<cfhttpparam type="cookie" name="some-cookie" value="1">
			</cfhttp>
			
			<cfdump var="#httpResponse#">
			
			<cfhttp url="https://achecker.ca/checkacc.php?uri=#form.uri#&id=ca19cea64becd610d59bbe9e5d385db02296bd2c&output=rest&guide=STANCA,WCAG2-AA&offset=10" useragent="Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/533.7 (KHTML, like Gecko) Chrome/5.0.391.0 Safari/533.7" result="httpResponse" redirect="false">
				<cfhttpparam type="header" name="HTTP_REFERER" value="http://example.com/feed/" >
				<cfhttpparam type="header" name="Accept-Encoding" value="gzip,deflate,sdch" >
				<cfhttpparam type="header" name="Proxy-Connection" value="keep-alive" >
				<cfhttpparam type="header" name="Accept" value="application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5">
				<cfhttpparam type="header" name="Accept-Language" value="en-US,en;q=0.8">
				<cfhttpparam type="header" name="Accept-Charset" value="ISO-8859-1,utf-8;q=0.7,*;q=0.3">
				<cfhttpparam type="cookie" name="some-cookie" value="1">
			</cfhttp>
			
			<cfset content = XMLParse(httpResponse.fileContent)>
			Hata Sayısı: #content.resultset.summary.NumOfErrors.XmlText#<br />
			Muhtemel Problemler: #content.resultset.summary.NumOfLikelyProblems.XmlText#<br />
			Potensiyel Problemler: #content.resultset.summary.NumOfPotentialProblems.XmlText#<br />
			<cfdump var="#content#">
		</cfif>
	</cfoutput>
</body>
</html>