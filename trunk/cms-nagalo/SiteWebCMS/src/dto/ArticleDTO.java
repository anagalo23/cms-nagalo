package dto;

public class ArticleDTO {
int id;
String titre;
String contenu_art;
String date;
int idRedacteur;

public ArticleDTO() {
	super();
}

public ArticleDTO(int id, String titre,
		String contenu_art, String date , int idRedacteur) {
	super();
	this.id = id;
	this.titre = titre;
	this.contenu_art = contenu_art;
	this.date=date;
	this.idRedacteur=idRedacteur;

}


public String getTitre() {
	return titre;
}

public void setTitre(String titre) {
	this.titre = titre;
}



public String getContenu_art() {
	return contenu_art;
}

public void setContenu_art(String contenu_art) {
	this.contenu_art = contenu_art;
}



public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public int getIdRedacteur() {
	return idRedacteur;
}

public void setIdRedacteur(int idRedacteur) {
	this.idRedacteur = idRedacteur;
}

@Override
public String toString() {
	return "ArticleDTO [id=" + id + ", titre=" + titre + ", contenu_art="
			+ contenu_art + ", date=" + date + ", idRedacteur=" + idRedacteur
			+ "]";
}





}
