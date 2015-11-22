package mx.com.pemex.pozospemex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mx.com.pemex.dao.MyBatisConnectionFactory;
import mx.com.pemex.informaciontecnica.dto.DatosComboDto;
import mx.com.pemex.pozospemex.dto.ConsultaInfoPozoDto;
import mx.com.pemex.pozospemex.dto.PozoInformacionDto;
import mx.com.pemex.pozospemex.mybatis.mapper.PozosMapper;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ConsultaPozosDao {
	
	public List <PozoInformacionDto> consultaPozos(int actividad, int activo, int campo, int direccion, int equipo, int estatus, int proyecto, int subDireccion, int unidadOperativa){
		System.out.println(" ### ConsultaPozosDao.consultaPozos ### ");
		
		/*SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		List<PozoInformacionDto> lstPozosInfo = new ArrayList <PozoInformacionDto>();
		
		PozosMapper pozosMapper = session.getMapper(PozosMapper.class);
		
		try{
			
			lstPozosInfo = pozosMapper.spr_InformacionPozos(infoPozos);
			System.out.println("tamaño de la lista: "+lstPozosInfo.size());
			
		}catch(Exception ex){
			System.out.println("Exception en ConsultaPozosDao.consultaPozos");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}*/
		
	   // CONTROLADOR JDBC Y BD URL
	   final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";  
	   final String DB_URL = "jdbc:oracle:thin:@localhost:1521:PEMEX";

	   //  CREDENCIALES BD
	   final String USER = "pemex";
	   final String PASS = "pemex2015";		

	   List<PozoInformacionDto> lstPozosInfo = new ArrayList <PozoInformacionDto>();
	   //PozoInformacionDto pozoInformacionDto = new PozoInformacionDto();
	   
	   Connection conn = null;
	   Statement stmt = null;
	   
	   try{
	      //STEP 2: REGISTRO CONTROLADOR JDBC 
	      Class.forName("oracle.jdbc.driver.OracleDriver");

	      //STEP 3: ABRIR UNA CONEXION
	      System.out.println("Conectando a la base de datos...");
	      conn = DriverManager.getConnection(DB_URL,USER,PASS);

	      //STEP 4: CREANDO Y EJECUTANDO EL QUERY
	      System.out.println("Creando consulta...");
	      System.out.println("Actividad:    "+actividad);
	      System.out.println("Activo:       "+activo);
	      System.out.println("Campo:        "+campo);
	      System.out.println("Direccion:    "+direccion);
	      System.out.println("Equipo:       "+equipo);
	      System.out.println("Estatus:      "+estatus);
	      System.out.println("Proyecto:     "+proyecto);
	      System.out.println("SubDireccion: "+subDireccion);
	      System.out.println("Uni.Operativ: "+unidadOperativa);
	      
	      stmt = conn.createStatement();
	      String sql = "SELECT DISTINCT \n" + 
	    		"POZ.ID, POZ.CVE, \n" +
	    		"POZ.DIRECCION, DIRPOZ.DESCDIR, \n" +
	    		"POZ.SUBDIRECCION, SUB_POZ.DESCSUBDIR, \n" + 
	    		"POZ.ACTIVO, ACTPOZ.DESCACTIVO, \n" + 
	    		"POZ.UNIDADOPER, UOPPOZ.DESCUNIOPE, \n" + 
	    		"POZ.ACTIVIDAD, ACTDPOZ.DESCACTIVIDAD, \n" + 
	    		"POZ.PROYECTO, PROPOZ.DESCPROYECTO, \n" + 
	    		"POZ.CAMPO, CMPPOZ.DESCCAMPO, \n" + 
	    		"POZ.POZO, POZ.TIPO_POZO, POZ.EQUIPO, EQUPOZ.DESCEQUIPO, \n" + 
	    		"POZ.NUMEQUIPO, POZ.CAPEQUIPO, POZ.TIPO_CONTRATO, \n" + 
	    		"POZ.UTR, POZ.PROXTR, POZ.INCLINACION, \n" + 
	    		"POZ.DESPLAZAMIENTO, POZ.PROFUNDIDAD, \n" + 
	    		"POZ.FECHAINI, POZ.FECHAFIN, POZ.COSTO_PROG, \n" +
	    		"POZ.COSTO_REAL, POZ.FORMACION_OBJ, POZ.OPERACION, \n" +
	    		"POZ.STATUS, STSPOZ.DESCSTATUS, STSPOZ.INDICADOR, POZ.VALIDADO, \n" +
	    		"POZ.OBS, POZ.RESPONSABLE, POZ.LATITUD, POZ.LONGITUD \n" +
	    		"FROM PEMEX.POZO POZ, \n" +
	    		"PEMEX.ACTIVIDAD_POZO ACTDPOZ, \n" +
	    		"PEMEX.ACTIVO_POZO ACTPOZ, \n" +
	    		"PEMEX.CAMPO_POZO CMPPOZ, \n" +
	    		"PEMEX.DIRECCION_POZO DIRPOZ, \n" +
	    		"PEMEX.EQUIPO_POZO EQUPOZ, \n" +
	    		"PEMEX.PROYECTO_POZO PROPOZ, \n" +
	    		"PEMEX.STATUS_POZO STSPOZ, \n" +
	    		"PEMEX.SUBDIRECCION_POZO SUB_POZ, \n" +
	    		"PEMEX.UNIOPERATIVA_POZO UOPPOZ \n" +
	    		"WHERE POZ.DIRECCION = DIRPOZ.IDDIR \n" +
	    		"AND POZ.SUBDIRECCION = SUB_POZ.IDSUBDIR \n" +
	    		"AND POZ.ACTIVO = ACTPOZ.IDACTIVO \n" +
	    		"AND POZ.UNIDADOPER = UOPPOZ.IDUNIOPE \n" +
	    		"AND POZ.ACTIVIDAD = ACTDPOZ.IDACTIVIDAD \n" +
	    		"AND POZ.PROYECTO = PROPOZ.IDPROYECTO \n" +
	    		"AND POZ.CAMPO = CMPPOZ.IDCAMPO \n" +
	    		"AND POZ.EQUIPO = EQUPOZ.IDEQUIPO \n" +
	    		"AND POZ.STATUS = STSPOZ.IDSTATUS \n";
	      
	      /* VALIDANDO SI SE FILTRA POR DIRECCION O NO */
	      if(direccion == 0)
	    	  sql = sql + "AND DIRPOZ.IDDIR IN (SELECT IDDIR FROM PEMEX.DIRECCION_POZO) \n"; 
	      else
	    	  sql = sql + "AND DIRPOZ.IDDIR = " + direccion + " \n";
	    	
	      /* VALIDANDO SI SE FILTRA POR SUBDIRECCION O NO */
	      if(subDireccion == 0)
	    	  sql = sql + "AND SUB_POZ.IDSUBDIR IN (SELECT IDSUBDIR FROM PEMEX.SUBDIRECCION_POZO) \n"; 
	      else
	    	  sql = sql + "AND SUB_POZ.IDSUBDIR = " + subDireccion + " \n";
	    	  
	      /* VALIDANDO SI SE FILTRA POR ACTIVO O NO */
	      if(activo == 0)
	    	  sql = sql + "AND ACTPOZ.IDACTIVO IN (SELECT IDACTIVO FROM PEMEX.ACTIVO_POZO) \n"; 
	      else
	    	  sql = sql + "AND ACTPOZ.IDACTIVO = " + activo + " \n";

	      /* VALIDANDO SI SE FILTRA POR UNIDAD OPERATIVA O NO */
	      if(unidadOperativa == 0)
	    	  sql = sql + "AND UOPPOZ.IDUNIOPE IN (SELECT IDUNIOPE FROM PEMEX.UNIOPERATIVA_POZO) \n"; 
	      else
	    	  sql = sql + "AND UOPPOZ.IDUNIOPE = " + unidadOperativa + " \n";

	      /* VALIDANDO SI SE FILTRA POR ACTIVIDAD O NO */
	      if(actividad == 0)
	    	  sql = sql + "AND ACTDPOZ.IDACTIVIDAD IN (SELECT IDACTIVIDAD FROM PEMEX.ACTIVIDAD_POZO) \n"; 
	      else
	    	  sql = sql + "AND ACTDPOZ.IDACTIVIDAD = " + actividad + " \n";

	      /* VALIDANDO SI SE FILTRA POR PROYECTO O NO */
	      if(proyecto == 0)
	    	  sql = sql + "AND PROPOZ.IDPROYECTO IN (SELECT IDPROYECTO FROM PEMEX.PROYECTO_POZO) \n"; 
	      else
	    	  sql = sql + "AND PROPOZ.IDPROYECTO = " + proyecto + " \n";

	      /* VALIDANDO SI SE FILTRA POR CAMPO O NO */
	      if(campo == 0)
	    	  sql = sql + "AND CMPPOZ.IDCAMPO IN (SELECT IDCAMPO FROM PEMEX.CAMPO_POZO) \n"; 
	      else
	    	  sql = sql + "AND CMPPOZ.IDCAMPO = " + campo + " \n";

	      /* VALIDANDO SI SE FILTRA POR EQUIPO O NO */
	      if(equipo == 0)
	    	  sql = sql + "AND EQUPOZ.IDEQUIPO IN (SELECT IDEQUIPO FROM PEMEX.EQUIPO_POZO) \n"; 
	      else
	    	  sql = sql + "AND EQUPOZ.IDEQUIPO = " + equipo + " \n";

	      /* VALIDANDO SI SE FILTRA POR ESTATUS O NO */
	      if(estatus == 0)
	    	  sql = sql + "AND STSPOZ.IDSTATUS IN (SELECT IDSTATUS FROM PEMEX.STATUS_POZO) \n"; 
	      else
	    	  sql = sql + "AND STSPOZ.IDSTATUS  = " + estatus + " \n";

	      System.out.println("Consulta a ejecutar: "+sql);
	      ResultSet rs = stmt.executeQuery(sql);

	      //STEP 5: EXTRACCION DE DATOS DEL RESULT SET
	      while(rs.next()){
	         //OBTENCION DE CADA REGISTRO Y SE AGREGA A LA LISTA
	    	 /*pozoInformacionDto.setId(rs.getInt("ID"));
	    	 pozoInformacionDto.setCve(rs.getString("CVE"));
	    	 pozoInformacionDto.setDireccion(rs.getInt("DIRECCION"));
	    	 pozoInformacionDto.setDescDireccion(rs.getString("DESCDIR"));
	    	 pozoInformacionDto.setSubDireccion(rs.getInt("SUBDIRECCION"));
	    	 pozoInformacionDto.setDescSubDireccion(rs.getString("DESCSUBDIR"));
	    	 pozoInformacionDto.setActivo(rs.getInt("ACTIVO"));
	    	 pozoInformacionDto.setDescActivo(rs.getString("DESCACTIVO"));
	    	 pozoInformacionDto.setUnidadOperativa(rs.getInt("UNIDADOPER"));
	    	 pozoInformacionDto.setDescUnidadOperativa(rs.getString("DESCUNIOPE"));
	    	 pozoInformacionDto.setActividad(rs.getInt("ACTIVIDAD"));
	    	 pozoInformacionDto.setDescActividad(rs.getString("DESCACTIVIDAD"));
	    	 pozoInformacionDto.setProyecto(rs.getInt("PROYECTO"));
	    	 pozoInformacionDto.setDescProyecto(rs.getString("DESCPROYECTO"));
	    	 pozoInformacionDto.setCampo(rs.getInt("CAMPO"));
	    	 pozoInformacionDto.setDescCampo(rs.getString("DESCCAMPO"));
	    	 pozoInformacionDto.setPozo(rs.getString("POZO"));
	    	 pozoInformacionDto.setTipoPozo(rs.getString("TIPO_POZO"));
	    	 pozoInformacionDto.setEquipo(rs.getInt("EQUIPO"));
	    	 pozoInformacionDto.setDescEquipo(rs.getString("DESCEQUIPO"));
	    	 pozoInformacionDto.setNumEquipo(rs.getString("NUMEQUIPO"));
	    	 pozoInformacionDto.setCapEquipo(rs.getString("CAPEQUIPO"));
	    	 pozoInformacionDto.setTipoContrato(rs.getString("TIPO_CONTRATO"));
	    	 pozoInformacionDto.setUtr(rs.getString("UTR"));
	    	 pozoInformacionDto.setProxTr(rs.getString("PROXTR"));
	    	 pozoInformacionDto.setInclinacion(rs.getString("INCLINACION"));
	    	 pozoInformacionDto.setDesplazamiento(rs.getString("DESPLAZAMIENTO"));
	    	 pozoInformacionDto.setProfundidad(rs.getString("PROFUNDIDAD"));
	    	 pozoInformacionDto.setFechaInicio(rs.getString("FECHAINI"));
	    	 pozoInformacionDto.setFechaTermino(rs.getString("FECHAFIN"));
	    	 pozoInformacionDto.setCostoProg(rs.getString("COSTO_PROG"));
	    	 pozoInformacionDto.setCostoReal(rs.getString("COSTO_REAL"));
	    	 pozoInformacionDto.setFormacionObj(rs.getString("FORMACION_OBJ"));
	    	 pozoInformacionDto.setOperacion(rs.getString("OPERACION"));
	    	 pozoInformacionDto.setEstatus(rs.getInt("STATUS"));
	    	 pozoInformacionDto.setDescEstatus(rs.getString("DESCSTATUS"));
	    	 pozoInformacionDto.setIndicador(rs.getString("INDICADOR"));
	    	 pozoInformacionDto.setValidado(rs.getString("VALIDADO"));
	    	 pozoInformacionDto.setObs(rs.getString("OBS"));
	    	 pozoInformacionDto.setResponsable(rs.getString("RESPONSABLE"));
	    	 pozoInformacionDto.setLatitud(rs.getString("LATITUD"));
	    	 pozoInformacionDto.setLongitud(rs.getString("LONGITUD"));*/
	    	  
	    	 lstPozosInfo.add(new PozoInformacionDto(rs.getInt("ID"),rs.getString("CVE"),rs.getInt("DIRECCION"),rs.getString("DESCDIR"),rs.getInt("SUBDIRECCION"),
	    			 rs.getString("DESCSUBDIR"),rs.getInt("ACTIVO"),rs.getString("DESCACTIVO"),rs.getInt("UNIDADOPER"),
	    			 rs.getString("DESCUNIOPE"),rs.getInt("ACTIVIDAD"),rs.getString("DESCACTIVIDAD"),rs.getInt("PROYECTO"),
	    			 rs.getString("DESCPROYECTO"),rs.getInt("CAMPO"),rs.getString("DESCCAMPO"),rs.getString("POZO"),
	    			 rs.getString("TIPO_POZO"),rs.getInt("EQUIPO"),rs.getString("DESCEQUIPO"),rs.getString("NUMEQUIPO"),rs.getString("CAPEQUIPO"),
	    			 rs.getString("TIPO_CONTRATO"),rs.getString("UTR"),rs.getString("PROXTR"),rs.getString("INCLINACION"),rs.getString("DESPLAZAMIENTO"),
	    			 rs.getString("PROFUNDIDAD"),rs.getString("FECHAINI"),rs.getString("FECHAFIN"),rs.getString("COSTO_PROG"),rs.getString("COSTO_REAL"),
	    			 rs.getString("FORMACION_OBJ"),rs.getString("OPERACION"),rs.getInt("STATUS"),rs.getString("DESCSTATUS"),rs.getString("INDICADOR"),
	    			 rs.getString("VALIDADO"),rs.getString("OBS"),rs.getString("RESPONSABLE"),rs.getString("LATITUD"),rs.getString("LONGITUD")));
	    	 
	         //Display values
	         System.out.println("Id: " + rs.getInt("ID"));
	         System.out.println("Pozo: " + rs.getString("POZO"));
	         System.out.println("Latitud: " + rs.getString("LATITUD"));
	         System.out.println("Longitud: " + rs.getString("LONGITUD"));
	      }
	      //STEP 6: Clean-up environment
	      rs.close();
	      stmt.close();
	      conn.close();
	   }catch(SQLException se){
	      //Handle errors for JDBC
	      se.printStackTrace();
	   }catch(Exception e){
	      //Handle errors for Class.forName
	      e.printStackTrace();
	   }finally{
	      //finally block used to close resources
	      try{
	         if(stmt!=null)
	            stmt.close();
	      }catch(SQLException se2){
	      }// nothing we can do
	      try{
	         if(conn!=null)
	            conn.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }//end finally try
	   }//end try
	   System.out.println("Consulta hecha!!!");	   
	   
		return lstPozosInfo;
	}

}
