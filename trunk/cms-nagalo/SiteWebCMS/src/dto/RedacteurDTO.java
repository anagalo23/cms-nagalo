package dto;

public class RedacteurDTO {
	int id;
	
	String nom;
	String prenom;
	String mail;
	String motPasse;
	String date;

	public RedacteurDTO (){

	}
	public RedacteurDTO(int id,String nom, String prenom, String mail, String motPasse, String date) {
		super();
		this.id=id;
		this.mail = mail;
		this.motPasse = motPasse;
		this.nom = nom;
		this.prenom = prenom;
		this.date= date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMotPasse() {
		return motPasse;
	}
	public void setMotPasse(String motPasse) {
		this.motPasse = motPasse;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "RedacteurDTO [id=" + id + ", nom=" + nom + ", prenom=" + prenom
				+ ", mail=" + mail + ", motPasse=" + motPasse + ", date="
				+ date + "]";
	}
	

	


}
