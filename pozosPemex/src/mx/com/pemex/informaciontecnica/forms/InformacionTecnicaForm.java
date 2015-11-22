package mx.com.pemex.informaciontecnica.forms;

import org.apache.struts.action.ActionForm;

public class InformacionTecnicaForm extends ActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int idEspecialidad;
	private String descEspecialidad;
	private int idDocto;
	private String descDocto;
	private String titulo_docto;
	private int fecha_publicacion;
	private String idArticulo;
	private String autores;
	private String url;
	private String archivo_pdf;
	private String compania;
	private String universidad;
	private String centroInvestigacion;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdEspecialidad() {
		return idEspecialidad;
	}
	public void setIdEspecialidad(int idEspecialidad) {
		this.idEspecialidad = idEspecialidad;
	}
	public String getDescEspecialidad() {
		return descEspecialidad;
	}
	public void setDescEspecialidad(String descEspecialidad) {
		this.descEspecialidad = descEspecialidad;
	}
	public int getIdDocto() {
		return idDocto;
	}
	public void setIdDocto(int idDocto) {
		this.idDocto = idDocto;
	}
	public String getDescDocto() {
		return descDocto;
	}
	public void setDescDocto(String descDocto) {
		this.descDocto = descDocto;
	}
	public String getTitulo_docto() {
		return titulo_docto;
	}
	public void setTitulo_docto(String titulo_docto) {
		this.titulo_docto = titulo_docto;
	}
	public int getFecha_publicacion() {
		return fecha_publicacion;
	}
	public void setFecha_publicacion(int fecha_publicacion) {
		this.fecha_publicacion = fecha_publicacion;
	}
	public String getIdArticulo() {
		return idArticulo;
	}
	public void setIdArticulo(String idArticulo) {
		this.idArticulo = idArticulo;
	}
	public String getAutores() {
		return autores;
	}
	public void setAutores(String autores) {
		this.autores = autores;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getArchivo_pdf() {
		return archivo_pdf;
	}
	public void setArchivo_pdf(String archivo_pdf) {
		this.archivo_pdf = archivo_pdf;
	}
	public String getCompania() {
		return compania;
	}
	public void setCompania(String compania) {
		this.compania = compania;
	}
	public String getUniversidad() {
		return universidad;
	}
	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	public String getCentroInvestigacion() {
		return centroInvestigacion;
	}
	public void setCentroInvestigacion(String centroInvestigacion) {
		this.centroInvestigacion = centroInvestigacion;
	}
		
}
