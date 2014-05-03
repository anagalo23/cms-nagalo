package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
	
	private static String URL ="jdbc:mysql://localhost/mydb";
	private static String USER ="root";
	private static String PASS ="";
	private static ArticleDAO singleton;
	
	
	private ArticleDAO()
	{
		// chargement du pilote Mysql
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("Impossible de charger le pilote de BDD, ne pas oublier d'importer le fichier mysql-connector-java-XXXX.jar dans le projet");
		}
	}
	
	
	public static ArticleDAO getInstance()
	{
		if(ArticleDAO.singleton==null)
			singleton=new ArticleDAO();
		return singleton;
	}
	
	public int ajouterArticle(ArticleDTO a)
	{
		Connection con=null;
		PreparedStatement ps = null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("INSERT INTO article (titre,contenu,redacteur_id) VALUES (?,?,?)");
			ps.setString(1,a.getTitre());
			ps.setString(2,a.getContenu_art());
			ps.setInt(3, a.getIdRedacteur());

			//on execute la requete 
			retour=ps.executeUpdate();


		} catch (Exception ee) {
			ee.printStackTrace();
		} finally {
			//fermeture du preparedStatement et de la connexion
			try {if (ps != null)ps.close();} catch (Exception t) {}
			try {if (con != null)con.close();} catch (Exception t) {}
		}
		return retour;

	}
	
	public ArticleDTO getUnArticle(int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArticleDTO retour=null;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM article WHERE id=?");
			ps.setInt(1,id);

			//on execute la requete 
			rs=ps.executeQuery();
			if(rs.next())
				retour=new ArticleDTO(rs.getInt("id"),rs.getString("titre"),rs.getString("contenu"),rs.getString("date"),rs.getInt("redacteur_id"));


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
	
	public ArticleDTO rechercheArticle(String titre)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArticleDTO retour=null;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM article WHERE titre=?");
			ps.setString(1,titre);

			//on execute la requete 
			rs=ps.executeQuery();
			if(rs.next())
				retour=new ArticleDTO(rs.getInt("id"),rs.getString("titre"),rs.getString("contenu"),rs.getString("date"),rs.getInt("redacteur_id"));


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
	

	public List<ArticleDTO> CompteArticle(int idRedacteur)
	{
		
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		List<ArticleDTO> retour=new ArrayList<ArticleDTO>();
	
		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM article WHERE redacteur_id=?");
			ps.setInt(1, idRedacteur);						
			//on execute la requete 
			rs=ps.executeQuery();
			//on parcourt les lignes du resultat
			while(rs.next())
				retour.add(new ArticleDTO(rs.getInt("id"),rs.getString("titre"),rs.getString("contenu"),rs.getString("date"),rs.getInt("redacteur_id")));
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
	
	
	public List<ArticleDTO> getListeArticle()
	{
		
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		List<ArticleDTO> retour=new ArrayList<ArticleDTO>();
	
		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM article");
									
			//on execute la requete 
			rs=ps.executeQuery();
			//on parcourt les lignes du resultat
			while(rs.next())
				retour.add(new ArticleDTO(rs.getInt("id"),rs.getString("titre"),rs.getString("contenu"),rs.getString("date"),rs.getInt("redacteur_id")));
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
	

	public int updateArticle(ArticleDTO a, int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("UPDATE article SET  titre =?,contenu=?,redacteur_id =? WHERE id=?");
			ps.setString(1,a.getTitre());
			ps.setString(2,a.getContenu_art());
			ps.setInt(3, a.getIdRedacteur());
			ps.setInt(4, id);

			//on execute la requete 
			retour=ps.executeUpdate();


		} catch (Exception ee) {
			ee.printStackTrace();
		} finally {
			//fermeture du preparedStatement et de la connexion
			try {if (ps != null)ps.close();} catch (Exception t) {}
			try {if (con != null)con.close();} catch (Exception t) {}
		}
		return retour;

	}
	
	public int deleteArticle(int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("DELETE  FROM article WHERE id=?");
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
		return retour;

	}
}
