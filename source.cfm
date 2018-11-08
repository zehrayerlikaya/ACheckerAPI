<!---	Form'dan gelen URL'e ait eri�ilebilirli�i kontrol edilecek sayfan�n orijinal kayna��n� HTTP(s) iste�i yaparak al�yor. 
		HTTPS kullan�l�yorsa bu iste�i ger�ekle�tirirken ColdFusion 2016 ve �zeri kullan�lmas� gerekmektedir.
		Alt versiyonlar HTTPS protokol�n� desteklemiyor.
		�stek ile birlikte kodlama, referer, proxy v.b. g�nderilen parametreler var.
		�ok fazla parametre g�nderilmesi gerekiyor.
		Nedeni CF'nin istek protokol�n�n ger�ek bir web taray�c�s� gibi davranmas�n� sa�lamak.
		�stek tamamland���nda gelen cevap ham HTML verisidir.
		Ham veriyi d�zenlemek i�in HTML Encoding ve Formatting metodlar� kullan�lmaktad�r.
		Veri i�lemesi tamamland�ktan sonra veri ekrana normal bir de�i�ken de�eri yazd�rma i�lemindeki gibi yazd�r�labilir.
--->
<cfhttp url="#form.uri#" useragent="Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/533.7 (KHTML, like Gecko) Chrome/5.0.391.0 Safari/533.7" result="httpResponse" redirect="false">
	<cfhttpparam type="header" name="HTTP_REFERER" value="http://example.com/feed/" >
	<cfhttpparam type="header" name="Accept-Encoding" value="gzip,deflate,sdch" >
	<cfhttpparam type="header" name="Proxy-Connection" value="keep-alive" >
	<cfhttpparam type="header" name="Accept" value="application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5">
	<cfhttpparam type="header" name="Accept-Language" value="en-US,en;q=0.8">
	<cfhttpparam type="header" name="Accept-Charset" value="ISO-8859-1,utf-8;q=0.7,*;q=0.3">
	<cfhttpparam type="cookie" name="some-cookie" value="1">
</cfhttp>
<cfoutput>#httpResponse.fileContent#</cfoutput>
