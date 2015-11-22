package mx.com.pemex.informaciontecnica.dto;

import java.sql.ResultSet;

public class InfoTecDto2 {
	
	public InfoTecDto2(int fechasPublicacion, int tipoDoctos, int especialidades, String cadenaAbuscar){
		this.setCadenaAbuscar(cadenaAbuscar);
		this.setEspecialidades(especialidades);		
		this.setTipoDoctos(tipoDoctos);
		this.setFechasPublicacion(fechasPublicacion);
	}
	
	private int fechasPublicacion;
	private int tipoDoctos;
	private int especialidades;
	private String cadenaAbuscar;
	//private Object resultadoBusqueda;
	
	public int getFechasPublicacion() {
		return fechasPublicacion;
	}
	public void setFechasPublicacion(int fechasPublicacion) {
		this.fechasPublicacion = fechasPublicacion;
	}
	public int getTipoDoctos() {
		return tipoDoctos;
	}
	public void setTipoDoctos(int tipoDoctos) {
		this.tipoDoctos = tipoDoctos;
	}
	public int getEspecialidades() {
		return especialidades;
	}
	public void setEspecialidades(int especialidades) {
		this.especialidades = especialidades;
	}
	public String getCadenaAbuscar() {
		return cadenaAbuscar;
	}
	public void setCadenaAbuscar(String cadenaAbuscar) {
		this.cadenaAbuscar = cadenaAbuscar;
	}
	
}
