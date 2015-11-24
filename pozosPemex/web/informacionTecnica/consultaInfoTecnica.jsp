<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.commons.digester.rss.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/utilidades/utilidades" prefix="func"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%@ page
	import="mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto"%>
<%
// 	List<InformacionTecnicaDto> lstConsulta = (ArrayList) request.getAttribute("lstComboCit");
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
$("#imgXLS").css('cursor','pointer');
</script>
					 <p style="text-align: left; font-weight:bold; text-decoration: underline; font-size: 10pt; margin: 0;">Resultados encontrados: <%= request.getAttribute("contadorRegs") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<logic:notEmpty name="lstComboCit" scope="session"><a href="http://192.168.1.78:8080/pozosPemex/getExcelFileReport/GetExcelReport"><img id="imgXLS" alt="" title="Exportar a Excel" src="/pozosPemex/img/xls_image.jpg"></a></logic:notEmpty></p>
				 	 <logic:notEmpty name="lstComboCit" scope="session">
				 	 <table border="1" style="text-align: center; ">
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
								<td class="row<%= count.intValue()%2 %>" width="20%"><c:out value="${item.autores}"/></td>
								<td class="row<%= count.intValue()%2 %>" width="10%"><div id="divURL" style="color: blue; cursor: pointer;"><a href="${item.url}" target="blank"><c:out value="${item.url}"/></a></div></td>
				<td class="row<%= count.intValue()%2 %>" width="20%"><div
						style="cursor: pointer;">
						<c:if test="${item.archivo_pdf != 'S/INF'}">
						<c:out value="${utilidades.getExtension('hola.pdf')}"/>
<%-- 						${utilidades.getExtension(item.archivo_pdf)} --%>
							<p>${func:getExtension("hola.pdf") }</p>


						</c:if>
						<c:if test="${item.archivo_pdf == 'S/INF'}">
							<c:out value="${item.archivo_pdf}" />
						</c:if>
					</div></td>
			</tr>
							</logic:iterate>
					 </table>
					</logic:notEmpty>
					<logic:empty name="lstComboCit" scope="session">
						<table style="text-align: center;font-size: 14pt;">
							<tr><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td><b>No se encontraron resultados con los filtros especificados</b></td>
							</tr>
						</table>
					</logic:empty>