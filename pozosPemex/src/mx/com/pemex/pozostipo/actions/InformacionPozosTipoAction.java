package mx.com.pemex.pozostipo.actions;

import java.util.ArrayList;
import java.util.List;

import mx.com.pemex.pozostipo.dao.ConsultaPozosTipoDao;
import mx.com.pemex.pozostipo.dto.PozosTipoDto;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InformacionPozosTipoAction extends DispatchAction{
	public ActionForward pozosTipo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### InformacionPozosTipoAction.pozosTipo ###");
		
		ActionForward forward = new ActionForward();
		ConsultaPozosTipoDao consultaPozosTipoDao = new ConsultaPozosTipoDao(); 
		List<PozosTipoDto> lstPzsTpo = new ArrayList<PozosTipoDto>();
		
		try{
			lstPzsTpo = consultaPozosTipoDao.consultaPozosTipo();
			
			
		}catch(Exception ex){
			System.out.println("Exception en InformacionPozosTipoAction.pozosTipo...");
			ex.printStackTrace(System.out);
		}
		
		request.setAttribute("lstPzsTpo", lstPzsTpo);
		
		forward.setPath("/pozosTipo/consultaPozosTipo.jsp");
		
		return forward;
	}
}
