<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>menu demo</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
  <style>
  .ui-menu {
    width: 1275px;
  }
  </style>
  <script src="//code.jquery.com/jquery-1.8.3.js"></script>
  <script src="//code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
  
<script type="text/javascript">
function cambiaBtnActivo(op){	
	if(op == 1)
		$('#btnCE').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CaracEjec_on.jpg");	
	else if(op == 2)
		$('#btnPR').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_ParamRef_on.jpg");	
	else if(op == 3)
		$('#btnDP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_DesPerf_on.jpg");	
	else if(op == 4)
		$('#btnPT').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_PerfTerm_on.jpg");	
	else if(op == 5)
		$('#btnCX').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CenExc_on.jpg");	
	else if(op == 6)
		$('#btnIP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_IndPerf_on.jpg");	
} 

function cambiaBtnInactivo(op){
	if(op==1)
		$('#btnCE').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CaracEjec_off.jpg");	
	else if(op == 2)
		$('#btnPR').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_ParamRef_off.jpg");	
	else if(op == 3)
		$('#btnDP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_DesPerf_off.jpg");	
	else if(op == 4)
		$('#btnPT').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_PerfTerm_off.jpg");	
	else if(op == 5)
		$('#btnCX').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CenExc_off.jpg");	
	else if(op == 6)
		$('#btnIP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_IndPerf_off.jpg");	
}

</script>  
</head>
<body>

<div id="targetElement"> 

  <table id="menu">
		 <tr>
		 	 <td width="140px"><img id="btnCE" src="/pozosPemex/img/btn_CaracEjec_off.jpg" alt="Caracteristicas de ejecución" onmouseover="cambiaBtnActivo(1);" onmouseout="cambiaBtnInactivo(1);"></td>
			 <td width="140px"><img id="btnPR" src="/pozosPemex/img/btn_ParamRef_off.jpg" alt="Parámetros de referencia" onmouseover="cambiaBtnActivo(2);" onmouseout="cambiaBtnInactivo(2);"></td>
			 <td width="140px"><img id="btnDP" src="/pozosPemex/img/btn_DesPerf_off.jpg" alt="Desarrollo y perforación" onmouseover="cambiaBtnActivo(3);" onmouseout="cambiaBtnInactivo(3);"></td>
			 <td width="140px"><img id="btnPT" src="/pozosPemex/img/btn_PerfTerm_off.jpg" alt="Perforación y terminación" onmouseover="cambiaBtnActivo(4);" onmouseout="cambiaBtnInactivo(4);"></td>
			 <td width="140px"><img id="btnCX" src="/pozosPemex/img/btn_CenExc_off.jpg" alt="Centro de excelencia" onmouseover="cambiaBtnActivo(5);" onmouseout="cambiaBtnInactivo(5);"></td>
			 <td width="140px"><img id="btnIP" src="/pozosPemex/img/btn_IndPerf_off.jpg" alt="Indicadores de perforación" onmouseover="cambiaBtnActivo(6);" onmouseout="cambiaBtnInactivo(6);"> </td>
		 </tr> 
	</table>
</div>
<!-- script>
$( "#menu" ).menu({
  position: { my: "center", at: "center", of: "#targetElement" }
});
</script -->
 
</body>
</html>