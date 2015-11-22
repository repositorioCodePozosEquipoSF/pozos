<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>M&oacute;dulo de Informaci&oacute;n T&eacute;cnica</title>
	</head>

	<body>
		<html:form action="/consultaInfoTec.do?method=consultaInfoTec">
	    <table align="center">
	   		   <tr>
			   	   <td>
				   	   <a href="http://127.0.0.1:8080/pozosPemex/informacionTecnica/inicio.jsp"><img src="/pozosPemex/img/but_1.jpg" width="50" height="52" alt="Home" title=""/></a>
					   <a href="#"><img alt="Acerca de" src="/pozosPemex/img/but_2.jpg" name="r_2" width="95" height="66" border="0"></a>
					   <a href="#"><img alt="Servicios" src="/pozosPemex/img/but_3.jpg" name="r_3" width="95" height="66" border="0"></a>
					   <a href="#"><img alt="Gerencias" src="/pozosPemex/img/but_4.jpg" name="r_4" width="95" height="66" border="0"></a>
	                   <a href="#"><img alt="Gpos. Multidisciplinarios" src="/pozosPemex/img/but_5.jpg" name="r_5" width="95" height="66" border="0"></a>
	                   <a href="#"><img alt="Catálogos de servicios" src="/pozosPemex/img/but_6.jpg" name="r_6" width="95" height="66" border="0"></a>
	                   <a href="#"><img alt="Casos de Exito" src="/pozosPemex/img/but_7.jpg" name="r_7" width="95" height="66" border="0"></a>
	                   <a href="#"><img alt="Centro de servicios" src="/pozosPemex/img/but_8.jpg" name="r_7" width="95" height="66" border="0"></a>
	                   <a href="http://127.0.0.1:8080/pozosPemex/inicioIT.do?method=moduloInicioIT"><img alt="Información Técnica" src="/pozosPemex/img/but_10.jpg" name="r_7" width="95" height="66" border="0"></a>
	                   <a href="#"><img alt="" src="/pozosPemex/img/but_blanco.jpg" name="r_8" width="95" height="66" border="0"></a>
				   </td>
			   </tr>
	    </table>	
		<br><br>

		<table border="1">
			 <tr>
			 	 <td>Titulo:</td>
				 <td><input id="titulo_docto" type="text"></td>			 
				 <td></td>
			 	 <td>Especialidad:</td>
				 <td>
				 	<html:select styleId="cmbEsp" property="idEspecialidad" value="0">
				 		<html:options collection="lstComboEsp" property="id" labelProperty="valor" labelName="valor"/>
				 	</html:select>
				 	 <!-- select id="idEspecialidad">
					 		 <option value="0">-Seleccione-</option>
					 		 <option value="1">Estimulación</option>
					 		 <option value="2">Perforación</option>
					 		 <option value="3">Perforación-Terminación</option>
					 		 <option value="4">Terminación</option>
					 		 <option value="5">Reparación</option>
					 </select-->
				 </td>
				 <td></td>
			 	 <td>Documento:</td>
				 <td>
				 	<html:select styleId="cmbTdo" property="idDocto" value="0">
				 		<html:options collection="lstComboTdo" property="id" labelProperty="valor" labelName="valor"/>
				 	</html:select>
				 	 <!-- select id="idDocto">
					 		 <option value="0">-Seleccione-</option>
					 		 <option value="1">Artículo</option>
					 		 <option value="2">Libro</option>
					 		 <option value="3">Tesis</option>
					 		 <option value="4">Revista</option>
					 		 <option value="5">Patente</option>
					 </select-->
				 </td>
				 <td></td>
			 	 <td>Fecha publicación:</td>
				 <td><input id="fecha_publicacion" type="text" maxlength="4"></td>
			 </tr>		 
		</table>
		<br/><br/>
		
		<table border="1">
			 <tr>
			 	 <td>Autores:</td>
				 <td><input id="autores" type="text"></td>
				 <td></td>			 			 
			 	 <td>Universidades:</td>
				 <td>
				 	<html:select styleId="cmbUni" property="universidad" value="0">
				 		<html:options collection="lstComboUni" property="id" labelProperty="valor" labelName="valor"/>
				 	</html:select>
				 	 <!-- select id="idUniversidad">
					 		 <option value="0">-Seleccione-</option>
					 		 <option value="1">Universidad 1</option>
					 		 <option value="2">Universidad 1</option>
					 		 <option value="3">Universidad 1</option>
					 		 <option value="4">Universidad 1</option>
					 		 <option value="5">Universidad 1</option>
					 </select-->
				 </td>
				 <td></td>			 			 
			 	 <td>Compañías:</td>
				 <td>
				 	<html:select styleId="cmbCia" property="compania" value="0">
				 		<html:options collection="lstComboCia" property="id" labelProperty="valor" labelName="valor"/>
				 	</html:select>
				 	 <!-- select id="cias">
					 		 <option value="0">-Seleccione-</option>
					 		 <option value="1">Compania 1</option>
					 		 <option value="2">Compania 2</option>
					 		 <option value="3">Compania 3</option>
					 		 <option value="4">Compania 4</option>
					 		 <option value="5">Compania 5</option>
					 </select-->
				 </td>
				 <td></td>			 			 
			 	 <td>Centros de Investigación:</td>
				 <td>
				 	<html:select styleId="cmbCin" property="centroInvestigacion" value="0">
				 		<html:options collection="lstComboCin" property="id" labelProperty="valor" labelName="valor"/>
				 	</html:select>
				 	 <!-- select id="cInv">
					 		 <option value="0">-Seleccione-</option>
					 		 <option value="1">Centro de Investigación 1</option>
					 		 <option value="2">Centro de Investigación 2</option>
					 		 <option value="3">Centro de Investigación 3</option>
					 		 <option value="4">Centro de Investigación 4</option>
					 		 <option value="5">Centro de Investigación 5</option>
					 </select-->
				 </td>		 
			 </tr>
		</table>
		<br/><br/>
		
		<table border="1" align="center">
		 <tr>
		 	 <td> <input type="submit" value="Consultar" /> </td>
		 </tr>  
		</table>
		<!-- br/>
		<table border="1">
		 <tr>
		 	 <td>Especialidad</td>
			 <td>Tipo Documento</td>
			 <td>Título</td>
			 <td>Fecha publicación</td>
			 <td>Id Documento</td>
			 <td>Autores</td>
			 <td>URL</td>
			 <td>PDF</td>
		 </tr> 
		 <tr>
		 	 <td>Dato_Especialidad</td>
			 <td>Dato_Documento</td>
			 <td>Dato_Fecha publicación</td>
			 <td>Dato_Autores</td>
			 <td>Dato_Título</td>
		 </tr> 
		</table -->

	</html:form>
	
	</body>
</html>