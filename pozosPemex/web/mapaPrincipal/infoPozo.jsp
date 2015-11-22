<!-- INICIA CODIGO JC -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<% String instance = "/pozosPemex/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html:html>
<head>

<title>Informaci&oacute;n de pozoz Pemex</title>
</head>

<!-- CARROUSEL -->
<link rel="stylesheet" href="<%=instance%>css/normalize.min.css">
<link rel="stylesheet" href="<%=instance%>css/main.css">
<script src="<%=instance%>js/jquery/modernizr-2.6.2.min.js"></script>


<!-- MENU HORIZONTAL -->
<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=instance%>dropDownMenu/css/menu.css">

<script type="text/javascript" src="<%=instance%>dropDownMenu/js/jquery.js"></script>
<script type="text/javascript" src="<%=instance%>dropDownMenu/js/function.js"></script>

<script type="text/javascript">



	$(document).ready(function() {
		
		$('#img4').click(function(){$('#listaLinks').toggle(2000);});		
		$('#img2').click(function(){$('#infoForoDiv2').toggle(2000);});
		
		
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
	
	function cambiaBtnActivo(op){	
		if(op == 1)
			$('#img1').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_equipo2_on.jpg");	
		else if(op == 2)
			$('#img2').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_foro2_on.jpg");	
		else if(op == 3)
			$('#img3').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_equipo2_on.jpg");	
		else if(op == 4)
			$('#img4').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_ConsultaLinks_on.png");	
	} 
	
	function cambiaBtnInactivo(op){
		if(op == 1)
			$('#img1').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_equipo2_off.jpg");	
		else if(op == 2)
			$('#img2').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_foro2_off.jpg");	
		else if(op == 3)
			$('#img3').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_proyecto_equipo2_off.jpg");	
		else if(op == 4)
			$('#img4').css('cursor','pointer').attr("src", "/pozosPemex/img/logo_ConsultaLinks_off.png");	
	}
	
</script>


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
				</div> <script
					src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
				<script>
					window.jQuery
							|| document
									.write('<script src="<%=instance%>js/jquery/jquery-1.9.1.min.js"><\/script>')
				</script> <script src="<%=instance%>js/jquery/main.js"></script>
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


	<!-- table align="center">
		<tr>
			<td width="25%"></td>
			<td width="25%"><img title="Portal Perforación y Servicios" alt="" src="/pozosPemex/img/logo_proyecto_equipo.jpg"></td>
			<td width="25%"><img title="Foro" alt="" src="/pozosPemex/img/logo_proyecto_foro.jpg"></td>
			<td width="25%"><img title="Portal Perforación y Servicios" alt="" src="/pozosPemex/img/logo_proyecto_equipo.jpg"></td>
		</tr>
	</table-->

	<table align="center">
		   <tr>
		   	   <td><a href="http://192.168.1.78:8080/pozosPemex/mapaPrincipal/prototipoV1.jsp"><img id="img1" alt="" src="/pozosPemex/img/logo_proyecto_equipo2_off.jpg" title="Portal Perforación y Servicios (monitoreo de pozos)" onmouseover="cambiaBtnActivo(1);" onmouseout="cambiaBtnInactivo(1);"></a></td>
			   <td><img id="img2" alt="" src="/pozosPemex/img/logo_proyecto_foro2_off.jpg" title="Foro" onmouseover="cambiaBtnActivo(2);" onmouseout="cambiaBtnInactivo(2);"/></td>
		   	   <td><a href="http://192.168.1.78:8080/pozosPemex/informacionTecnica/inicio.jsp"><img id="img3" alt="" src="/pozosPemex/img/logo_proyecto_equipo2_off.jpg" title="Portal Perforación y Servicios (informacion tecnica)"  onmouseover="cambiaBtnActivo(3);" onmouseout="cambiaBtnInactivo(3);"/></a></td>
		   	   <td><img id="img4" alt="" src="/pozosPemex/img/logo_ConsultaLinks_off.png" title="Consulta Links" onmouseover="cambiaBtnActivo(4);" onmouseout="cambiaBtnInactivo(4);"/></td>
		   	   <td>&nbsp;</td>
		   </tr>
		   <tr>
		   	   <td>&nbsp;</td>
		   	   <td>
		   	   	<div id="infoForoDiv" style="text-align: left;">
		   	   		<p id="infoForoDiv2" style="display: none;">
		   	   		<label style="text-align: left; font-weight: bold; font-style:italic; text-decoration: underline;">Fechas foros:</label><br>
		   	   		<label style="text-align: left; font-weight: bold;">Villahermosa, Tabasco</label><br>
		   	   		<label style="text-align: left;">4 y 5 de Noviembre</label><br>
		   	   		<label style="text-align: left; font-weight: bold;">Cd. del Carmen, Campeche</label><br>
		   	   		<label style="text-align: left;">11 y 12 de Noviembre</label>
		   	   		</p>
		   	   	</div>
		   	   </td>
		   	   <td>&nbsp;</td>
		   	   <td>&nbsp;</td>
		   	   <td>
		   	   	<div id="linksDiv" style="text-align: left;">
		   	   		<ul id="listaLinks" style="display: none;">
		   	   			<li><label style="text-align: left; font-weight: bold;"><a href="https://www.onepetro.org/" target="blank">https://www.onepetro.org/</a></label></li>
		   	   			<li><label style="text-align: left; font-weight: bold;"><a href="http://www.slb.com/" target="blank">http://www.slb.com/</a></label></li>
		   	   			<li><label style="text-align: left; font-weight: bold;"><a href="http://www.scientific.net/" target="blank">http://www.scientific.net/</a></label></li>
		   	   			<li><label style="text-align: left; font-weight: bold;"><a href="http://www.earthdoc.org/" target="blank">http://www.earthdoc.org/</a></label></li>
		   	   			<li><label style="text-align: left; font-weight: bold;"><a href="http://bibdigital.epn.edu.ec/" target="blank">http://bibdigital.epn.edu.ec/</a></label></li>
		   	   		</ul>
		   	   	</div>
		   	   </td>
		   </tr>
	</table>

</body>
</html:html>
<!-- END CODIGO JC -->

