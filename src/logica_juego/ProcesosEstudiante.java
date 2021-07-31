package logica_juego;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;


public class ProcesosEstudiante {
	private Statement stmt;
	private ResultSet recordset;
	private String Nombre,cedula,correo,pass;
	private int edad,facu_id;
	
	public void asignar(String nombre,String cedula,String correo,String pass,int edad,int facu) {
		
		this.Nombre = nombre;
		this.cedula = cedula;
		this.correo = correo;
		this.pass = pass;
		this.edad = edad;
		this.facu_id = facu;
		
	}
	

	public boolean existe_usuario(String usuario,String pass,Conexion co )throws Exception {
		
		Connection cnn = null;
		try {
			cnn = co.ini_conexion();
			stmt = cnn.createStatement();
			recordset = stmt.executeQuery("SELECT estudiantes.id,estudiantes.nombre_completo,estudiantes.cedula,estudiantes.edad,usuarios.tipo,usuarios.usuario FROM usuarios INNER JOIN estudiantes ON estudiantes.id = usuarios.estudiante_id WHERE usuarios.usuario ='"+usuario+"' AND usuarios.contrasena = '"+pass+"'");
			boolean registros = recordset.next();
			cnn.close();
			return registros;
		}catch(SQLException e) {
			cnn.close();
			throw new Exception("\\n\\n\\t\\t xxx Error:"+e);
		}
		
	}
	
	public void insertar_nuevo(Conexion co)throws Exception{
		Connection cnn = null;
		String sql;
		try
		{
			cnn = co.ini_conexion();
			stmt =cnn.createStatement();
			sql = "INSERT INTO estudiantes(nombre_completo,cedula,edad,facultad_id,correo) VALUES ('"+Nombre+"','"+cedula+"',"+edad+","+facu_id+",'"+correo+"')";	
			stmt.executeUpdate(sql);
			cnn.close();
			
		}catch(Exception e) {
			System.out.println("ERROR "+e);
			cnn.close();
		}
		
	}
	
	
	
	public void insertar_user(int id,Conexion co)throws Exception{
		Connection cnn = null;
		String sql;
		try
		{
			cnn = co.ini_conexion();
			stmt =cnn.createStatement();
			sql = "INSERT INTO usuarios(usuario,contrasena,estudiante_id,tipo) VALUES ('"+correo+"','"+pass+"',"+id+",0)";	
			stmt.executeUpdate(sql);
			cnn.close();
			
		}catch(Exception e) {
			System.out.println("ERROR "+e);
			cnn.close();
		}
		
	}
	
	
		public int obtenerID (String cedula ,Conexion con) throws Exception{
			Connection cnn = null;
			int id = 0;
			try {
				cnn=con.ini_conexion();
				stmt = cnn.createStatement();
				recordset = stmt.executeQuery("SELECT id FROM estudiantes WHERE cedula='"+cedula+"'");
				while(recordset.next()) {
					id = recordset.getInt("id");
					cnn.close();
					return id;
				}
			
		}catch(SQLException e) {
			cnn.close();
			throw new Exception("Error"+e);
			
		}
			return id;
	}
		
		public String obtenerNombre (String correo,String pass,Conexion con) throws Exception{
			Connection cnn = null;
			String nom = " ";
			try {
				cnn=con.ini_conexion();
				stmt = cnn.createStatement();
				recordset = stmt.executeQuery("SELECT nombre_completo FROM estudiantes INNER JOIN usuarios "
						+ "ON estudiantes.id=usuarios.estudiante_id "
						+ "WHERE  correo='"+correo+"' AND contrasena='"+pass+"';");
				while(recordset.next()) {
					nom = recordset.getString("nombre_completo");
					cnn.close();
					return nom;
				}
			
		}catch(SQLException e) {
			cnn.close();
			throw new Exception("Error"+e);
			
		}
			return nom;
	}
}
