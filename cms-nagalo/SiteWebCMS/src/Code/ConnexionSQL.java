package Code;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionSQL{

	/**
	 * URL de connection
	 */
	private static String url ="jdbc:mysql://localhost/mydb";
	/**
	 * Nom du user
	 */
	private static String user ="root";
	/**
	 * Mot de passe du user
	 */
	private static String passwd ="";
	/**
	 * Objet Connection
	 */
	private static Connection connect;
	
	/**
	 * Méthode qui va nous retourner notre instance
	 * et la créer si elle n'existe pas...
	 * @return
	 */
	public static Connection getInstance(){
		if(connect == null){
			try {
				connect = DriverManager.getConnection(url, user, passwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return connect;	
	}	
}