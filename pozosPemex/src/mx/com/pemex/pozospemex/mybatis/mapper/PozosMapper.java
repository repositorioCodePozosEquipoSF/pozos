package mx.com.pemex.pozospemex.mybatis.mapper;

import java.util.List;

import mx.com.pemex.pozospemex.dto.ConsultaInfoPozoDto;
import mx.com.pemex.pozospemex.dto.PozoInformacionDto;

public interface PozosMapper {

	List<PozoInformacionDto> spr_InformacionPozos(ConsultaInfoPozoDto infoPozos);
	
}
