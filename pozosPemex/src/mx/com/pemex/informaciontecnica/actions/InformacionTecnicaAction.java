package mx.com.pemex.informaciontecnica.actions;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mx.com.pemex.informaciontecnica.dao.ConsultaInformacionTecnicaDao;
import mx.com.pemex.informaciontecnica.dto.DatosComboDto;
//import mx.com.pemex.informaciontecnica.forms.DatosComboForm;

import mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class InformacionTecnicaAction extends DispatchAction{

	public ActionForward moduloInicioIT(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionTecnicaAction.moduloInicioIT ###");
		
		ActionForward forward = new ActionForward();
		
		//DatosComboForm comboEsp = new DatosComboForm();
		//DatosComboForm comboTipoDoc = new DatosComboForm();
		ConsultaInformacionTecnicaDao objDao = new ConsultaInformacionTecnicaDao();
		List<DatosComboDto> lstComboEsp = new ArrayList<DatosComboDto>();
		List<DatosComboDto> lstComboTdo = new ArrayList<DatosComboDto>();
		List<DatosComboDto> lstComboCia = new ArrayList<DatosComboDto>();
		List<DatosComboDto> lstComboUni = new ArrayList<DatosComboDto>();
		List<DatosComboDto> lstComboCin = new ArrayList<DatosComboDto>();
		
		try{
			lstComboEsp = objDao.cargaCombo(1);	//COMBO DE ESPECIALIDADES
			lstComboTdo = objDao.cargaCombo(2);	//COMBO DE TIPO DE DOCUMENTO
			//lstComboCia = objDao.cargaCombo(3);	//COMBO DE TIPO DE COMPANIA
			//lstComboUni = objDao.cargaCombo(4);	//COMBO DE TIPO DE UNIVERSIDAD
			//lstComboCin = objDao.cargaCombo(5);	//COMBO DE TIPO DE CENTRO DE INVESTIGACION
			
		}catch(Exception ex){
			System.out.println("Exception en InformacionTecnicaAction.moduloInicioLA");
			ex.printStackTrace(System.out);
		}
		
		request.setAttribute("lstComboEsp", lstComboEsp);
		request.setAttribute("lstComboTdo", lstComboTdo);
		//request.setAttribute("lstComboCia", lstComboCia);
		//request.setAttribute("lstComboUni", lstComboUni);
		//request.setAttribute("lstComboCin", lstComboCin);
		
		forward.setPath("/informacionTecnica/altaInfoTecnica.jsp");		
		return forward;		
	}
	
	public ActionForward consultaInfoTec(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionTecnicaAction.consultaInfoTec ###");

		ActionForward forward = new ActionForward();
		
		String idEspecialidades = (String)request.getParameter("especialidades");
		String idDocto = (String)request.getParameter("tipoDoctos");
		String fecha_publicacion = (String)request.getParameter("fechasPublicacion");
		String cadenaAbuscar = (String)request.getParameter("cadenaAbuscar");
		ConsultaInformacionTecnicaDao objDao = new ConsultaInformacionTecnicaDao();
		List<InformacionTecnicaDto> lstComboCit = new ArrayList<InformacionTecnicaDto>();
		int contador = 0;

		HttpSession session = request.getSession();		
		
		System.out.println("Especialidades: "+idEspecialidades);
		System.out.println("Tipo Documentos: "+idDocto);
		System.out.println("Fechas de publicacion: "+fecha_publicacion);
		System.out.println("Cadena a buscar: "+cadenaAbuscar);

		char arregloEspecialidades[] = idEspecialidades.toCharArray();
		char arregloTipoDoctos[] = idDocto.toCharArray(); 
		char arregloFechaPublicacion[] = fecha_publicacion.toCharArray();
		int intEspeciArray[] = new int[5];
		int intTpoDocArray[] = new int[5];
		int intFecPubArray[] = new int[6];
		
		int j=0;
		if(arregloEspecialidades.length > 0){
			for(int i=0; i<arregloEspecialidades.length; i++){
				if(arregloEspecialidades[i] != ','){
					Integer intgr = new Integer(arregloEspecialidades[i]);
					int numero = Integer.parseInt(intgr.toString()) - 48;
					intEspeciArray[j] = numero;
					j++;				
					System.out.println("arregloEspecialidades["+i+"]="+arregloEspecialidades[i]+" convertido a int="+numero);				
				}
			}						
		}else{
			System.out.println("No se seleccionaron filtros de especialidades...");
			/* ##### LA OPCION 3 NO SE UTILIZA ###### */
			intEspeciArray[0]=1;
			intEspeciArray[1]=2;
			intEspeciArray[2]=4;
			intEspeciArray[3]=5;
			intEspeciArray[4]=6;
		}

		j=0;
		if(arregloTipoDoctos.length > 0){
			for(int i=0; i<arregloTipoDoctos.length; i++){
				if(arregloTipoDoctos[i] != ','){
					Integer intgr = new Integer(arregloTipoDoctos[i]);
					int numero = Integer.parseInt(intgr.toString()) - 48;
					intTpoDocArray[j] = numero;
					j++;
					System.out.println("arregloTipoDoctos["+i+"]="+arregloTipoDoctos[i]+" convertido a int="+numero);
				}
			}		
		}else{
			System.out.println("No se seleccionaron filtros de tipos de documentos...");
			intTpoDocArray[0] = 1;
			intTpoDocArray[1] = 2;
			intTpoDocArray[2] = 3;
			intTpoDocArray[3] = 4;
			intTpoDocArray[4] = 5;
		}
		
		int i=0;		
		String num = "";
		j = 0;
		if(arregloFechaPublicacion.length > 0){
			do{
				
				if(arregloFechaPublicacion[i] != ','){
					num = num + arregloFechaPublicacion[i];
				}
				else{
					Integer intgr = new Integer(num);
					int numero = Integer.parseInt(intgr.toString());
					intFecPubArray[j] = numero;
					j++;
					System.out.println("num convertido a int="+numero);				
					num = "";
				}			
				i++;
				/* ##### PARA QUE SE TOME EN CUENTA EL ULTIMO NUMERO ##### */
				if(i == arregloFechaPublicacion.length){
					Integer intgr = new Integer(num);
					int numero = Integer.parseInt(intgr.toString());
					intFecPubArray[j] = numero;
					j++;
					System.out.println("num convertido a int="+numero);				
					num = "";				
				}
			}while(i<arregloFechaPublicacion.length);
		}else{
			System.out.println("No se seleccionaron filtros de fecha de publicacion...");
			intFecPubArray[0] = 2015;
			intFecPubArray[1] = 2014;
			intFecPubArray[2] = 2013;
			intFecPubArray[3] = 2012;
			intFecPubArray[4] = 2011;
			intFecPubArray[5] = 2010;
		}	
		try{
			
			//lstComboCit = objDao.consultaPrueba(fecha_publicacion, idDocto, idEspecialidades, cadenaAbuscar);			
			//lstComboCit = objDao.consultaDocumentos(idEspecialidades, idDocto, fecha_publicacion, cadenaAbuscar);
			
			lstComboCit = objDao.consultaDocumentos(intEspeciArray, intTpoDocArray, intFecPubArray, cadenaAbuscar);
			
			contador = lstComboCit.size();
			
			if(lstComboCit.isEmpty()){
				System.out.println("No se encontraron registros con los filtros especificados!!!");
				/*InformacionTecnicaDto objVacio = new InformacionTecnicaDto();
				
				objVacio.setId(0);
				objVacio.setIdEspecialidad(0);
				objVacio.setIdDocto(0);
				objVacio.setDescDocto("Sin datos");
				objVacio.setTitulo_docto("Sin datos");
				objVacio.setFecha_publicacion(0);
				objVacio.setIdArticulo("Sin datos");
				objVacio.setAutores("Sin datos");
				objVacio.setUrl("Sin datos");
				objVacio.setArchivo_pdf("Sin datos");
				lstComboCit.add(objVacio);*/
			}
		}catch(Exception ex){
			System.out.println("Exception en InformacionTecnicaAction.consultaInfoTec");
			ex.printStackTrace(System.out);
		}
		
		//request.setAttribute("lstComboCit", lstComboCit);
		session.setAttribute("lstComboCit", lstComboCit);
		request.setAttribute("contadorRegs", contador);
		
		forward.setPath("/informacionTecnica/consultaInfoTecnica.jsp");		
		return forward;		
	}

	/** ESTE METODO YA NO SE USA **/
	/*public ActionForward consultaInfoTecCadena(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionTecnicaAction.consultaInfoTecCadena ###");

		ActionForward forward = new ActionForward();
		
		String cadenaAbuscar = (String)request.getParameter("cadenaAbuscar");
		OpcionesComboDao objDao = new OpcionesComboDao();
		List<InformacionTecnicaDto> lstComboCit = new ArrayList<InformacionTecnicaDto>();
		int contador = 0;
		
		HttpSession session = request.getSession();	
		
		try{
			lstComboCit = objDao.consultaDocumentosTxt(cadenaAbuscar);
			contador = lstComboCit.size();
			
			if(lstComboCit.isEmpty()){
				InformacionTecnicaDto objVacio = new InformacionTecnicaDto();
				
				objVacio.setId(0);
				objVacio.setIdEspecialidad(0);
				objVacio.setIdDocto(0);
				objVacio.setDescDocto("Sin datos");
				objVacio.setTitulo_docto("Sin datos");
				objVacio.setFecha_publicacion(0);
				objVacio.setIdArticulo("Sin datos");
				objVacio.setAutores("Sin datos");
				objVacio.setUrl("Sin datos");
				objVacio.setArchivo_pdf("Sin datos");
				lstComboCit.add(objVacio);
			}			
		}catch(Exception ex){
			System.out.println("Exception en InformacionTecnicaAction.consultaInfoTecCadena");
			ex.printStackTrace(System.out);
		}
		
		//request.setAttribute("lstComboCit", lstComboCit);
		session.setAttribute("lstComboCit", lstComboCit);
		request.setAttribute("contadorRegs", contador);
		
		forward.setPath("/informacionTecnica/consultaInfoTecnica2.jsp");		
		return forward;
	}*/
	
	public ActionForward altaInfoTec(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionTecnicaAction.altaInfoTec ###");

		ActionForward forward = new ActionForward();
		
		String idEspecialidad = (String)request.getParameter("idEspecialidad");
		String idDocto = (String)request.getParameter("idDocto");
		String fecha_publicacion = (String)request.getParameter("fecha_publicacion");
		String titulo_docto = (String)request.getParameter("titulo_docto");
		String idArticulo = (String)request.getParameter("idArticulo");
		String autores = (String)request.getParameter("autores");
		String url = (String)request.getParameter("url");
		String archivo = (String)request.getParameter("archivo_pdf");

		ConsultaInformacionTecnicaDao objDao = new ConsultaInformacionTecnicaDao();
		InformacionTecnicaDto objITdto = new InformacionTecnicaDto();
		//List<InformacionTecnicaDto> lstComboCit = new ArrayList<InformacionTecnicaDto>();

		System.out.println("idEspecialidad="+idEspecialidad+" ::: idDocto="+idDocto+" ::: fecha_publicacion="+fecha_publicacion);
		System.out.println("titulo_docto="+titulo_docto+" ::: idArticulo="+idArticulo+" ::: autores="+autores);
		System.out.println("url="+url+" ::: archivo_pdf="+archivo);
		
		objITdto.setId(0);
		objITdto.setIdEspecialidad(Integer.valueOf(idEspecialidad).intValue());
		objITdto.setIdDocto(Integer.valueOf(idDocto).intValue());
		objITdto.setDescDocto("");
		objITdto.setTitulo_docto(titulo_docto);
		objITdto.setFecha_publicacion(Integer.valueOf(fecha_publicacion).intValue());
		objITdto.setIdArticulo(idArticulo);
		objITdto.setAutores(autores);
		objITdto.setUrl(url);
		objITdto.setArchivo_pdf(archivo);
		
		try{
			objDao.insertaAltaInfoTecnica(objITdto);
		}catch(Exception ex){
			System.out.println("Exception en InformacionTecnicaAction.altaInfoTec");
			ex.printStackTrace(System.out);
		}
		
		forward.setPath("/informacionTecnica/altaInfoTecnica.jsp");		
		return forward;
	}
	
	/* ##### SE PASÓ PARTE DE ESTA FUNCIONALIDAD AL SERVLET QUE GENERA EL EXCEL  */
	public ActionForward exportarExcel(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionTecnicaAction.exportarExcel ###");

		ActionForward forward = new ActionForward();
		
		List<InformacionTecnicaDto> lstComboCitTot = new ArrayList<InformacionTecnicaDto>();
		List<InformacionTecnicaDto> lstComboCit = new ArrayList<InformacionTecnicaDto>();
		InformacionTecnicaDto infoTecnicaDto = null;
		InformacionTecnicaDto infoTecnicaDtoHeader = new InformacionTecnicaDto();
		HttpSession session = request.getSession();
		
		/* ##### SE ESTABLECE EL ENCABEZADO ##### */
		infoTecnicaDtoHeader.setDescEspecialidad("Tipo Especialidad");
		infoTecnicaDtoHeader.setDescDocto("Tipo Documento");
		infoTecnicaDtoHeader.setTitulo_docto("Titulo");
		infoTecnicaDtoHeader.setFecha_publicacion(0);
		infoTecnicaDtoHeader.setIdArticulo("Id Articulo");
		infoTecnicaDtoHeader.setAutores("Autores");
		infoTecnicaDtoHeader.setUrl("URL");
		infoTecnicaDtoHeader.setArchivo_pdf("Archivo Referencia");
		lstComboCitTot.add(infoTecnicaDtoHeader);
		
		lstComboCit = (ArrayList)session.getAttribute("lstComboCit");
		
		/* ##### SE ADJUNTA AL HEADER LO DATOS DE LA CONSULTA ##### */
		lstComboCitTot.addAll(lstComboCit);
		
		System.out.println("Tamaño de consulta: "+lstComboCitTot.size());
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Consulta infoTecnica");
		
		/* ##### SE CREA EL ESTILO EN LETRAS NEGRITAS PARA EL HEADER ##### */
		short border = 1;
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setFillForegroundColor(HSSFColor.SEA_GREEN.index);
		style.setFillBackgroundColor(HSSFColor.SEA_GREEN.index);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setBorderBottom(border);
		style.setBorderRight(border);
		style.setBorderTop(border);
		style.setBorderLeft(border);

		int contador = 0;
		/* ##### PARA QUE APLIQUE UNA SOLA VEZ EL ESTILO EN LA CABECERA ##### */
		boolean flag = true;
		
		Iterator<InformacionTecnicaDto> registro = lstComboCitTot.iterator();
		
		/* ##### LLENADO DEL ARCHIVO ##### */
		int rownum = 0;
		while(registro.hasNext()){
			infoTecnicaDto = (InformacionTecnicaDto)registro.next();
		    Row row = sheet.createRow(rownum++);
		    int cellnum = 0;
		    for(contador = 0; contador<8; contador++){
		        Cell cell = row.createCell(cellnum++);
		        if(contador==0)
		        	cell.setCellValue(infoTecnicaDto.getDescEspecialidad());
		        else if(contador==1)
		        	cell.setCellValue(infoTecnicaDto.getDescDocto());
		        else if(contador==2)
		        	cell.setCellValue(infoTecnicaDto.getTitulo_docto());
		        else if(contador==3){
		        	cell.setCellValue(infoTecnicaDto.getFecha_publicacion());
		        	if(flag)
		        		cell.setCellValue("Fecha de Publicacion");
		        }else if(contador==4)
		        	cell.setCellValue(infoTecnicaDto.getIdArticulo());
		        else if(contador==5)
		        	cell.setCellValue(infoTecnicaDto.getAutores());
		        else if(contador==6)
		        	cell.setCellValue(infoTecnicaDto.getUrl());
		        else if(contador==7)
		        	cell.setCellValue("ARCHIVO\\"+infoTecnicaDto.getArchivo_pdf());
		        
		        if(flag)
		        	cell.setCellStyle(style);		    
		    }
		    flag = false;
		}
		
		
		try {
			
		    // Get current time
		    Calendar calendar = new GregorianCalendar();
		    String am_pm;
		    
		    int day = calendar.get(Calendar.DATE);
		    
		    int hour = calendar.get(Calendar.HOUR);
		    int minute = calendar.get(Calendar.MINUTE);
		    int second = calendar.get(Calendar.SECOND);
		    
		    if(calendar.get(Calendar.AM_PM) == 0)
		      am_pm = "AM";
		    else
		      am_pm = "PM";
		 
		    String CT = day + "_"+ hour+":"+ minute +":"+ second +" "+ am_pm;			
			
		    FileOutputStream out = new FileOutputStream(new File("C:\\json\\reportesExcel\\ReporteInfoTec_"+CT+".xls"));
		    workbook.write(out);
		    out.close();
		    System.out.println("Excel written successfully..");
		     
		} catch (FileNotFoundException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		/*String fileName = "file.txt"; //The file that will be saved on your computer
		// URL link = new URL("http://shayconcepts.com"); //The file that you want to download
		
		//Code to download
		try{
		 File file = new File("C:\\Nueva carpeta\\Reporte_prueba.xls");
		 //InputStream in = new BufferedInputStream(link.openStream());
		 FileInputStream in = new FileInputStream(file);
		 
		 ByteArrayOutputStream out = new ByteArrayOutputStream();
		 byte[] buf = new byte[1024];
		 int n = 0;
		 while (-1!=(n=in.read(buf)))
		 {
		    out.write(buf, 0, n);
		 }
		 out.close();
		 in.close();
		 byte[] respons = out.toByteArray();
		
		 FileOutputStream fos = new FileOutputStream(fileName);
		 fos.write(respons);
		 fos.close();
		} catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
	    } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
	    }*/
		//End download code
		 
		System.out.println("Finished");
				
		forward.setPath("/informacionTecnica/inicio.jsp");		
		return forward;		
		
	}
}
