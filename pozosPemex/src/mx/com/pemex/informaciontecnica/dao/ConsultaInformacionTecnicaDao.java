package mx.com.pemex.informaciontecnica.dao;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mx.com.pemex.dao.MyBatisConnectionFactory;
import mx.com.pemex.informaciontecnica.dto.DatosComboDto;
import mx.com.pemex.informaciontecnica.dto.InfoTecDto;
import mx.com.pemex.informaciontecnica.dto.InfoTecDto2;
import mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto;
import mx.com.pemex.informaciontecnica.mybatis.mapper.InformacionTecnicaMapper;

public class ConsultaInformacionTecnicaDao {

	public List<DatosComboDto> cargaCombo(int opcion){
		System.out.println(" ### ConsultaInformacionTecnicaDao.cargaCombo ### ");
		
		List<DatosComboDto> lstCombo = new ArrayList <DatosComboDto>();		

		DatosComboDto datosComboDto = null;
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		InformacionTecnicaMapper itMapper = session.getMapper(InformacionTecnicaMapper.class);
		
		try {
			if(opcion==1)
				lstCombo = itMapper.spr_Especialidades();
			else if(opcion==2)
				lstCombo = itMapper.spr_TipoDocumento();
			else if(opcion==3)
				lstCombo = itMapper.spr_Compania();
			else if(opcion==4)
				lstCombo = itMapper.spr_Universidad();
			else if(opcion==5)
				lstCombo = itMapper.spr_CentroInvestigacion();
			
			Iterator<DatosComboDto> registro = lstCombo.iterator();
			while(registro.hasNext()){
				datosComboDto = (DatosComboDto)registro.next();
				System.out.println("id= "+datosComboDto.getId()+" ::: "+"valor="+datosComboDto.getValor());
			}
			
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.cargaCombo");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}
		
		return lstCombo;
	}
	
	//public List<InformacionTecnicaDto> consultaDocumentos(String idEspecialidades, String idDocto, String fecha_publicacion, String cadenaAbuscar){
	public List<InformacionTecnicaDto> consultaDocumentos(int intEspeciArray[], int intTpoDocArray[], int intFecPubArray[], String cadenaAbuscar){
		System.out.println(" ### ConsultaInformacionTecnicaDao.consultaDocumentos ### ");
		
		List<InformacionTecnicaDto> lstDoctos = new ArrayList <InformacionTecnicaDto>();		
		InformacionTecnicaDto infoTecnicaDto = null;
		InfoTecDto infoTecDto = new InfoTecDto(cadenaAbuscar, 
											   intEspeciArray[0],intEspeciArray[1],intEspeciArray[2],intEspeciArray[3],intEspeciArray[4],
											   intTpoDocArray[0],intTpoDocArray[1],intTpoDocArray[2],intTpoDocArray[3],intTpoDocArray[4], 
											   intFecPubArray[0],intFecPubArray[1],intFecPubArray[2],intFecPubArray[3],intFecPubArray[4],intFecPubArray[5]);

		//System.out.println("Especialidades: "+infoTecDto.getEspecialidades()[0]+", "+infoTecDto.getEspecialidades()[1]);
		//System.out.println("Tipo Documentos: "+infoTecDto.getTipoDoctos()[0]+", "+infoTecDto.getTipoDoctos()[1]);
		//System.out.println("Fechas de publicacion: "+infoTecDto.getFechasPublicacion()[0]+", "+infoTecDto.getFechasPublicacion()[1]);
		System.out.println("Cadena a buscar: "+cadenaAbuscar);		
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		InformacionTecnicaMapper itMapper = session.getMapper(InformacionTecnicaMapper.class);
		
		try{
			lstDoctos = itMapper.spr_InformacionTecnica(infoTecDto);
			
			Iterator<InformacionTecnicaDto> registro = lstDoctos.iterator();
			while(registro.hasNext()){
				infoTecnicaDto = (InformacionTecnicaDto)registro.next();
				System.out.println("###################################");
				System.out.println("id= "+infoTecnicaDto.getId());
				System.out.println("idEspecialidad="+infoTecnicaDto.getIdEspecialidad()+" ::: "+"descEspecialidad="+infoTecnicaDto.getDescEspecialidad());
				System.out.println("idDocto="+infoTecnicaDto.getIdDocto()+" ::: "+"descDocto="+infoTecnicaDto.getDescDocto());
				System.out.println("idArticulo="+infoTecnicaDto.getIdArticulo()+" ::: "+"tituloDocto="+infoTecnicaDto.getTitulo_docto());
				System.out.println("autores="+infoTecnicaDto.getAutores());
				System.out.println("fecha_publicacion="+infoTecnicaDto.getFecha_publicacion());
				System.out.println("url="+infoTecnicaDto.getUrl()+" ::: "+"archivo_pdf="+infoTecnicaDto.getArchivo_pdf());
			}
			
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.consultaDocumentos");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}
		
		return lstDoctos;
	}
	
	/** YA NO SE USA ESTE METODO**/
	/*public List<InformacionTecnicaDto> consultaDocumentosTxt(String cadenaAbuscar){
		System.out.println(" ### ConsultaInformacionTecnicaDao.consultaDocumentosTxt ### ");

		List<InformacionTecnicaDto> lstDoctos = new ArrayList <InformacionTecnicaDto>();		
		InformacionTecnicaDto infoTecnicaDto = null;
		InfoTecDto infoTecDto = new InfoTecDto(cadenaAbuscar, new int[5], new int[5], new int[6]);

		System.out.println("Cadena a buscar: "+cadenaAbuscar);		
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		InformacionTecnicaMapper itMapper = session.getMapper(InformacionTecnicaMapper.class);
		try{
			lstDoctos = itMapper.spr_InformacionTecnicaTxt(infoTecDto);
			
			Iterator<InformacionTecnicaDto> registro = lstDoctos.iterator();
			while(registro.hasNext()){
				infoTecnicaDto = (InformacionTecnicaDto)registro.next();
				System.out.println("###################################");
				System.out.println("id= "+infoTecnicaDto.getId());
				System.out.println("idEspecialidad="+infoTecnicaDto.getIdEspecialidad()+" ::: "+"descEspecialidad="+infoTecnicaDto.getDescEspecialidad());
				System.out.println("idDocto="+infoTecnicaDto.getIdDocto()+" ::: "+"descDocto="+infoTecnicaDto.getDescDocto());
				System.out.println("idArticulo="+infoTecnicaDto.getIdArticulo()+" ::: "+"tituloDocto="+infoTecnicaDto.getTitulo_docto());
				System.out.println("autores="+infoTecnicaDto.getAutores());
				System.out.println("fecha_publicacion="+infoTecnicaDto.getFecha_publicacion());
				System.out.println("url="+infoTecnicaDto.getUrl()+" ::: "+"archivo_pdf="+infoTecnicaDto.getArchivo_pdf());
			}
			
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.consultaDocumentos");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}
		
		return lstDoctos;		
	}*/

	public List<InformacionTecnicaDto> consultaPrueba(String fecha_publicacion, String idDocto, String idEspecialidades, String cadenaAbuscar){
		System.out.println(" ### ConsultaInformacionTecnicaDao.consultaPrueba ### ");

		List<InformacionTecnicaDto> lstDoctos = new ArrayList <InformacionTecnicaDto>();		
		InformacionTecnicaDto infoTecnicaDto;

		/*Connection con = null;
		Statement stmt = null;
		ResultSet resultadoBusqueda = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:PEMEX", "EECHAVARRI", "EECHAVARRI07");
			stmt = con.createStatement();
		resultadoBusqueda = stmt.executeQuery("SELECT SYSDATE FROM DUAL");
		
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.consultaPrueba");
			ex.printStackTrace(System.out);
		}finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/		
		
		//ResultSet resultadoBusqueda = null;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fechasPublicacion", Integer.valueOf(fecha_publicacion).intValue());
		params.put("tipoDoctos", Integer.valueOf(idDocto).intValue());
		params.put("especialidades", Integer.valueOf(idEspecialidades).intValue());
		params.put("cadenaAbuscar", cadenaAbuscar);
		//params.put("resultadoBusqueda", resultadoBusqueda);
		
		InfoTecDto2 infoTecDto2 = new InfoTecDto2(Integer.valueOf(fecha_publicacion).intValue(), Integer.valueOf(idDocto).intValue(), Integer.valueOf(idEspecialidades).intValue(), cadenaAbuscar);
	
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		InformacionTecnicaMapper itMapper = session.getMapper(InformacionTecnicaMapper.class);
		
		try{
			lstDoctos = itMapper.spr_InfoTecnTest(infoTecDto2);

			System.out.println("Tamaño del resultSet: " + lstDoctos.size());
			Iterator<InformacionTecnicaDto> registro = lstDoctos.iterator();
			while(registro.hasNext()){
				infoTecnicaDto = (InformacionTecnicaDto)registro.next();
				System.out.println("###################################");
				System.out.println("id= "+infoTecnicaDto.getId());
				//System.out.println("idEspecialidad="+infoTecnicaDto.getIdEspecialidad()+" ::: "+"descEspecialidad="+infoTecnicaDto.getDescEspecialidad());
				//System.out.println("idDocto="+infoTecnicaDto.getIdDocto()+" ::: "+"descDocto="+infoTecnicaDto.getDescDocto());
				//System.out.println("idArticulo="+infoTecnicaDto.getIdArticulo()+" ::: "+"tituloDocto="+infoTecnicaDto.getTitulo_docto());
				//System.out.println("autores="+infoTecnicaDto.getAutores());
				//System.out.println("fecha_publicacion="+infoTecnicaDto.getFecha_publicacion());
				//System.out.println("url="+infoTecnicaDto.getUrl()+" ::: "+"archivo_pdf="+infoTecnicaDto.getArchivo_pdf());
			}
			
			//resultadoBusqueda = infoTecDto2.getResultadoBusqueda();
			//lstDoctos = (ArrayList<InformacionTecnicaDto>)params.get("resultadoBusqueda");			
			/*while(resultadoBusqueda.next()){
				System.out.println("id= "+resultadoBusqueda.getString(1)+" ::: idEspecialidad="+resultadoBusqueda.getString(2)+" ::: descEspecialidad="+resultadoBusqueda.getString(3)+" ::: idDocto="+resultadoBusqueda.getString(4)+" ::: descDocto="+resultadoBusqueda.getString(5));
			}*/
			
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.consultaPrueba");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}		
		
		return lstDoctos;
	}
	
	public void insertaAltaInfoTecnica(InformacionTecnicaDto infoTecDto){
		System.out.println(" ### ConsultaInformacionTecnicaDao.insertaAltaInfoTecnica ### ");
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		InformacionTecnicaMapper itMapper = session.getMapper(InformacionTecnicaMapper.class);
		try{		
			itMapper.spi_AltaInformacionTecnica(infoTecDto);
			System.out.println("Inserción hecha");
		}catch(Exception ex){
			System.out.println("Exception en OpcionesComboDao.consultaDocumentos");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}
	}
}
