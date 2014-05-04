package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.*;
import Code.*;
import java.util.ArrayList;
import java.util.List;

public  class RedacteurDAO {

	private static String URL ="jdbc:mysql://localhost/cms";
	private static String USER ="root";
	private static String PASS ="";
	private static RedacteurDAO singleton;


	private RedacteurDAO()
	{
		// chargement du pilote Mysql
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("Impossible de charger le pilote de BDD, ne pas oublier d'importer le fichier mysql-connector-java-XXXX.jar dans le projet");
		}
	}

	public static RedacteurDAO getInstance()
	{
		if(RedacteurDAO.singleton==null)
			singleton=new RedacteurDAO();
		return singleton;
	}


	public int ajouterRedacteur(RedacteurDTO r)
	{
		Connection con=null;
		PreparedStatement ps = null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("INSERT INTO redacteur (nom, prenom,mail,motPasse,profil) VALUES (?,?,?,?,?)");
			ps.setString(1,r.getNom());
			ps.setString(2,r.getPrenom());
			ps.setString(3,r.getMail());
			ps.setString(4,r.getMotPasse());
			ps.setString(5, r.getProfil());

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


	public RedacteurDTO getRedacteur(String mail, String password)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		RedacteurDTO retour=null;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM redacteur WHERE mail=? AND motPasse=?");
			ps.setString(1,mail);
			ps.setString(2, password);

			//on execute la requete 
			rs=ps.executeQuery();
			if(rs.next())
				retour=new RedacteurDTO(rs.getInt("id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("mail"),rs.getString("motPasse"),rs.getString("date"),rs.getString("profil"));


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
	public RedacteurDTO unRedacteur(int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		RedacteurDTO retour=null;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM redacteur WHERE id=?");
			ps.setInt(1,id);


			//on execute la requete 
			rs=ps.executeQuery();
			if(rs.next())
				retour=new RedacteurDTO(rs.getInt("id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("mail"),rs.getString("motPasse"),rs.getString("date"),rs.getString("profil"));


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

	public List<RedacteurDTO> getListRedacteur()
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		List<RedacteurDTO> retour=new ArrayList<RedacteurDTO>();

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("SELECT * FROM redacteur ");	
			//on execute la requete 
			rs=ps.executeQuery();
			//on parcourt les lignes du resultat
			while(rs.next())
				retour.add(new RedacteurDTO(rs.getInt("id"),rs.getString("nom"),rs.getString("prenom"),rs.getString("mail"),Crypte.decrypt(rs.getString("motPasse")),rs.getString("date"),rs.getString("profil")));

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



	public int updateReadacteur(RedacteurDTO r, int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int retour=0;
		//RedacteurDTO r= new RedacteurDTO();

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("UPDATE redacteur SET  nom =?,prenom=?,mail=?,motPasse=?,profil=?" +
					" WHERE id=?");
			ps.setString(1,r.getNom());
			ps.setString(2,r.getPrenom());
			ps.setString(3, r.getMail());
			ps.setString(4, Crypte.encrypt(r.getMotPasse()));
			ps.setString(5, r.getProfil());
			ps.setInt(6,id);
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


	public int deleteRedacteur(int id)
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int retour=0;

		//connexion a la base de données
		try {
			con=DriverManager.getConnection(URL, USER, PASS);
			ps = con.prepareStatement("DELETE  FROM redacteur WHERE id=?");
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
	
	/*public static void main(String[] args){
		
		RedacteurDTO redacteur= new RedacteurDTO(0,"goyat","helene","g@h.fr","12345","12/12/12","redacteur");
		System.out.println(RedacteurDAO.getInstance().ajouterRedacteur(redacteur));
		
		System.out.println(RedacteurDAO.getInstance().getRedacteur("nagalo@alexis.fr", "esigelec"));
	}*/

}
