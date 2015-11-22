package mx.com.pemex.pozospemex.actions;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import java.awt.Desktop;
import java.io.File;
//import java.net.URI;

public class AbrirXlsAction extends Action{

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### AbrirXlsAction.execute ###");
		
		ActionForward forward = new ActionForward();
		//URI uri = new URI("/pozosPemex/xls/NAT-1 14_10_14.xlsx");
		
		try {
			
			File pdfFile = new File("C:\\Users\\EmilioER\\workspace\\pozosPemex\\web\\xls\\NAT-1 14_10_14.xlsx");
			//File pdfFile = new File("C:\\Descargas\\Desarrollo\\mybatis-3.3.0\\mybatis-3.3.0\\mybatis-3.3.0.pdf");
			if (pdfFile.exists()) {

				if (Desktop.isDesktopSupported())
					Desktop.getDesktop().open(pdfFile);
				else
					System.out.println("Awt Desktop no es soportada!");

			}else
				System.out.println("Archivo no existe!");

			System.out.println("Archivo abierto!!!");

		}catch (Exception ex) {
				ex.printStackTrace();
		}
		
		return forward;
	}

}
