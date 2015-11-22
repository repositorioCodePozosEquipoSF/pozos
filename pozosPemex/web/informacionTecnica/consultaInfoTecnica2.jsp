<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/c.tld" 		   prefix="c"%>
<%@ page import="java.util.List, java.util.ArrayList"  %>
<%@ page import="mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto"  %>
<% 
List<InformacionTecnicaDto>   lstConsulta = (ArrayList)request.getAttribute("lstComboCit");  
%>
<style>
	.row1{background-color:ivory; font-size: 8pt;}
	.row0{background-color:honeydew; font-size: 8pt;}
	
	div#tablaConsulta {
	    overflow: scroll;
	    width: initial;
	    height: 500px;
	}
</style>
				
<script type="text/javascript">

$("#divURL").css('cursor','pointer').attr('color', 'blue');
$("#imgXLS").css('cursor','pointer'); //.bind('click', function(event){
//	$.ajax({
//		type:		"POST",
		//url:		"/pozosPemex/exportarExcel.do?method=exportarExcel",
//		url:		"http://192.168.1.78:8080/pozosPemex/getExcelFileReport/GetExcelReport",
		//data:		{consultaExportar: "Hola"},
		//contentType:'application/x-www-form-urlencoded; charset=UTF-8',
//		contentType:'application/vnd.ms-excel',
//		success:	function(data, status){
//						alert("Exito!!!");
//					}
//	}); 											
//}
//);

//function exportarAexcel(objLista){

//$.ajax({
//type:		"POST",
//url:		"/pozosPemex/exportarExcel.do?method=exportarExcel",
//data:		{consultaExportar: objLista},
//contentType:'application/x-www-form-urlencoded; charset=UTF-8',
//success:	function(data, status){
//alert("Exito!!!");
//},
//dataType:	"text"
//}); 
//alert("Exito!!!");
//}
</script>
					 <p style="text-align: left; font-weight:bold; text-decoration: underline; font-size: 10pt; margin: 0;">Resultados encontrados: <%= request.getAttribute("contadorRegs") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<logic:notEmpty name="lstComboCit" scope="session"><a href="http://192.168.1.78:8080/pozosPemex/getExcelFileReport/GetExcelReport"><img id="imgXLS" alt="" title="Exportar a Excel" src="/pozosPemex/img/xls_image.jpg"></a></logic:notEmpty></p>
				 	 <logic:notEmpty name="lstComboCit" scope="session">
				 	 <table border="1" style="text-align: center;" >
					 		<tr style="font-weight:bold; background-color:forestgreen; color:white;">
								<td width="15%">Especialidad</td>
								<td width="15%">Tipo Documento</td>
								<td width="20%">Titulo Documento</td>
								<td width="14%">Fecha Publicacion</td>
								<td width="10%">Id Articulo</td>
								<td width="20%">Autor</td>
								<td width="10%">URL</td>
								<td width="20%">Archivo</td>
							</tr>
							<logic:iterate id="item" indexId="count" name="lstComboCit" type="mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto" scope="session">
					 		<tr style="font-weight:bold; background-color:ivory; color:black;">
								<td class="row<%= count.intValue()%2 %>" width="15%"><c:out value="${item.descEspecialidad}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="15%"><c:out value="${item.descDocto}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="20%"><c:out value="${item.titulo_docto}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="14%"><c:out value="${item.fecha_publicacion}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="10%"><c:out value="${item.idArticulo}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="20%">${item.autores}
									<!-- button id="opener<%= count.intValue() %>" onclick="a(<%= count .intValue() %>, <%= count.intValue() %>);">Mostrar autores</button>
									<div id="divDialog<%= count.intValue() %>" title="Autores" style="color: blue; cursor: pointer;">${item.autores}</div>
									<script type="text/javascript">
										$("#divDialog"+< % = count.intValue() %>).dialog({ autoOpen: false });
										$("#opener"+ < % = count.intValue() %>).click(function() { $("#divDialog"+< %= count.intValue() %>).dialog( "open" );});
									</script>
									
<onclick='mostrarDialog(divDialog< %= count.intValue() %>, "${item.autores}");'									
<button id="opener">open the dialog</button>
<div id="dialog" title="Dialog Title">I'm a dialog</div

$( "#dialog" ).dialog({ autoOpen: false });
$( "#opener" ).click(function() {
  $( "#dialog" ).dialog( "open" );
});

 -->									
									
									
								</td>
								<td class="row<%= count.intValue()%2 %>" width="10%"><div id="divURL" style="color: blue; cursor: pointer;"><a href="${item.url}" target="blank"><c:out value="${item.url}"/></a></div></td>
								<td class="row<%= count.intValue()%2 %>" width="20%"><div style="cursor: pointer;"><c:if test="${item.archivo_pdf != 'S/INF'}"><a href="http://192.168.1.78:8080/pozosPemex/abrirXls.do" target="blank"><img title="Nombre archivo: ${item.archivo_pdf}" alt="${item.archivo_pdf}" src="/pozosPemex/img/pdf_image.jpg"></a></c:if><c:if test="${item.archivo_pdf == 'S/INF'}"><c:out value="${item.archivo_pdf}"/></c:if></div></td>
							</tr>
							</logic:iterate>
					 </table>
					</logic:notEmpty>
					<logic:empty name="lstComboCit" scope="session">
						<table style="text-align: center; font-size: 14pt;">
							<tr><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td><b>No se encontraron resultados con los filtros especificados</b></td>
							</tr>
						</table>
					</logic:empty>