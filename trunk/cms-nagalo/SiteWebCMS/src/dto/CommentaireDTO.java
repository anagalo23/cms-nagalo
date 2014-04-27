package dto;

public class CommentaireDTO {
	int id;
	String pseudo;
	String contenu;
	String date;
	int article_id;


	public CommentaireDTO() {
		super();
	}
	
	
	public CommentaireDTO(int id, String pseudo, String contenu, String date,int article_id) {
		super();
		this.id = id;
		this.pseudo = pseudo;
		this.contenu = contenu;
		this.date = date;
		this.article_id=article_id;
	}


	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPseudo() {
		return pseudo;
	}
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}
	
	public int getArticle_id() {
		return article_id;
	}


	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}


	@Override
	public String toString() {
		return "CommentaireDTO [id=" + id + ", pseudo=" + pseudo + ", contenu="
				+ contenu + ", date=" + date + ", article_id=" + article_id
				+ "]";
	}
	
	
	


}
