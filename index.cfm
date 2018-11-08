<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>AChecker API</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<script>
	$(function(){
		$("#check").click(function() {
			//var SayfaBul = $(this).attr('name');
			var uri = $("#uri").val();
			alert(uri);
			$.ajax({
				type		: "POST",
				url			: "source.cfm",
				data		: "uri="+uri+"&check=true",
				beforeSend	: function(){$("div#kaynak").html('<div align="center"> <img src="/KOUBS/CommonFiles/images/loader.gif" width="200" style="margin: auto;"></div>').show();},
				error		: function() {$("div#kaynak").html('Hata.. İşlem sayfasına erişilemedi\n Lütfen tekrar deneyiniz...').show();},
				success 	: function(Sonuc) {
												$("div#kaynak").html(Sonuc).show();													
											  }
			});
			
			$.ajax({
				type		: "POST",
				url			: "checker.cfm",
				data		: "uri="+uri+"&check=true",
				beforeSend	: function(){$("div#sonuc").html('<div align="center"> <img src="/KOUBS/CommonFiles/images/loader.gif" width="200" style="margin: auto;"></div>').show();},
				error		: function() {$("div#sonuc").html('Hata.. İşlem sayfasına erişilemedi\n Lütfen tekrar deneyiniz...').show();},
				success 	: function(Sonuc) {
												$("div#sonuc").html(Sonuc).show();													
											  }
			});
		});
	});
</script>
</head>

<body>
	<cfoutput>
		<cfparam name="form.uri" default="http://www.google.com">
		<form id="frm">
			<input type="text" name="uri" id="uri" placeholder="http://www.google.com"/>
			<button name="check" id="check" onclick="return false;">Check</button>
		</form>
		<br />
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-6" id="kaynak" style="float:left !important; border:1px solid;"></div>
				<div class="col-lg-6" id="sonuc" style="float:left !important; border:1px solid;"></div>
			</div>
		</div>
	</cfoutput>
</body>
</html>