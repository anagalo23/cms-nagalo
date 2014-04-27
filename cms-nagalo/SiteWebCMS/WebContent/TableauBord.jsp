<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="dao.*,dto.*,java.util.*"%>


<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<title>Tableau de bord</title>
<link rel="icon" type="image/png" href="logo.PNG" />
</head>
<body>
 
	<section>

		<img id="logo" src="logo.PNG">GONA
		<h1>Tableau de bord</h1>

 	
	<aside id="menuAside">
	<table id="menuPr" >
		<tr>
			<td><a href="Controleur.jsp?action=Affichage_article">Tous les articles</a> <hr/></td>
		</tr>
		<tr>
			<td><a href="Controleur.jsp?action=GererCommentaire">Commentaires</a> <hr/></td>
		</tr>
		<tr>
			<td><a href="Controleur.jsp?action=configuration">Configuration</a> <hr/></td>
		</tr>
		<tr> <td><a href="Controleur.jsp?action=deconnecter" >Déconnecter</a></td></tr>
	</table>
	</aside> <%
 	List<ArticleDTO> l = ArticleDAO.getInstance().getListeArticle();
 	int nombreCom=0;
 %>

 
	<article>
	<%String nom= (String)session.getAttribute("nom");%>
	<h2>Bienvenue, <%=nom.toUpperCase()%> <%=session.getAttribute("prenom")%></h2>

	<div id="maindiv">

		<fieldset id="divg"><legend>Que voulez-vous faire ? </legend> 
			<ul>
				<li><a href="Controleur.jsp?action=AjoutArticle">Ajouter un
						Article</a></li>
				<li><a href="Controleur.jsp?action=GererArticle">Gérer les
						Articles</a></li>
				<li><a href="Controleur.jsp?action=GererCommentaire">Gérer
						les Commentaires</a></li>
				<li><a href="Controleur.jsp?action=configuration">Configuration</a></li>
			</ul>
			 </fieldset>
		
	<%if (l!=null){
		for(ArticleDTO ar:l){
			if(CommentaireDAO.getInstance()
		 			.getListeCommentaire(ar.getId()).size()!=0){
				nombreCom+=CommentaireDAO.getInstance()
			 			.getListeCommentaire(ar.getId()).size();
			}
		}
	}%>
	
		<fieldset id="divd">
			<legend>Vous avez:  </legend><br /> <br />
			<%=l.size()%>
			articles <br />
			<%
				if (nombreCom== 0) {
			%>
			pas de commentaires
			<%
				} else if (nombreCom== 1){
			%>
			1 commentaire
			<%
				}else {
			%>
			<%=nombreCom%>
			
			commentaires
			<%
				}
			%>
		</fieldset>

	</div>

	</article>
	<%%>
	 </section>

	<footer> </footer>
</body>
</html>