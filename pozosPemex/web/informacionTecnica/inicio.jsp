<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<% String instance = "/pozosPemex/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>B&uacute;squeda</title>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
		<!-- script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script -->

<!-- CARROUSEL -->
		<link rel="stylesheet" href="<%=instance%>css/normalize.min.css">
		<link rel="stylesheet" href="<%=instance%>css/main.css">
		<script src="<%=instance%>js/jquery/modernizr-2.6.2.min.js"></script>
		

<!-- MENU HORIZONTAL -->
		<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/menu.css">
		
		<!-- script type="text/javascript" src="< %=instance%>dropDownMenu/js/jquery.js"></script -->
		<script type="text/javascript" src="<%=instance%>dropDownMenu/js/function.js"></script>

		<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">		
		
		<style type="text/css">
			label{
				font-family:Arial;
				padding-left:20px;
			 }
		</style>
		
		<script type="text/javascript">
			function mostrarValores(){

				var idEspecialidadArray = [];
				var idTipoDoctoArray = [];
				var fechaPublicacionArray = [];
				var cadenaBusqueda = $("#cadenaB").val();
				
				$("input[name='idEspecialidad[]']:checked").each(function(){idEspecialidadArray.push($(this).val());});
				$("input[name='idDocto[]']:checked").each(function(){idTipoDoctoArray.push($(this).val());});
				$("input[name='fecha_publicacion[]']:checked").each(function(){fechaPublicacionArray.push($(this).val());});
				
		        $.ajax({
		        	  type: "POST",
		        	  url: "/pozosPemex/consultaInfoTec.do?method=consultaInfoTec",
		        	  data: {cadenaAbuscar:cadenaBusqueda, especialidades:idEspecialidadArray.toString(), tipoDoctos:idTipoDoctoArray.toString(), fechasPublicacion:fechaPublicacionArray.toString()},
		        	  contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		        	  success: function(data,status){
		                		$("#tablaConsulta").html(data);
		                		},
		        	  dataType: "text"
		        	});	
			}
			
			function realizarBusquedaPorCadena(){
				
				var cadenaBusqueda = $("#cadenaB").val();

				$('#tablaConsulta').html("<img align='middle' src='/pozosPemex/img/ajax-loader.gif' />");
				
				
				$.ajax({
					type:		"POST",
					url:		"/pozosPemex/consultaInfoTecCadena.do?method=consultaInfoTecCadena",
					data:		{cadenaAbuscar: cadenaBusqueda},
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',
					success:	function(data, status){
									$("#tablaConsulta").html(data);
								},
					dataType:	"text"
				});				
			}
		
			function a(contOpener, contDialog){
				
				$("#divDialog"+contDialog).dialog({ autoOpen: false });
				$("#opener"+contOpener).click(function() { $("#divDialog"+contDialog).dialog( "open" );});
				
			}
			
			
		</script>
		
		<script type="text/javascript">
		// CREA MENU DINAMICO
		$(document).ready(function() {
			$.getJSON('/staticJson/menu.json', function(menuDinamico) {
				//             console.log(menuDinamico);
				crearMenu(menuDinamico);
							
			});
		});

		function crearMenu(menuDinamico) {
			var principal = menuDinamico.mapa.mapaPrincipal;
			var hijoMenu;
			var pHTML = '';

			$.each(
							principal,
							function(i) {

								pHTML += '<li class="' 
	        		+ principal[i].class 
	        		+ '"><a href="' 
	        		+ principal[i].link 
	        		+ '">'
										+ principal[i].titulo + '</a>';

								if (principal[i].ul != undefined) {

									hijoMenu = principal[i].ul.menuitem;

									pHTML += '<ul class="sub-menu">';

									$.each(
													hijoMenu,
													function(j) {
														pHTML += '<li>'
																+ '<a href="' + hijoMenu[j].link + '">'
																+ '<i class="'  + hijoMenu[j].class + '"></i>'
																+ hijoMenu[j].titulo
																+ '</a></li>';
													});

									pHTML += '</ul></li>';
								} else {
									pHTML += '</li>';
								}
							});

			        console.log(pHTML);

			$('#main-menu').append(pHTML);
		}		
		
// 		CREAR CATALOGO DE UNIVERSIDADES
	$(document).ready(function() {
		$.getJSON('/staticJson/cat_universidades.json', function(dialogUni) {
			crearUni(dialogUni);
		});
	});

	function crearUni(dialogUni) {
		var principalUni = dialogUni.dialogUni.dialogUni;
		var pUniHTML = '<ul>';

		$.each(
				principalUni,
						function(i) {
				pUniHTML += '<li>' 
        		+ principalUni[i].titulo 
        		+ '</li>';
						});
				pUniHTML += '</ul>';

		        console.log(pUniHTML);

		$('#dialogUni').append(pUniHTML);
	}
//		CREAR CATALOGO DE CENTROS DE INVESTIGACION
	$(document).ready(function() {
		$.getJSON('/staticJson/cat_ci.json', function(dialogCIn) {
			crearCIn(dialogCIn);
		});
	});

	function crearCIn(dialogCIn) {
		var principalCIn = dialogCIn.dialogCIn.dialogCIn;
		var pCInHTML = '<ul>';

		$.each(
				principalCIn,
						function(i) {
				pCInHTML += '<li>' 
        		+ principalCIn[i].titulo 
        		+ '</li>';
						});
				pCInHTML += '</ul>';

		        console.log(pCInHTML);

		$('#dialogCIn').append(pCInHTML);
	}	
	
//	CREAR CATALOGO DE COMPAÑIAS
	$(document).ready(function() {
		$.getJSON('/staticJson/cat_companias.json', function(dialogCias) {
			crearCias(dialogCias);
		});
	});

	function crearCias(dialogCias) {
		var principalCias = dialogCias.dialogCias.dialogCias;
		var pCiasHTML = '<ul>';

		$.each(
				principalCias,
						function(i) {
				pCiasHTML += '<li>' 
        		+ principalCias[i].titulo 
        		+ '</li>';
						});
				pCiasHTML += '</ul>';

		        console.log(pCiasHTML);

		$('#dialogCias').append(pCiasHTML);
	}		
</script>
		
	</head>
	<body>
    <!-- table>
	<tr>
		<td width="100%">
		  <table align="left">
		  	<tr>
		  		<td width="152px"><img src="/pozosPemex/img/logo_pemex3.jpg" alt="informacion pozo pemex"></td>
			 	<td width="140px"><img id="btnCE"  src="/pozosPemex/img/btn_CaracEjec_off.jpg" alt="Caracteristicas de ejecución" onmouseover="cambiaBtnActivo(1);" onmouseout="cambiaBtnInactivo(1);"></td>
				<td width="140px"><img id="btnPR" src="/pozosPemex/img/btn_ParamRef_off.jpg" alt="Parámetros de referencia" onmouseover="cambiaBtnActivo(2);" onmouseout="cambiaBtnInactivo(2);"></td>
				<td width="140px"><img id="btnDP" src="/pozosPemex/img/btn_DesPerf_off.jpg" alt="Desarrollo y perforación" onmouseover="cambiaBtnActivo(3);" onmouseout="cambiaBtnInactivo(3);"></td>
				<td width="140px"><img id="btnPT" src="/pozosPemex/img/btn_PerfTerm_off.jpg" alt="Perforación y terminación" onmouseover="cambiaBtnActivo(4);" onmouseout="cambiaBtnInactivo(4);"></td>
				<td width="140px"><html:link action="/pozosInicio.do?method=pozosInicio"><img id="btnCX" src="/pozosPemex/img/btn_CenExc_off.jpg" alt="Centro de excelencia" onmouseover="cambiaBtnActivo(5);" onmouseout="cambiaBtnInactivo(5);"></html:link></td>
				<td width="140px"><img id="btnIP" src="/pozosPemex/img/btn_IndPerf_off.jpg" alt="Indicadores de perforación" onmouseover="cambiaBtnActivo(6);" onmouseout="cambiaBtnInactivo(6);"> </td>
		  	</tr>  
		  </table>
		  <br/><br/ -->
		
		  <!-- div class="wrapper">
		    <ul class="slider">
		      <li><img src="/pozosPemex/img/carrousel/imgPozo1.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo2.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo3.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo4.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo5.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo6.jpg"/></li>
		      <li><img src="/pozosPemex/img/carrousel/imgPozo7.jpg"/></li>
		    </ul>
		  </div -->
		
		  <!-- script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		  <script>window.jQuery || document.write('<script src="/pozosPemex/js/jquery/jquery-1.9.1.min.js"><\/script>')</script-->
		
		  <!-- script src="/pozosPemex/js/jquery/main.js"></script>
    	</td>
	</tr -->
	<table align="left">
		<tr>
			<td width="152px" valign="middle"><img src="<%=instance%>img/logo_pemex3.jpg" alt="informacion pozo pemex"></td>
			<td>
				<div class="wrapper">
					<ul class="slider">
						<li><img src="<%=instance%>img/carrousel/imgPozo1.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo2.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo3.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo4.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo5.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo6.jpg" /></li>
						<li><img src="<%=instance%>img/carrousel/imgPozo7.jpg" /></li>
					</ul>
				</div> 
				<!-- script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
				<script>
					window.jQuery
							|| document
									.write('<script src="< %=instance%>js/jquery/jquery-1.9.1.min.js"><\/script>')
				</script -->
				 <script src="<%=instance%>js/jquery/main.js"></script>
			</td>
		</tr>
	</table>
	<br />
	<br />
	<div id="wrap">
		<header>
		<div class="inner relative">
			<a class="logo" href="http://www.freshdesignweb.com"></a> <a
				id="menu-toggle" class="button dark" href="#"><i
				class="icon-reorder"></i></a>
			<nav id="navigation">
			<ul id="main-menu">

			</ul>
			</nav>
			<div class="clear"></div>
		</div>
		</header>
	</div>
		
	<table width="100%">
	<tr>
		<td>	
		  <table  width="100%">
		  	<tr>
		  		<td width="25%" align="left">
				  <!-- div style="padding-left:400px">Buscar: <input id="cadenaB" type="text" name="cadenaBusqueda"/><img src="/pozosPemex/img/busqueda.jpg" alt="Buscar" title="Realizar busqueda" style="cursor:pointer;" onclick="realizarBusquedaPorCadena();"/></div><br -->
				  <div>Buscar: <input id="cadenaB" type="text" name="cadenaBusqueda"/><img src="/pozosPemex/img/busqueda.jpg" alt="Buscar" title="Realizar busqueda" style="cursor:pointer;" onclick="mostrarValores();"/></div>
		  		</td>
		  		<td width="64%" align="right">Cat&aacute;logos:</td>
		  		<td width="5%" align="left">
		  		  <div><img id="imgUnis" src="/pozosPemex/img/universidades.jpg" alt="Buscar" title="Universidades" style="cursor:pointer;"/></div>
						<div id="dialogUni">					
						</div>
						<script>
						  $( "#dialogUni" ).dialog({ autoOpen: false });
						  $( "#imgUnis" ).click(function() {
						  $("#dialogUni").dialog({ width: 700, height: 400, show: "slow", resizable: false, title : "Catálogo de Universidades" });
						  $( "#dialogUni" ).dialog("open");
						});
						</script>		  		  
		  		</td>
		  		<td width="5%" align="left">
		  		  <div><img id="imgCIn" src="/pozosPemex/img/cen_inv2.jpg" alt="Buscar" title="Centros de Investigación" style="cursor:pointer;"/></div>
						<div id="dialogCIn">					
						</div>
						<script>
						  $( "#dialogCIn" ).dialog({ autoOpen: false });
						  $( "#imgCIn" ).click(function() {
						  $("#dialogCIn").dialog({ width: 700, height: 400, show: "slow", resizable: false, title : "Catálogo de Centros de Investigación" });
						  $( "#dialogCIn" ).dialog("open");
						});
						</script>		  		  
		  		</td>
		  		<td width="5%" align="right">
		  		  <div align="right"><img id="imgCias" src="/pozosPemex/img/cias.jpg" alt="Buscar" title="Compañías" style="cursor:pointer;" onclick="mostrarCompanias();"/></div>
						<div id="dialogCias">					
						</div>
						<script>
						  $( "#dialogCias" ).dialog({ autoOpen: false });
						  $( "#imgCias" ).click(function() {
						  $("#dialogCias").dialog({ width: 700, height: 400, show: "slow", resizable: false, title : "Catálogo de Centros de Compañias" });
						  $( "#dialogCias" ).dialog("open");
						});
						</script>		  		  
		  		</td>
		  	</tr>
		  </table>
	      <table border="1">
	  		 <tr>
			 	 <td width="13%" style="background-color:skyblue; padding: 0;">
			 	 	<div>
				 	 <table style="background-color:skyblue; padding: 0;">
				 		<tr>
							<td>
							<label><b>Especialidad</b></label><br>
							<input type="checkbox" name="idEspecialidad[]" value="1">Perforaci&oacute;n<br>
							<input type="checkbox" name="idEspecialidad[]" value="2">Terminaci&oacute;n<br>
							<!-- input type="checkbox" name="idEspecialidad[]" value="3">Perforaci&oacute;n y Terminaci&oacute;n<br-->
							<input type="checkbox" name="idEspecialidad[]" value="4">Reparaci&oacute;n<br>
							<input type="checkbox" name="idEspecialidad[]" value="5">Servicio a pozos<br>
							<input type="checkbox" name="idEspecialidad[]" value="6">Mantenimiento a equipos<br><br>				
							</td>
						</tr>
				 		<tr>
							<td>
							<label><b>Tipo de Documento</b></label><br>
							<input type="checkbox" name="idDocto[]" value="1">Art&iacute;culo<br>
							<input type="checkbox" name="idDocto[]" value="2">Libro<br>
							<input type="checkbox" name="idDocto[]" value="3">Tesis<br>
							<input type="checkbox" name="idDocto[]" value="4">Revista<br>
							<input type="checkbox" name="idDocto[]" value="5">Patente<br><br>
							</td>
						</tr>
				 		<tr>
							<td>
							<label><b>Fecha de Publicaci&oacute;n</b></label><br>
							<input type="checkbox" name="fecha_publicacion[]" value="2015">2015<br>
							<input type="checkbox" name="fecha_publicacion[]" value="2014">2014<br>
							<input type="checkbox" name="fecha_publicacion[]" value="2013">2013<br>
							<input type="checkbox" name="fecha_publicacion[]" value="2012">2012<br>
							<input type="checkbox" name="fecha_publicacion[]" value="2011">2011<br>
							<input type="checkbox" name="fecha_publicacion[]" value="2010">2010<br>
							</td>
						</tr>
						<tr>
							<td><input type="button" value="Consultar" onclick="mostrarValores();"/></td>
						</tr>
				 	 </table>
				 	 </div>
				 </td>
			 	 <td width="84%" align="center">
				 	 <div id="tablaConsulta" style="font-family:Arial; font-size:x-small;">
					 	 <img align="middle" alt="logo" title="Logo Pemex Perforación y Servicios" src="/pozosPemex/img/logo_pemex.jpg">
					 </div>
				 </td>
		      	  <td width="20%" valign="top">
		                <div>
		                  <a href="http://192.168.1.78:8080/pozosPemex/informacionTecnica/inicio.jsp"><img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo1_menuV.jpg"></a><br>
		                  <a href="http://192.168.1.78:8080/pozosPemex/inicioIT.do?method=moduloInicioIT"><img alt="" title="Alta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo2_menuV2.jpg"></a><br>
		                  <!-- img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo3_menuV.jpg"><br -->		                  
		                </div>
				  </td>				   
			 </tr>
	  </table>
	</td>
	</tr>
	</table>	
	</body>
</html>