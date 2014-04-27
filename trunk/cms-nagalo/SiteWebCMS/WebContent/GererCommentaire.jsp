<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="dao.*,dto.*,java.util.*"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<title>gerer les commentaires</title>
</head>
<body>
	<section>

		<img id="logo" src="logo.PNG">
		<h1>Gestion les commentaires</h1>

		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
			</div>
		</aside>
		<aside id="menuAside">
			<table id="menuTab">
				<tr>
					<td><a href="Controleur.jsp?action=Affichage_article">Tous
							les articles</a>
						<hr /></td>
				</tr>
				<tr>
					<td><a href="Controleur.jsp?action=GererCommentaire">Commentaires</a>
						<hr /></td>
				</tr>
				<tr>
					<td><a href="Controleur.jsp?action=configuration">Configuration</a>
						<hr /></td>
				</tr>
				<tr>
					<td><a href="Controleur.jsp?action=deconnecter">Déconnecter</a></td>
				</tr>

			</table>
		</aside>

		<article id="Contenu_Visiteur">
			<%
				List<ArticleDTO> list = (List<ArticleDTO>) request
						.getAttribute("list");
				if (list != null) {

					for (ArticleDTO a : list) {
						List<CommentaireDTO> com = (List<CommentaireDTO>) CommentaireDAO
								.getInstance().getListeCommentaire(a.getId());
						if (com.size() != 0) {
			%>

			<h2>
				<%=a.getTitre()%></h2>
			<br />
			<%
				for (int i = 0; i < com.size(); i++) {
			%>
			peudo:
			<%=com.get(i).getPseudo()%><br /> date:
			<%=com.get(i).getDate()%><br /> Commentaire:
			<%=com.get(i).getContenu()%><br />
			<h2 id="supp">
				<a
					href="Controleur.jsp?action=deleteCom&idcomment=<%=com.get(i).getId()%>">Supprimer
					le commentaire</a>
			</h2>
			<hr />
			<%
				}
			%><hr/>

			<%
				}
					}
			%>

			<%
				} else {
			%>
			la liste est null
			<%
				}
			%>
			<br /> <br />

		</article>
	</section>

	<footer> </footer>
</body>
</html>