package mx.com.pemex.informaciontecnica.filereport;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 * Servlet implementation class ExcelFileReport
 */
//@WebServlet("/GetExcelReport")
public class ExcelFileReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcelFileReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/vnd.ms-excel");
		
		PrintWriter out = response.getWriter(); 
		
		List<InformacionTecnicaDto> lstComboCit = new ArrayList<InformacionTecnicaDto>();
		InformacionTecnicaDto infoTecnicaDto = null;
		HttpSession session = request.getSession();
		
		/* ##### SE ESTABLECE EL ENCABEZADO ##### */
		out.println("Tipo Especialidad\tTipo Documento\tTitulo\tFecha Publicacion\tId Articulo\tAutores\tURL\tArchivo Referencia");
		
		lstComboCit = (ArrayList)session.getAttribute("lstComboCit");
		
		System.out.println("Tamaño de consulta: "+lstComboCit.size());		
		
		Iterator<InformacionTecnicaDto> registro = lstComboCit.iterator();
		
		/* ##### LLENADO DEL ARCHIVO ##### */
		while(registro.hasNext()){
			infoTecnicaDto = (InformacionTecnicaDto)registro.next();
			out.println(infoTecnicaDto.getDescEspecialidad()+"\t"+infoTecnicaDto.getDescDocto()+"\t"+infoTecnicaDto.getTitulo_docto()+"\t"+infoTecnicaDto.getFecha_publicacion()+"\t"+infoTecnicaDto.getIdArticulo()+"\t"+infoTecnicaDto.getAutores()+"\t"+infoTecnicaDto.getUrl()+"\t"+"ARCHIVO\\"+infoTecnicaDto.getArchivo_pdf());
		}
		
		/*out.println("Name\tJob\tSalary"); 
		out.println("Raj\tAccountant\t20000"); 
		out.println("Vinay\tAccountant\t20000"); 
		out.println("Rajesh\tAccountant\t20000"); 
		out.println("\tTotal:\t=sum(c2:c3)");*/ 
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/*public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}*/

}
