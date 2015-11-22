<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="/WEB-INF/struts-html.tld" prefix="html"%>
<% String instance = "/pozosPemex/"; %>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Alta de Informaci&oacute;n T&eacute;cnica</title>
	
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<!-- CARROUSEL -->
		<link rel="stylesheet" href="<%=instance%>css/normalize.min.css">
		<link rel="stylesheet" href="<%=instance%>css/main.css">
		<script src="<%=instance%>js/jquery/modernizr-2.6.2.min.js"></script>
		
<!-- MENU HORIZONTAL -->
		<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/menu.css">
		
		<!-- script type="text/javascript" src="< %=instance%>dropDownMenu/js/jquery.js"></script -->
		<script type="text/javascript" src="<%=instance%>dropDownMenu/js/function.js"></script>		

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

	function guardaInfoTecnica(){
		
		if($("#tpoEspc").val() == 0 || $("#tpoDocto").val() == 0|| $("#anioPub").val() == 0 ||
		   $("#idTitDocto").val() == "" || $("#idNomArt").val() == "" || $("#idNomAut").val() == ""){
			alert("Favor de proporcionar todos los datos marcados como obligatorios");			
		}else{
			if($("#idlnk").val() == "" && $("#idfile").val() == ""){
				alert("Debe proporcionar un link o un archivo.");				
			}else{
				$.ajax({
		        	  type: "POST",
		        	  url: "/pozosPemex/altaInfoTec.do?method=altaInfoTec",
		        	  data: {idEspecialidad:$("#tpoEspc").val(), 
		        		     idDocto:$("#tpoDocto").val(), 
		        		     fecha_publicacion:$("#anioPub").val(), 
		        		     titulo_docto:$("#idTitDocto").val(),
		        		     idArticulo:$("#idNomArt").val(),
		        		     autores:$("#idNomAut").val(),
		        		     url:$("#idlnk").val(),
		        		     archivo_pdf:$("#idfile").val()},
		        	  contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		        	  success: function(data,status){
			                		//$("#tablaConsulta").html(data);
			                		alert("Se ha insertado correctamente el registro.");
			                		$("#tpoEspc").val("0");
			                		$("#tpoDocto").val("0");
			                		$("#anioPub").val("0");
			                		$("#idTitDocto").val("");
			                		$("#idNomArt").val("");
			                		$("#idlnk").val("");
			                		$("#idfile").val("");
		                		},
		              error: function(status, errorThrown){
			            	  		//alert("Ocurrió un error al insertar el registro, favor de verificar los datos proporcionados.");
			                		$("#tpoEspc").val("0");
			                		$("#tpoDocto").val("0");
			                		$("#anioPub").val("0");
			                		$("#idTitDocto").val("");
			                		$("#idNomArt").val("");
			                		$("#idNomAut").val("");
			                		$("#idlnk").val("");
			                		$("#idfile").val("");
		              			},
		        	  dataType: "text"
		        	});
			}
		}
		
		
	}
	
	function muestraLinkText(){
		$("#idlnk").show();
	
	}
</script>

</head>
<body>

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
	<!-- tr>
		<td width="100%">
		  <table align="left">
		  	<tr>
		  		<td width="152px"><img src="/pozosPemex/img/logo_pemex3.jpg" alt="informacion pozo pemex"></td -->
			 	<!-- td width="140px"><img id="btnCE"  src="/pozosPemex/img/btn_CaracEjec_off.jpg" alt="Caracteristicas de ejecución" onmouseover="cambiaBtnActivo(1);" onmouseout="cambiaBtnInactivo(1);"></td>
				<td width="140px"><img id="btnPR" src="/pozosPemex/img/btn_ParamRef_off.jpg" alt="Parámetros de referencia" onmouseover="cambiaBtnActivo(2);" onmouseout="cambiaBtnInactivo(2);"></td>
				<td width="140px"><img id="btnDP" src="/pozosPemex/img/btn_DesPerf_off.jpg" alt="Desarrollo y perforación" onmouseover="cambiaBtnActivo(3);" onmouseout="cambiaBtnInactivo(3);"></td>
				<td width="140px"><img id="btnPT" src="/pozosPemex/img/btn_PerfTerm_off.jpg" alt="Perforación y terminación" onmouseover="cambiaBtnActivo(4);" onmouseout="cambiaBtnInactivo(4);"></td>
				<td width="140px"><html:link action="/pozosInicio.do?method=pozosInicio"><img id="btnCX" src="/pozosPemex/img/btn_CenExc_off.jpg" alt="Centro de excelencia" onmouseover="cambiaBtnActivo(5);" onmouseout="cambiaBtnInactivo(5);"></html:link></td>
				<td width="140px"><img id="btnIP" src="/pozosPemex/img/btn_IndPerf_off.jpg" alt="Indicadores de perforación" onmouseover="cambiaBtnActivo(6);" onmouseout="cambiaBtnInactivo(6);"> </td -->
		  	<!--  /tr>  
		  </table>
		  <br/><br/>
		
		  <div class="wrapper">
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
	<tr>
		<td  width="100%">	
			 	 <table align="center" border="1" style="background-color:skyblue; text-align: center; border-collapse:collapse;">
				  		<tr style="font-weight:bold; color:black;">
							<td width="35%" style="vertical-align:top;">
    							<p style="text-align:left;"><span style="color:red;">(*)</span>Especialidad:<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
								 	<html:select styleId="tpoEspc" property="idEspecialidad" value="0">
								 		<html:options collection="lstComboEsp" property="id" labelProperty="valor" labelName="valor"/>
								 	</html:select>
    							</p>							
    							<p style="text-align:left;"><span style="color:red;">(*)</span>Tipo de documento:
								 	<html:select styleId="tpoDocto" property="idDocto" value="0">
								 		<html:options collection="lstComboTdo" property="id" labelProperty="valor" labelName="valor"/>
								 	</html:select>
    							</p>
    							<p style="text-align:left;"><span style="color:red;">(*)</span>Año de publicaci&oacute;n:
    								<select id="anioPub">
    										<option value="0">- Seleccione -</option>
    										<option value="2015">2015</option>
    										<option value="2014">2014</option>
    										<option value="2013">2013</option>
    										<option value="2012">2012</option>
    										<option value="2011">2011</option>
    										<option value="2010">2010</option>
    								</select><br>
    							</p>
								<p>&nbsp;</p>
    							<!-- p style="text-align:left;">Medios de informaci&oacute;n:<br>
                                  <input id="chkBx1" type="checkbox" name="group1" value="hayURL">Registrar link<br>
                                  <input id="chkBx2" type="checkbox" name="group1" value="hayfle">Proporcionar archivo<br>
								  <hr>
    							</p-->
    							<p style="text-align: center;">
									<input id="btnGuardado" type="button" value="Guardar registro"  onclick="guardaInfoTecnica();"/>
								</p>						
								<p>&nbsp;</p>			
								<p>&nbsp;</p>			
								<p style="text-align: left;">
									<span style="color:red;">(*)</span>Datos Obligatorios.
								</p>
							</td>
							<td width="55%" style="vertical-align:top;">
    							<p style="text-align: center;"><span style="color:red;">(*)</span>T&iacute;tulo documento:
    								<input id="idTitDocto" type="text" name="titDocto" size="60" maxlength="1000"/><br>
    							</p>
    							<p style="text-align: center;"><span style="color:red;">(*)</span>Nombre art&iacute;culo:&nbsp;&nbsp;
    								<input id="idNomArt" type="text" name="titDocto" size="60" maxlength="1000"/><br>
    							</p>
    							<p style="text-align: center;"><span style="color:red;">(*)</span>Nombre autor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    								<input id="idNomAut" type="text" name="titDocto" size="60" maxlength="1000"/><br>
    							</p>
								<p style="text-align: center;">Link:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    								<input id="idlnk" type="text" name="titDocto" size="60" maxlength="1000"><br>
    							</p>
								<p style="text-align: center;">Archivo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    								<input id="idfile" type="file" accept="application/msexcel, application/msword, application/pdf" name="titDocto" size="50%"/><br>
    							</p>
							</td>
							<td width="10%" style="vertical-align:top; background-color:white;">
				                <div>
				                  <a href="http://192.168.1.78:8080/pozosPemex/informacionTecnica/inicio.jsp"><img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo1_menuV.jpg"></a><br>
				                  <html:link action="/inicioIT.do?method=moduloInicioIT"><img alt="" title="Alta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo2_menuV2.jpg"></html:link><br>
				                  <!-- img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo3_menuV.jpg"><br-->		                  
				                </div>
							</td>				   							
						</tr>
				 </table>
		</td>
	</tr>
	</table>

</body>
</html>