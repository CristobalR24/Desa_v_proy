package logica_juego;
import java.sql.*;

public class Conexion {
	private String nom_BD,user_BD,pass_BD;
	Connection cnn;
	
	public Conexion(){
		this.nom_BD="C:\\Users\\crist\\eclipse-workspace\\Extreme dev game\\WebContent\\db\\juego.accdb";
		this.user_BD="";
		this.pass_BD="";
	}
   public Connection ini_conexion() throws Exception {
   try {
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");                
    cnn=DriverManager.getConnection("jdbc:ucanaccess://"+nom_BD,user_BD, pass_BD);
    return cnn ;}
   catch (ClassNotFoundException e){ 
         throw new Exception ("\n\t\t\t\t  xxxx Error: No se pudo cargar el driver puente Jdbc_Odbc xxxx"); }
   catch (SQLException e){ 
         throw new Exception ("\n\t\t\t\t  xxxx Error: No se pudo establecer la conexion con la base de dato "+e+"xxxx");}
    }
}
