package mx.com.pemex.pozospemex.actions;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import org.apache.struts.actions.DispatchAction;

import mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto;
import mx.com.pemex.pozospemex.dao.ConsultaPozosDao;
import mx.com.pemex.pozospemex.dto.ConsultaInfoPozoDto;
import mx.com.pemex.pozospemex.dto.PozoInformacionDto;
import mx.com.pemex.pozospemex.forms.*;

public class ConsultaPozosAction extends DispatchAction{
	
	public ActionForward pozosInicio(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### ConsultaPozosAction.pozosInicio ###");
		
		ActionForward forward = new ActionForward();
		ConsultaPozosForm forma = (ConsultaPozosForm)form;
		
		System.out.println(forma.getSubDireccion());
		System.out.println(forma.getActivo());
		System.out.println(forma.getEstatus());
		
		forward.setPath("/mapaPrincipal/prototipoV1.jsp");
		
		//return mapping.findForward("infoPozo");
		return forward;
	}
	
	public ActionForward consultaPozos(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		System.out.println("### ConsultaPozosAction.consultaPozos ###");
		
		ActionForward forward = new ActionForward();
		ConsultaPozosForm forma = (ConsultaPozosForm)form;
		List<PozoInformacionDto> lstPozosInfo = new ArrayList <PozoInformacionDto>();
		
		ConsultaPozosDao consultaPozosDao = new ConsultaPozosDao();
		PozoInformacionDto infoPozos = new PozoInformacionDto();
		String cadenaJson = "{ \"pozosConsulta\": { \"pozosConsulta\": [";
		System.out.println("Valor de direccion desde la forma: "+forma.getDireccion());
		
		try{
			lstPozosInfo = consultaPozosDao.consultaPozos(forma.getActividad(), forma.getActivo(), forma.getCampo(), forma.getDireccion(), forma.getEquipo(), forma.getEstatus(), forma.getProyecto(), forma.getSubDireccion(), forma.getUnidadOperativa());
			
			Iterator<PozoInformacionDto> registro = lstPozosInfo.iterator();
			while(registro.hasNext()){
				infoPozos = (PozoInformacionDto)registro.next();
				cadenaJson = cadenaJson + "{\"id\": \""+infoPozos.getId()+"\","+
										   "\"cve\": \""+(infoPozos.getCve()==null?"Sin dato":infoPozos.getCve())+"\","+
				                           "\"direccion\": \""+infoPozos.getDireccion()+"\","+
				                           "\"descDireccion\": \""+infoPozos.getDescDireccion()+"\","+
                						   "\"subDireccion\": \""+infoPozos.getSubDireccion()+"\","+
                						   "\"descSubDireccion\": \""+infoPozos.getDescSubDireccion()+"\","+ 
										   "\"activo\": \""+infoPozos.getActivo()+"\","+ 
										   "\"descActivo\": \""+infoPozos.getDescActivo()+"\","+ 
										   "\"unidadOperativa\": \""+infoPozos.getUnidadOperativa()+"\","+ 
										   "\"descUnidadOperativa\": \""+infoPozos.getDescUnidadOperativa()+"\","+ 
										   "\"actividad\": \""+infoPozos.getActividad()+"\","+ 
										   "\"descActividad\": \""+infoPozos.getDescActividad()+"\","+ 
										   "\"proyecto\": \""+infoPozos.getProyecto()+"\","+ 
										   "\"descProyecto\": \""+infoPozos.getDescProyecto()+"\","+ 
										   "\"campo\": \""+infoPozos.getCampo()+"\","+ 
										   "\"descCampo\": \""+infoPozos.getDescCampo()+"\","+ 
										   "\"pozo\": \""+infoPozos.getPozo()+"\","+ 
										   "\"tipoPozo\": \""+(infoPozos.getTipoPozo()==null?"Sin dato":infoPozos.getTipoPozo())+"\","+ 
										   "\"equipo\": \""+infoPozos.getEquipo()+"\","+ 
										   "\"descEquipo\": \""+infoPozos.getDescEquipo()+"\","+ 
										   "\"numEquipo\": \""+(infoPozos.getNumEquipo()==null?"Sin dato":infoPozos.getNumEquipo())+"\","+ 
										   "\"capEquipo\": \""+(infoPozos.getCapEquipo()==null?"Sin dato":infoPozos.getCapEquipo())+"\","+ 
										   "\"tipoContrato\": \""+(infoPozos.getTipoContrato()==null?"Sin dato":infoPozos.getTipoContrato())+"\","+ 
										   "\"utr\": \""+(infoPozos.getUtr()==null?"Sin dato":infoPozos.getUtr())+"\","+ 
										   "\"proxTr\": \""+(infoPozos.getProxTr()==null?"Sin dato":infoPozos.getProxTr())+"\","+ 
										   "\"inclinacion\": \""+(infoPozos.getInclinacion()==null?"Sin dato":infoPozos.getInclinacion())+"\","+ 
										   "\"desplazamiento\": \""+(infoPozos.getDesplazamiento()==null?"Sin dato":infoPozos.getDesplazamiento())+"\","+ 
										   "\"profundidad\": \""+(infoPozos.getProfundidad()==null?"Sin dato":infoPozos.getProfundidad())+"\","+ 
										   "\"fechaInicio\": \""+(infoPozos.getFechaInicio()==null?"Sin dato":infoPozos.getFechaInicio())+"\","+ 
										   "\"fechaTermino\": \""+(infoPozos.getFechaTermino()==null?"Sin dato":infoPozos.getFechaTermino())+"\","+ 
										   "\"costoProg\": \""+(infoPozos.getCostoProg()==null?"Sin dato":infoPozos.getCostoProg())+"\","+ 
										   "\"costoReal\": \""+(infoPozos.getCostoReal()==null?"Sin dato":infoPozos.getCostoReal())+"\","+ 
										   "\"formacionObj\": \""+(infoPozos.getFormacionObj()==null?"Sin dato":infoPozos.getFormacionObj())+"\","+ 
										   "\"operacion\": \""+(infoPozos.getOperacion()==null?"Sin dato":infoPozos.getOperacion())+"\","+ 
										   "\"estatus\": \""+infoPozos.getEstatus()+"\","+ 
										   "\"descEstatus\": \""+infoPozos.getDescEstatus()+"\","+ 
										   "\"indicador\": \""+infoPozos.getIndicador()+"\","+ 
										   "\"validado\": \""+(infoPozos.getValidado()==null?"Sin dato":infoPozos.getValidado())+"\","+ 
										   "\"obs\": \""+(infoPozos.getObs()==null?"Sin dato":infoPozos.getObs())+"\","+ 
										   "\"responsable\": \""+(infoPozos.getResponsable()==null?"Sin dato":infoPozos.getResponsable())+"\","+ 
										   "\"latitud\": \""+infoPozos.getLatitud()+"\","+ 
										   "\"longitud\": \""+infoPozos.getLongitud()+"\""+ 
										   "}"; 
				if(registro.hasNext())
					cadenaJson = cadenaJson + ",";
				else
					cadenaJson = cadenaJson + "]}}";				
			}
			System.out.println("Cadena Json: "+cadenaJson);
			
	        BufferedWriter output = null;
	        try {
	            File file = new File("c:\\StaticFiles\\json\\pozosInfo.json");
	            output = new BufferedWriter(new FileWriter(file));
	            output.write(cadenaJson);
	        } catch ( IOException e ) {
	            e.printStackTrace();
	        } finally {
	            if ( output != null ) output.close();
	        }
			
		}catch(Exception ex){
			System.out.println("Exception en ConsultaPozosAction.consultaPozos...");
			ex.printStackTrace(System.out);
		}
		
		request.setAttribute("lstPozosInfo", lstPozosInfo);
		request.setAttribute("cadenaJson", cadenaJson);
		//forward.setPath("/mapaPrincipal/prototipoV1.jsp");
		forward.setPath("/mapaPrincipal/prototipoV2.jsp");
		
		//return mapping.findForward("infoPozo");
		return forward;
	}

}
