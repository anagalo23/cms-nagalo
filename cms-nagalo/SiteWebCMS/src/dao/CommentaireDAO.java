package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.*;
import java.util.ArrayList;
import java.util.List;
public class CommentaireDAO {
	
	private static String URL ="jdbc:mysql://localhost/cms";
	private static String USER ="root";
	private static String PASS ="";
	private static CommentaireDAO singleton;
	

	private CommentaireDAO()
	{
		// chargement du pilote Mysql
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("Impossible de charger le pilote de BDD, ne pas oublier d'importer le fichier mysql-connector-java-XXXX.jar dans le projet");
		}
	}
	
	public static CommentaireDAO getInstance()
	{
		if(CommentaireDAO.singleton==null)
			singleton=new CommentaireDAO();
		return singleton;
	}
	
	public int ajouterCommentaire(CommentaireDTO c, int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("INSERT INTO commentaire (pseudo,contenu,article_id) VALUES (?,?,?)");
			ps.setString(1,c.getPseudo());
			ps.setString(2,c.getContenu());
			ps.setInt(3, id);
			//on execute la requete 
			retour=ps.executeUpdate();


		} catch (Exception ee) {
			ee.printStackTrace();
		} finally {
			//fermeture du preparedStatement et de la connexion
			try {if (rs != null)rs.close();} catch (Exception t) {}
			try {if (ps != null)ps.close();} catch (Exception t) {}
			try {if (con != null)con.close();} catch (Exception t) {}
		}
		return retour;

	}
	
	public List<CommentaireDTO> getListeCommentaire(int idArticle)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		List<CommentaireDTO> retour=new ArrayList<CommentaireDTO>();
	
		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM commentaire WHERE article_id=?");
			ps.setInt(1,idArticle);		
			//on execute la requete 
			rs=ps.executeQuery();
			//on parcourt les lignes du resultat
			while(rs.next())
				retour.add(new CommentaireDTO(rs.getInt("id"),rs.getString("pseudo"),rs.getString("contenu"),rs.getString("date"),rs.getInt("article_id")));
			

		} catch (Exception ee) {
			ee.printStackTrace();
		} finally {
			//fermeture du rs,preparedStatement et de la connexion
			try {if (rs != null)rs.close();} catch (Exception t) {}
			try {if (ps != null)ps.close();} catch (Exception t) {}
			try {if (con != null)con.close();} catch (Exception t) {}
		}
		return retour;
	
	}
	
	public int deleteCommentaire(int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("DELETE  FROM commentaire WHERE id=?");
			ps.setInt(1,id);

			retour=ps.executeUpdate();

		} catch (Exception ee) {
			ee.printStackTrace();
		} finally {
			//fermeture du rs,preparedStatement et de la connexion
			try {if (rs != null)rs.close();} catch (Exception t) {}
			try {if (ps != null)ps.close();} catch (Exception t) {}
			try {if (con != null)con.close();} catch (Exception t) {}
		}
		return retour;	}

}
