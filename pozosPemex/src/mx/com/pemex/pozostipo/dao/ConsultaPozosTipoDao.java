package mx.com.pemex.pozostipo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mx.com.pemex.dao.MyBatisConnectionFactory;
import mx.com.pemex.pozostipo.dto.PozosTipoDto;
import mx.com.pemex.pozostipo.mybatis.mapper.PozosTipoMapper;

public class ConsultaPozosTipoDao {

	public List <PozosTipoDto> consultaPozosTipo(){
		System.out.println(" ### ConsultaPozosTipoDao.consultaPozosTipo ### ");
		
		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		List<PozosTipoDto> lstPozosInfo = new ArrayList <PozosTipoDto>();
		
		PozosTipoMapper pozosTipoMapper = session.getMapper(PozosTipoMapper.class);
		
		try{
			lstPozosInfo = pozosTipoMapper.spr_InformacionPozosTipo();
			System.out.println("Tamaño de la lista de pozosTipo: "+lstPozosInfo.size());
			
		}catch(Exception ex){
			System.out.println("Exception en ConsultaPozosTipoDao.consultaPozosTipo...");
			ex.printStackTrace(System.out);
		}finally {
			session.close();
		}
		
		return lstPozosInfo;
	}
}
