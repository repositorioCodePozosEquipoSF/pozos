package mx.com.pemex.pozospemex.actions;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import java.awt.Desktop;
import java.io.File;
//import java.net.URI;

public class AbrirAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### AbrirAction.execute ###");
		
		ActionForward forward = new ActionForward();
		String staticFiles = "E:\\Shares\\PortalArchivos\\StaticFiles\\";
		String archivo = request.getParameter("file").toString();
		String fileFolder="";

		try {
			
//			if (archivo.substring(0, archivo.lastIndexOf(".")).equals("xls")
//					|| archivo.substring(0, archivo.lastIndexOf(".")).equals("xlsx")) {
//				fileFolder = "excel";
//				System.out.println(fileFolder);
//			} else if (getExtension(archivo).equals("pdf")) {
//				fileFolder = "pdf";
//				System.out.println(fileFolder);
//			} else if (archivo.substring(0, archivo.lastIndexOf(".")).equals("doc")
//					|| archivo.substring(0, archivo.lastIndexOf(".")).equals("docx")) {
//				fileFolder = "doc";
//				System.out.println(fileFolder);
//			}
//			System.out.println(staticFiles + fileFolder + "\\" + archivo);
//			File file = new File(staticFiles + fileFolder + "\\" + archivo);
			File file = new File(staticFiles + "pdf" + "\\" + "P-007.pdf");
//			if (file.exists()) {
//
//				if (Desktop.isDesktopSupported())
//					Desktop.getDesktop().open(file);
//				else
//					System.out.println("Awt Desktop no es soportada!");
//
//			}else
//				System.out.println("Archivo no existe!");

//			System.out.println("Archivo abierto!!!");

		}catch (Exception ex) {
				ex.printStackTrace();
		}
		
		return forward;
	}
	
	

}
