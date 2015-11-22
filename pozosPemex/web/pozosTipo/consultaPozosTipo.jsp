<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/c.tld" 		   prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String instance = "/pozosPemex/"; %>

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pozos Tipo</title>

		<style>
			.row1{background-color:ivory; font-size: 8pt;}
			.row0{background-color:honeydew; font-size: 8pt;}

			div#tablaPozosTipoConsulta {
			    overflow: scroll;
			    width: initial;
			    height: 345px;
			}
		</style>	

		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
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
					<script>window.jQuery || document.write('<script src="< %=instance%>js/jquery/jquery-1.9.1.min.js"><\/script>')
					</script -->
					 <script src="<%=instance%>js/jquery/main.js"></script>
				</td>
			</tr>
		</table>
		<br /><br />
		
		<div id="wrap">
			<header>
			<div class="inner relative">
				<a class="logo" href="#"></a> <a
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

		<div id="tablaPozosTipoConsulta">
		<table width="100%">
			<tr>
				<td><b>Subdirecci&oacute;n</b></td>
				<td><b>Activo</b></td>
				<td><b>Proyecto</b></td>
				<td><b>Campo</b></td>
				<td><b>Id_Pozo</b></td>			
			</tr>
			<logic:iterate id="item" indexId="count" name="lstPzsTpo" type="mx.com.pemex.pozostipo.dto.PozosTipoDto" scope="request">
			<tr>
				<td class="row<%= count.intValue()%2 %>"><c:out value="${item.subDireccion}"/></td>
				<td class="row<%= count.intValue()%2 %>"><c:out value="${item.activo}"/></td>
				<td class="row<%= count.intValue()%2 %>"><c:out value="${item.proyecto}"/></td>
				<td class="row<%= count.intValue()%2 %>"><c:out value="${item.campo}"/></td>
				<td class="row<%= count.intValue()%2 %>"><label id="txtRegTpoPzo<%=count.intValue()%>" style="text-decoration: underline; cursor: pointer;"><c:out value="${item.id_Pz}"/></label>
						<div id="dialogRegTpoPzo<%=count.intValue()%>">
							<label><b>Id Pozo:</b><c:out value="${item.id_Pz}"/></label><br>					
							<label><b>Exploratorio/Desarrollo:</b><c:out value="${item.descExpDes}"/></label><br>					
							<label><b>Pozo Tipo:</b><c:out value="${item.pozoTipo}"/></label><br>
							<label><b>Formaci&oacute;n:</b><c:out value="${item.formacion}"/></label><br>					
							<label><b>Profundidad:</b><c:out value="${item.profundidad}"/> mts.</label><br>					
							<label><b>Convencional/No Convencional:</b><c:out value="${item.descModalidad}"/></label><br>					
							<label><b>Tipo de Pozo:</b><c:out value="${item.descOrientacion}"/></label><br>					
							<label><b>Tipo:</b><c:out value="${item.tipo}"/></label><br>					
							<label><b>Tiempo Perforaci&oacute;n(D&iacute;as):</b><c:out value="${item.tmpoPerforacion}"/></label><br>					
							<label><b>Tiempo Terminaci&oacute;n(D&iacute;as):</b><c:out value="${item.tmpoTerminacion}"/></label><br>					
							<label><b>Tiempo Total(D&iacute;as):</b><c:out value="${item.tmpoTotal}"/></label><br>					
							<label><b>Costo Perforaci&oacute;n(MXN):</b><c:out value="${item.cstPerforacion}"/></label><br>					
							<label><b>Costo Terminaci&oacute;n(MXN):</b><c:out value="${item.cstTerminacion}"/></label><br>					
							<label><b>Costo Total(MXN):</b><c:out value="${item.cstTotal}"/></label><br>					
							<label><b>$ por metro perforado:</b><c:out value="${item.cstXmetro}"/></label><br>					
							<label><b>USD por pie perforado:</b><c:out value="${item.usdXpie}"/></label><br>					
						</div>
						<script>
						  $("#dialogRegTpoPzo"+<%=count.intValue()%>+"").dialog({ autoOpen: false });
						  $("#txtRegTpoPzo"+<%=count.intValue()%>+"").click(function() {
						  $("#dialogRegTpoPzo"+<%=count.intValue()%>+"").dialog({ width: 500, height: 330, show: "slow", resizable: false, title : "Detalle registro tipo pozo" });
						  $("#dialogRegTpoPzo"+<%=count.intValue()%>+"").dialog("open");
						});
						</script>		  		  
				
				</td>
			</tr>
			</logic:iterate>
		</table>
		</div>
	</body>
</html>