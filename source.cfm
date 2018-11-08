<!---	Form'dan gelen URL'e ait eriþilebilirliði kontrol edilecek sayfanýn orijinal kaynaðýný HTTP(s) isteði yaparak alýyor. 
		HTTPS kullanýlýyorsa bu isteði gerçekleþtirirken ColdFusion 2016 ve üzeri kullanýlmasý gerekmektedir.
		Alt versiyonlar HTTPS protokolünü desteklemiyor.
		Ýstek ile birlikte kodlama, referer, proxy v.b. gönderilen parametreler var.
		Çok fazla parametre gönderilmesi gerekiyor.
		Nedeni CF'nin istek protokolünün gerçek bir web tarayýcýsý gibi davranmasýný saðlamak.
		Ýstek tamamlandýðýnda gelen cevap ham HTML verisidir.
		Ham veriyi düzenlemek için HTML Encoding ve Formatting metodlarý kullanýlmaktadýr.
		Veri iþlemesi tamamlandýktan sonra veri ekrana normal bir deðiþken deðeri yazdýrma iþlemindeki gibi yazdýrýlabilir.
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
