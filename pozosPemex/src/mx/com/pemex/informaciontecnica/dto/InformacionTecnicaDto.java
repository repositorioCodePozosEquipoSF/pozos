package mx.com.pemex.informaciontecnica.dto;

public class InformacionTecnicaDto {

	/*public InformacionTecnicaDto(int id, int idEspecialidad, String descEspecialidad, int idDocto, String descDocto, String titulo_docto, 
								 int fecha_publicacion, String idArticulo, String autores, String url, String archivo_pdf){
		this.setId(id);
		this.setIdEspecialidad(idEspecialidad);
		this.setIdDocto(idDocto);
		this.setDescDocto(descDocto);
		this.setTitulo_docto(titulo_docto);
		this.setFecha_publicacion(fecha_publicacion);
		this.setIdArticulo(idArticulo);
		this.setAutores(autores);
		this.setUrl(url);
		this.setArchivo_pdf(archivo_pdf);
	}*/
	
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
	
}
