package mx.com.pemex.pozospemex.ConsultaPozos;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

public class ConsultaPozos {


	public List<String> getActivos(int valorOpcion) {
		
		List<String> menuItems = new Vector<String>();
		InputStream is = getClass().getClassLoader().getResourceAsStream("mx/com/pemex/pozospemex/properties/dwrapplication.properties");
		Properties appProps = new Properties();
		int menuCount=1, salir=0;

		if(valorOpcion==1){		
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.1." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//SI LA LISTA CONTIENE SOLO UN ELEMENTO, INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
					
				}while(salir==0);
				
			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}			
		}else if(valorOpcion==2){
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.2." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//SI LA LISTA CONTIENE SOLO UN ELEMENTO, INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
					
				}while(salir==0);

			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}			
		}else if(valorOpcion==3){
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.3." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//SI LA LISTA CONTIENE SOLO UN ELEMENTO, INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
					
				}while(salir==0);

			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}						
		}else if(valorOpcion==4){
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.4." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//SI LA LISTA CONTIENE SOLO UN ELEMENTO, INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
					
				}while(salir==0);

			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}						
		}else if(valorOpcion==5){
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.5." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//SI LA LISTA CONTIENE SOLO UN ELEMENTO, INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
					
				}while(salir==0);

			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}						
		}else if(valorOpcion==6){
			System.out.println("valorOpcion: "+valorOpcion);
			try{
				appProps.load(is);
				is.close();
				do{
					String menuItem = appProps.getProperty("activo.6." + menuCount);
					
					System.out.println("menuItem: "+menuItem);
					if(menuItem != null){
						menuItems.add(menuItem);
						menuCount++;
					}
					
					if (menuItem == null){
						//INSERTA LA OPCION DEFAULT PARA QUE TODOS LOS COMBOS TENGAN OPCION "0 - Seleccione"
						menuItems.add(0, "-Seleccione-");
						salir=1;
					}
											
				}while(salir==0);

			}catch(IOException ioex){
				System.out.println("Error en la carga de los items");
			}finally{
				System.out.println("Finally block!!!");
			}						
		}else{
			menuItems.add("-Seleccione-");
		}
		return menuItems;
	}
		
}
