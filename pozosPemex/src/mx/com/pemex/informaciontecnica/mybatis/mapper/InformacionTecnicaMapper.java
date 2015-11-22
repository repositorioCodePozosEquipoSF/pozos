package mx.com.pemex.informaciontecnica.mybatis.mapper;

import java.util.List;
import java.util.Map;

import mx.com.pemex.informaciontecnica.dto.DatosComboDto;
import mx.com.pemex.informaciontecnica.dto.InfoTecDto;
import mx.com.pemex.informaciontecnica.dto.InfoTecDto2;
import mx.com.pemex.informaciontecnica.dto.InformacionTecnicaDto;

public interface InformacionTecnicaMapper {

	List<DatosComboDto> spr_Especialidades();
	List<DatosComboDto> spr_TipoDocumento();
	List<DatosComboDto> spr_Compania();
	List<DatosComboDto> spr_Universidad();
	List<DatosComboDto> spr_CentroInvestigacion();
	
	List<InformacionTecnicaDto> spr_InformacionTecnica(InfoTecDto infoTec);
	//List<InformacionTecnicaDto> spr_InformacionTecnicaTxt(InfoTecDto infoTec);
	List<InformacionTecnicaDto> spr_InfoTecnTest(InfoTecDto2 infoTec);
	//List<InformacionTecnicaDto> spr_InfoTecnTest(Map<String, Object> params);
	void spi_AltaInformacionTecnica(InformacionTecnicaDto infoTec);
}
