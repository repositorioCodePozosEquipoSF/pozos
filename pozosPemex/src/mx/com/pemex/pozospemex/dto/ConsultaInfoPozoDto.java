package mx.com.pemex.pozospemex.dto;

public class ConsultaInfoPozoDto {

	/*public ConsultaInfoPozoDto(int actividad, int activo, int campo, int direccion,
			int equipo, int estatus, int proyecto, int subDireccion, int unidadOperativa){
		this.setActividad(actividad);
		this.setActivo(activo);
		this.setCampo(campo);
		this.setDireccion(subDireccion);
		this.setEquipo(equipo);
		this.setEstatus(estatus);
		this.setProyecto(proyecto);
		this.setSubDireccion(subDireccion);
		this.setUnidadOperativa(unidadOperativa);
	}*/
	
	private int direccion;
	private int subDireccion;
	private int activo;
	private int unidadOperativa;
	private int actividad;
	private int proyecto;
	private int campo;
	private int equipo;
	private int estatus;
	
	public int getDireccion() {
		return direccion;
	}
	public void setDireccion(int direccion) {
		this.direccion = direccion;
	}
	public int getSubDireccion() {
		return subDireccion;
	}
	public void setSubDireccion(int subDireccion) {
		this.subDireccion = subDireccion;
	}
	public int getActivo() {
		return activo;
	}
	public void setActivo(int activo) {
		this.activo = activo;
	}
	public int getUnidadOperativa() {
		return unidadOperativa;
	}
	public void setUnidadOperativa(int unidadOperativa) {
		this.unidadOperativa = unidadOperativa;
	}
	public int getActividad() {
		return actividad;
	}
	public void setActividad(int actividad) {
		this.actividad = actividad;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getCampo() {
		return campo;
	}
	public void setCampo(int campo) {
		this.campo = campo;
	}
	public int getEquipo() {
		return equipo;
	}
	public void setEquipo(int equipo) {
		this.equipo = equipo;
	}
	public int getEstatus() {
		return estatus;
	}
	public void setEstatus(int estatus) {
		this.estatus = estatus;
	}	
	
}
