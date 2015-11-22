package mx.com.pemex.informaciontecnica.forms;

import org.apache.struts.action.ActionForm;

public class DatosComboForm extends ActionForm{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String valor;	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}

}
