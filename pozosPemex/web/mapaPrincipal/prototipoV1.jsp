<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String instance = "/pozosPemex/"; %>
<html>
	<head>	
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5jEai8Y_QF9l9eDZc4WHHok958ab_bMg&language=es$region=MX"  type="text/javascript"></script>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

		<script type='text/javascript' src='/pozosPemex/dwr/engine.js'></script>
		<script type='text/javascript' src='/pozosPemex/dwr/util.js'></script>
		<script type='text/javascript' src='/pozosPemex/dwr/interface/ConsultaPozos.js'></script>

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
		
		<script>
			//var myCenterB=new google.maps.LatLng(19.3682038,-99.0228435);
			
			var myCenterB=new google.maps.LatLng(22.3052548,-101.907679);
			
			var imageB = {url:'/pozosPemex/img/blueicon.png'};
			var imageG = {url:'/pozosPemex/img/greenicon.png'};
			var imageR = {url:'/pozosPemex/img/redicon.png'};
			var imageY = {url:'/pozosPemex/img/yellowicon.png'};
			
			var pozos = [
			             ['Cantarell', 18.0070575, -92.9254223],
			             ['Ku-Maloob Zaap', 18.1396099, -94.3636443],
			             ['Abkatunpol Chuc', 19.3523961, -90.7277168],
			             ['Litoral', 25.8662111, -97.5022043]
			           ];
			           
			var codigoColores=[
			                   [imageB],
			                   [imageG],
			                   [imageR],
			                   [imageY]
			];           
			
			var cadena =  '<p>Este es un pozo de PEMEX, para mayor ' +
			'información de datos relevantes, favor de consultar el sitio: </p>'+
			'<p>Nombre_pozo: <a href="http://192.168.1.78:8080/pozosPemex/mapaPrincipal/infoPozo.html">'+
			'http://192.168.1.78:8080/pozosPemex/mapaPrincipal/infoPozo.html</a></p>';
			
			function initialize(){
					
				var mapProp = {
			  					center:myCenterB,
			  					zoom:5,
			  					mapTypeId:google.maps.MapTypeId.ROADMAP
			  				  };
			
				var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
			
				//setMarkers(map);	
			}	
			
			function setMarkers(map){
				
				var marker, i;
				
				for (i = 0; i < pozos.length; i++) {
				    
					var pozo = pozos[i][0];
					var latitud = pozos[i][1];
					var longitud = pozos[i][2];
				    var image = codigoColores[i][0];
				    	    
					latlngset = new google.maps.LatLng(latitud, longitud);
						        
				    marker = new google.maps.Marker({ map: map,
				    								  title: pozo,
													  position: latlngset,
													  icon: image										      
													});
				    
					var infowindow = new google.maps.InfoWindow();
					
					google.maps.event.addListener(marker, 
											'click', 
											(function(marker, pozo, infowindow){
												return function(){
										          infowindow.setContent('<p align="left">'+pozo+'</p>'+'<br>'+cadena);
										          infowindow.open(map, marker);
												};
				          					})(marker, pozo, infowindow));	
			
				}	
			}
			
			function consultar(opcion, valorOpcion){
				// ##### OTRA FORMA DE HACER LAS CONSULTAS #####
				//ConsultaPozos.getOpcion(function(data) {
				//		var dato=document.getElementById("activoDiv");
				//		dato.innerHTML=data;
			    //		      });
				
				var index=0, datosObtenidos="";
				
				
				if(opcion==1){
					
					ConsultaPozos.getActivos(valorOpcion, {
			        	callback : function (data){
			        		
			        		datosObtenidos=data;
							//document.getElementById("activoDiv").innerHTML = '<img id="idImgLoadig" alt="Loading..." src="/pozosPemex/img/ajax-loader.gif">';
							window.setTimeout(operacionLlenadoOpciones(index, data, document.getElementById("activoDiv")), 3000);
			        	} 
			    	});
				}
				
				//var activosLon = document.getElementById("activos").options.length;
				//var activosDat = document.getElementById("activos");
				
				//LIMPIO EL COMBO
				//window.setTimeout(operacionBorradoOpciones(index, activosLon, activosDat), 1000);
				//for(index=activosLon ; index > 0 ; index--){	
				//	activosDat.removeChild(activosDat.options[index-1]);
				//}
				
				//LLENO EL COMBO
				//window.setTimeout(operacionLlenadoOpciones(index, datosObtenidos, document.getElementById("activoDiv")), 3000);
				//for(index=0 ; index < datosObtenidos.length ; index++){	

				//	parameter = datosObtenidos[index];
				//	alert("valor parametro: "+parameter);
				//	if(parameter != null){
				//		var optn=document.createElement("option");
				//		optn.text=parameter;
				//		optn.value=index;
				//		activosDat.options.add(optn);
				//	}

				//}							
				
			}
			
			function operacionBorradoOpciones(index, activosLon, activosDat){
				
				for(index=activosLon ; index > 0 ; index--){	
					activosDat.removeChild(activosDat.options[index-1]);
				}				
				
			}
			
			function operacionLlenadoOpciones(index, datosObtenidos, activosDiv){
				
				var parameter="";
				
				//Quito el combo a sustituir
				var parent = document.getElementById("activoDiv");
				var child = document.getElementById("activosSDiv");
				parent.removeChild(child);
				
				//Crea combo y adjunta opciones nuevas
				var select_List = document.createElement("select");
				select_List.id = "activosSDiv";
				//select_List.addEventListener("change", function(){myFunction(this.selectedIndex)});
				document.getElementById("activoDiv").appendChild(select_List);
				
				for(index=0 ; index < datosObtenidos.length ; index++){	

					parameter = datosObtenidos[index];
					if(parameter != null){
						var optn=document.createElement("option");
						optn.text=parameter;
						optn.value=index;
						select_List.options.add(optn);
					}

				}							
				
			}
			
			function myFunction(pValor) {
			    alert ("Hello World!: "+pValor);
			}
			//document.getElementById("activos").addEventListener("change", function(){myFunction(this.selectedIndex)});
			//google.maps.event.addDomListener(window, 'load', initialize);	
			
			// ***** FUNCIONALIDAD MENU SUPERIOR *****
			// function cambiaBtnActivo(op){	
			//	if(op == 1)
			//		$('#btnCE').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CaracEjec_on.jpg");	
			//	else if(op == 2)
			//		$('#btnPR').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_ParamRef_on.jpg");	
			//	else if(op == 3)
			//		$('#btnDP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_DesPerf_on.jpg");	
			//	else if(op == 4)
			//		$('#btnPT').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_PerfTerm_on.jpg");	
			//	else if(op == 5)
			//		$('#btnCX').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CenExc_on.jpg");	
			//	else if(op == 6)
			//		$('#btnIP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_IndPerf_on.jpg");	
			//} 
			
			//function cambiaBtnInactivo(op){
			//	if(op==1)
			//		$('#btnCE').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CaracEjec_off.jpg");	
			//	else if(op == 2)
			//		$('#btnPR').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_ParamRef_off.jpg");	
			//	else if(op == 3)
			//		$('#btnDP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_DesPerf_off.jpg");	
			//	else if(op == 4)
			//		$('#btnPT').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_PerfTerm_off.jpg");	
			//	else if(op == 5)
			//		$('#btnCX').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_CenExc_off.jpg");	
			//	else if(op == 6)
			//		$('#btnIP').css('cursor','pointer').attr("src", "/pozosPemex/img/btn_IndPerf_off.jpg");	
			//}			

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

			//CARGA COMBO DE DIRECCIONES VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_direciones.json', function(direccionDiv) {
					cargaCatDirecciones(direccionDiv);
				});
			});			
			
			function cargaCatDirecciones(direccionDiv) {
				var principalCDir = direccionDiv.direccionDiv.direccionDiv;
				var pCDirHTML = '<select id="idDireccion" name="direccion">';

				$.each(
						principalCDir,
								function(i) {
						pCDirHTML += '<option value="'  
		        		+ principalCDir[i].valor 
		        		+ '">' + principalCDir[i].opcion + '</option>';
								});
						pCDirHTML += '</select>';

				        console.log(pCDirHTML);

				$('#direccionDiv').append(pCDirHTML);
			}				

			//CARGA COMBO DE SUBDIRECCIONES VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_subdireciones.json', function(subDireccionDiv) {
					cargaCatSubDirecciones(subDireccionDiv);
				});
			});			
			
			function cargaCatSubDirecciones(subDireccionDiv) {
				var principalCSDir = subDireccionDiv.subDireccionDiv.subDireccionDiv;
				var pCSDirHTML = '<select id="idSubDireccion" name="subDireccion">';

				$.each(
						principalCSDir,
								function(i) {
						pCSDirHTML += '<option value="'  
		        		+ principalCSDir[i].valor 
		        		+ '">' + principalCSDir[i].opcion + '</option>';
								});
						pCSDirHTML += '</select>';

				        console.log(pCSDirHTML);

				$('#subDireccionDiv').append(pCSDirHTML);
			}				
			
			//CARGA COMBO DE ACTIVOS VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_activos.json', function(activosDiv) {
					cargaCatActivos(activosDiv);
				});
			});			
			
			function cargaCatActivos(activosDiv) {
				var principalCAct = activosDiv.activosDiv.activosDiv;
				var pCActHTML = '<select id="idActivos" name="activo">';

				$.each(
						principalCAct,
								function(i) {
							pCActHTML += '<option value="'  
		        		+ principalCAct[i].valor 
		        		+ '">' + principalCAct[i].opcion + '</option>';
								});
						pCActHTML += '</select>';

				        console.log(pCActHTML);

				$('#activosDiv').append(pCActHTML);
			}				

			//CARGA COMBO DE UNIDAD OPERATIVA VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_unidadoperativa.json', function(uOperativaDiv) {
					cargaCatUOperativa(uOperativaDiv);
				});
			});			
			
			function cargaCatUOperativa(uOperativaDiv) {
				var principalCUOper = uOperativaDiv.uOperativaDiv.uOperativaDiv;
				var pCUOperHTML = '<select id="idUOperativa" name="unidadOperativa">';

				$.each(
						principalCUOper,
								function(i) {
							pCUOperHTML += '<option value="'  
		        		+ principalCUOper[i].valor 
		        		+ '">' + principalCUOper[i].opcion + '</option>';
								});
						pCUOperHTML += '</select>';

				        console.log(pCUOperHTML);

				$('#uOperativaDiv').append(pCUOperHTML);
			}				
						
			
			//CARGA COMBO DE ACTIVIDAD VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_actividad.json', function(actividadDiv) {
					cargaCatActividad(actividadDiv);
				});
			});			
			
			function cargaCatActividad(actividadDiv) {
				var principalCActividad = actividadDiv.actividadDiv.actividadDiv;
				var pCActividadHTML = '<select id="idActividad" name="actividad">';

				$.each(
						principalCActividad,
								function(i) {
							pCActividadHTML += '<option value="'  
		        		+ principalCActividad[i].valor 
		        		+ '">' + principalCActividad[i].opcion + '</option>';
								});
						pCActividadHTML += '</select>';

				        console.log(pCActividadHTML);

				$('#actividadDiv').append(pCActividadHTML);
			}				
			
			//CARGA COMBO DE PROYECTOS VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_proyecto.json', function(proyectoDiv) {
					cargaCatProyecto(proyectoDiv);
				});
			});			
			
			function cargaCatProyecto(proyectoDiv) {
				var principalCProyecto = proyectoDiv.proyectoDiv.proyectoDiv;
				var pCProyectoHTML = '<select id="idProyecto" name="proyecto">';

				$.each(
						principalCProyecto,
								function(i) {
							pCProyectoHTML += '<option value="'  
		        		+ principalCProyecto[i].valor 
		        		+ '">' + principalCProyecto[i].opcion + '</option>';
								});
					pCProyectoHTML += '</select>';

				        console.log(pCProyectoHTML);

				$('#proyectoDiv').append(pCProyectoHTML);
			}					
			
			//CARGA COMBO DE CAMPOS VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_campo.json', function(campoDiv) {
					cargaCatCampo(campoDiv);
				});
			});			
			
			function cargaCatCampo(campoDiv) {
				var principalCCampo = campoDiv.campoDiv.campoDiv;
				var pCCampoHTML = '<select id="idCampo" name="campo">';

				$.each(
						principalCCampo,
								function(i) {
							pCCampoHTML += '<option value="'  
		        		+ principalCCampo[i].valor 
		        		+ '">' + principalCCampo[i].opcion + '</option>';
								});
					pCCampoHTML += '</select>';

				        console.log(pCCampoHTML);

				$('#campoDiv').append(pCCampoHTML);
			}	
			
						
			//CARGA COMBO DE CAMPOS VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_equipo.json', function(equipoDiv) {
					cargaCatEquipo(equipoDiv);
				});
			});			
			
			function cargaCatEquipo(equipoDiv) {
				var principalCEquipo = equipoDiv.equipoDiv.equipoDiv;
				var pCEquipoHTML = '<select id="idEquipo" name="equipo">';

				$.each(
						principalCEquipo,
								function(i) {
							pCEquipoHTML += '<option value="'  
		        		+ principalCEquipo[i].valor 
		        		+ '">' + principalCEquipo[i].opcion + '</option>';
								});
					pCEquipoHTML += '</select>';

				        console.log(pCEquipoHTML);

				$('#equipoDiv').append(pCEquipoHTML);
			}									

			//CARGA COMBO DE CAMPOS VIA JSON
			$(document).ready(function() {
				$.getJSON('/staticJson/cat_estatus.json', function(statusDiv) {
					cargaCatEstatus(statusDiv);
				});
			});			
			
			function cargaCatEstatus(estatusDiv) {
				var principalCEstatus = estatusDiv.estatusDiv.estatusDiv;
				var pCEstatusHTML = '<select id="idEstatus" name="estatus">';

				$.each(
						principalCEstatus,
								function(i) {
							pCEstatusHTML += '<option value="'  
		        		+ principalCEstatus[i].valor 
		        		+ '">' + principalCEstatus[i].opcion + '</option>';
								});
					pCEstatusHTML += '</select>';

				        console.log(pCEstatusHTML);

				$('#estatusDiv').append(pCEstatusHTML);
			}	
			
			//function mostrarValores(){
			//	alert("Valor de direccion: " + $('#idDireccion').val());
			//	mapaPozos.submit();
			//}
		</script>
	</head>

	<body onload="initialize()">
	<html:form styleId="mapaPozos" action="/consultaPozos.do?method=consultaPozos">

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
		  </div>
		
		  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		  <script>window.jQuery || document.write('<script src="/pozosPemex/js/jquery/jquery-1.9.1.min.js"><\/script>')</script>
		
		  <script src="/pozosPemex/js/jquery/main.js"></script>
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
	
	<table width="100%">
	<tr>
		<td  width="100%">			   	   
		<table align="center" border="1">
      	<tr>
	  	  <td align="left" width="20%" valign="top"> 
		  	  <table>
					 <tr><td>&nbsp;</td></tr>
			  		 <tr>
			  		 	 <td>Dirección:</td>
			  		 	 <td>
				  		 	 <div id="direccionDiv">
				  		 	 </div>			  		 	 
			  		 	 </td>
			  		 </tr>
			  		 <tr>
					 	 <td>SubDirección:</td>
						 <td>
				  		 	 <div id="subDireccionDiv">
				  		 	 </div>							 
						 </td>
					 </tr>
					 <tr>
					 	 <td>Activos: </td>
						 <td>
							<div id="activosDiv">
							</div>						 
						 </td>
					 </tr>
					 <tr>
					 	 <td>U.Operativa: </td>
						 <td>
							<div id="uOperativaDiv">
							</div>						 
						 </td>
					 </tr>
					 <tr>
					 	 <td>Actividad: </td>
						 <td>
							<div id="actividadDiv">
							</div>
						 </td>
					 </tr>
					 <tr>
					 	 <td>Proyecto: </td>
						 <td>
							<div id="proyectoDiv">
							</div>
						 </td>
					 </tr>
					 <tr>
					 	 <td>Campo: </td>
						 <td>
							<div id="campoDiv">
							</div>
						 </td>
					 </tr>
					 <tr>
					 	 <td>Equipo: </td>
						 <td>
							<div id="equipoDiv">
							</div>
						 </td>
					 </tr>
					 <tr>
					 	 <td>Estatus: </td>
						 <td>
							<div id="estatusDiv">
							</div>
						 </td>
					 </tr>
					 <tr><td>&nbsp;</td></tr>
					 <tr><td>&nbsp;</td></tr>
					 <tr>
					 	<td><input type="submit" value="Consultar"></td>
					 </tr>					 
			  </table>		  
		  </td>
      	  <td width="60%" valign="top">
		  	  <div id="googleMap" style="width:785px;height:580px;" align="right"></div>
		  </td>
      	  <td width="20%" valign="top">
                <div>
                  <a href="http://192.168.1.78:8080/pozosPemex/informacionTecnica/inicio.jsp"><img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo1_menuV.jpg"></a><br>                  
                  <a href="http://192.168.1.78:8080/pozosPemex/inicioIT.do?method=moduloInicioIT"><img alt="" title="Alta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo2_menuV2.jpg"></a><br>
		          <!-- img alt="" title="Consulta de Información Técnica" src="/pozosPemex/img/carrousel/imgPozo3_menuV.jpg"><br-->		                  
                </div>
		  </td>				   
      </tr>
	</table>
	</td>
	</tr>
	</table>
	</html:form>
	</body>
</html>