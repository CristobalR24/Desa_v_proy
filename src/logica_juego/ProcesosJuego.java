package logica_juego;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entidades.Pregunta;
import entidades.Respuesta;

public class ProcesosJuego {
	private Statement stmt; 
	private ResultSet recordset;
	
	
	public List<Pregunta> ObtenerPreguntas(int nivel, Conexion co) throws Exception{
		Connection cnn=co.ini_conexion();
        stmt = cnn.createStatement();
		List<Pregunta> lista=new ArrayList<Pregunta>();;
		try {
    		recordset = stmt.executeQuery("SELECT * From preguntas INNER JOIN tipo_preguntas ON tipo_preguntas.id = preguntas.tipo_pregunta"
    										+ " WHERE juego_id="+nivel); 
    		int x=0;
    		while (recordset.next()) {
    			 x=x+1;
    		Pregunta obj = new Pregunta();

    		obj.setId(recordset.getString("Id"));
    		obj.setNivel(recordset.getString("nivel_id"));
    		obj.setPregunta(recordset.getString("pregunta"));
    		obj.setTipo(recordset.getString("tipo"));
    		obj.setTipo_pregunta_id(recordset.getString("tipo_pregunta"));
    		obj.setRespuestas(ObtenerRespuesta(Integer.parseInt(recordset.getString("Id")),co));
    	
    		lista.add(obj);    		
    		}
    		cnn.close();
    		return lista;
    		}
    	catch (SQLException e) {
    		cnn.close();
    		throw new Exception ("\n\t\t\t\t  xxxx Error en en la consulta de todos los registros: "+e+" xxxx");
    		}
		catch (Exception e) {
    		cnn.close();
    		throw new Exception ("\n\t\t\t\t  xxxx Error desconocido: "+e+" xxxx");
    		}
	}
	
	public List<Respuesta> ObtenerRespuesta(int pregunta_id, Conexion co) throws Exception{
		Connection cnn=co.ini_conexion();
		stmt = cnn.createStatement();
		ResultSet recordset;
		
		List<Respuesta> lista=new ArrayList<Respuesta>();
		try {
    		recordset = stmt.executeQuery("SELECT * From respuestas  WHERE pregunta_id="+pregunta_id); 
    		
    		while (recordset.next()) {

    		Respuesta obj = new Respuesta();

    		obj.setId(recordset.getString("Id"));
    		obj.setPregunta_id(recordset.getString("pregunta_id"));
    		obj.setPuntaje(recordset.getString("puntaje"));
    		obj.setCorrecta(recordset.getString("correcta"));
    		obj.setRetroalimentacion(recordset.getString("retroalimentacion"));
    		obj.setRespuesta(recordset.getString("respuesta"));
    	
    		lista.add(obj);    		
    		}
    		cnn.close();
    		return lista;
    		}
		
    	catch (SQLException e) {
    		cnn.close();
    		throw new Exception ("\n\t\t\t\t  xxxx AQUI Error en en la consulta de todos los registros: "+e+" xxxx");
    		}
	}
	
	
}
