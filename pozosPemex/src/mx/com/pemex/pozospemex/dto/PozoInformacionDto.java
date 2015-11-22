package mx.com.pemex.pozospemex.dto;

public class PozoInformacionDto {

	public PozoInformacionDto(int id, String cve, int direccion, String descDireccion, int subDireccion, 
			String descSubDireccion, int activo, String descActivo, int unidadOperativa, 
			String descUnidadOperativa, int actividad, String descActividad, int proyecto, 
			String descProyecto, int campo, String descCampo, String pozo, String tipoPozo, 
			int equipo, String descEquipo, String numEquipo, String capEquipo, String tipoContrato, 
			String utr, String proxTr, String inclinacion, String desplazamiento, String profundidad, 
			String fechaInicio, String fechaTermino, String costoProg, String costoReal, 
			String formacionObj, String operacion, int estatus, String descEstatus, String indicador, 
			String validado, String obs, String responsable, String latitud, String longitud){
		this.setId(id);
		this.setCve(cve);
		this.setDireccion(subDireccion);
		this.setDescDireccion(descDireccion);
		this.setSubDireccion(subDireccion);
		this.setDescSubDireccion(descSubDireccion);
		this.setActivo(activo);
		this.setDescActivo(descActivo);
		this.setUnidadOperativa(unidadOperativa);
		this.setDescUnidadOperativa(descUnidadOperativa);
		this.setActividad(actividad);
		this.setDescActividad(descActividad);
		this.setProyecto(proyecto);
		this.setDescProyecto(descProyecto);
		this.setCampo(campo);
		this.setDescCampo(descCampo);
		this.setPozo(pozo);
		this.setTipoPozo(tipoPozo);
		this.setEquipo(equipo);
		this.setDescEquipo(descEquipo);
		this.setNumEquipo(numEquipo);
		this.setCapEquipo(capEquipo);
		this.setTipoContrato(tipoContrato);
		this.setUtr(utr);
		this.setProxTr(proxTr);
		this.setInclinacion(inclinacion);
		this.setDesplazamiento(desplazamiento);
		this.setProfundidad(profundidad);
		this.setFechaInicio(fechaInicio);
		this.setFechaTermino(fechaTermino);
		this.setCostoProg(costoProg);
		this.setCostoReal(costoReal);
		this.setFormacionObj(formacionObj);
		this.setOperacion(operacion);
		this.setEstatus(estatus);
		this.setDescEstatus(descEstatus);
		this.setIndicador(indicador);
		this.setValidado(validado);
		this.setObs(obs);
		this.setResponsable(responsable);
		this.setLatitud(latitud);
		this.setLongitud(longitud);
	}
	
	public PozoInformacionDto(){
		
	}
	
	private int id;
	private String cve;
	
	private int direccion;
	private String descDireccion;
	private int subDireccion;
	private String descSubDireccion;
	private int activo;
	private String descActivo;	
	private int unidadOperativa;
	private String descUnidadOperativa;
	private int actividad;
	private String descActividad;
	private int proyecto;
	private String descProyecto;
	private int campo;
	private String descCampo;

	private String pozo;
	private String tipoPozo;
	
	private int equipo;
	private String descEquipo;
	
	private String numEquipo;
	private String capEquipo;
	private String tipoContrato;
	private String utr;
	private String proxTr;
	private String inclinacion;
	private String desplazamiento;
	private String profundidad;
	private String fechaInicio;
	private String fechaTermino;
	private String costoProg;
	private String costoReal;
	private String formacionObj;
	private String operacion;
	
	private int estatus;
	private String descEstatus;
	private String indicador;
	
	private String validado;
	private String obs;
	private String responsable;
	private String latitud;
	private String longitud;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCve() {
		return cve;
	}
	public void setCve(String cve) {
		this.cve = cve;
	}
	public int getDireccion() {
		return direccion;
	}
	public void setDireccion(int direccion) {
		this.direccion = direccion;
	}
	public String getDescDireccion() {
		return descDireccion;
	}
	public void setDescDireccion(String descDireccion) {
		this.descDireccion = descDireccion;
	}
	public int getSubDireccion() {
		return subDireccion;
	}
	public void setSubDireccion(int subDireccion) {
		this.subDireccion = subDireccion;
	}
	public String getDescSubDireccion() {
		return descSubDireccion;
	}
	public void setDescSubDireccion(String descSubDireccion) {
		this.descSubDireccion = descSubDireccion;
	}
	public int getActivo() {
		return activo;
	}
	public void setActivo(int activo) {
		this.activo = activo;
	}
	public String getDescActivo() {
		return descActivo;
	}
	public void setDescActivo(String descActivo) {
		this.descActivo = descActivo;
	}
	public int getUnidadOperativa() {
		return unidadOperativa;
	}
	public void setUnidadOperativa(int unidadOperativa) {
		this.unidadOperativa = unidadOperativa;
	}
	public String getDescUnidadOperativa() {
		return descUnidadOperativa;
	}
	public void setDescUnidadOperativa(String descUnidadOperativa) {
		this.descUnidadOperativa = descUnidadOperativa;
	}
	public int getActividad() {
		return actividad;
	}
	public void setActividad(int actividad) {
		this.actividad = actividad;
	}
	public String getDescActividad() {
		return descActividad;
	}
	public void setDescActividad(String descActividad) {
		this.descActividad = descActividad;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public String getDescProyecto() {
		return descProyecto;
	}
	public void setDescProyecto(String descProyecto) {
		this.descProyecto = descProyecto;
	}
	public int getCampo() {
		return campo;
	}
	public void setCampo(int campo) {
		this.campo = campo;
	}
	public String getDescCampo() {
		return descCampo;
	}
	public void setDescCampo(String descCampo) {
		this.descCampo = descCampo;
	}
	public String getPozo() {
		return pozo;
	}
	public void setPozo(String pozo) {
		this.pozo = pozo;
	}
	public String getTipoPozo() {
		return tipoPozo;
	}
	public void setTipoPozo(String tipoPozo) {
		this.tipoPozo = tipoPozo;
	}
	public int getEquipo() {
		return equipo;
	}
	public void setEquipo(int equipo) {
		this.equipo = equipo;
	}
	public String getDescEquipo() {
		return descEquipo;
	}
	public void setDescEquipo(String descEquipo) {
		this.descEquipo = descEquipo;
	}
	public String getNumEquipo() {
		return numEquipo;
	}
	public void setNumEquipo(String numEquipo) {
		this.numEquipo = numEquipo;
	}
	public String getCapEquipo() {
		return capEquipo;
	}
	public void setCapEquipo(String capEquipo) {
		this.capEquipo = capEquipo;
	}
	public String getTipoContrato() {
		return tipoContrato;
	}
	public void setTipoContrato(String tipoContrato) {
		this.tipoContrato = tipoContrato;
	}
	public String getUtr() {
		return utr;
	}
	public void setUtr(String utr) {
		this.utr = utr;
	}
	public String getProxTr() {
		return proxTr;
	}
	public void setProxTr(String proxTr) {
		this.proxTr = proxTr;
	}
	public String getInclinacion() {
		return inclinacion;
	}
	public void setInclinacion(String inclinacion) {
		this.inclinacion = inclinacion;
	}
	public String getDesplazamiento() {
		return desplazamiento;
	}
	public void setDesplazamiento(String desplazamiento) {
		this.desplazamiento = desplazamiento;
	}
	public String getProfundidad() {
		return profundidad;
	}
	public void setProfundidad(String profundidad) {
		this.profundidad = profundidad;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getFechaTermino() {
		return fechaTermino;
	}
	public void setFechaTermino(String fechaTermino) {
		this.fechaTermino = fechaTermino;
	}
	public String getCostoProg() {
		return costoProg;
	}
	public void setCostoProg(String costoProg) {
		this.costoProg = costoProg;
	}
	public String getCostoReal() {
		return costoReal;
	}
	public void setCostoReal(String costoReal) {
		this.costoReal = costoReal;
	}
	public String getFormacionObj() {
		return formacionObj;
	}
	public void setFormacionObj(String formacionObj) {
		this.formacionObj = formacionObj;
	}
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public int getEstatus() {
		return estatus;
	}
	public void setEstatus(int estatus) {
		this.estatus = estatus;
	}
	public String getDescEstatus() {
		return descEstatus;
	}
	public void setDescEstatus(String descEstatus) {
		this.descEstatus = descEstatus;
	}
	public String getIndicador() {
		return indicador;
	}
	public void setIndicador(String indicador) {
		this.indicador = indicador;
	}
	public String getValidado() {
		return validado;
	}
	public void setValidado(String validado) {
		this.validado = validado;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public String getResponsable() {
		return responsable;
	}
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	public String getLatitud() {
		return latitud;
	}
	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}
	public String getLongitud() {
		return longitud;
	}
	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	
	

}
