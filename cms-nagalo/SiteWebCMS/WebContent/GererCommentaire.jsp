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
		<a href="Controleur.jsp?action=home"><img id="logo" height="10%"
			width="140px" src="logo.PNG"></a>
		<h1>Gestion les commentaires</h1>

		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
			</div>
		</aside>
		<aside id="menuAside">
			<table id="menuTab">
				<tr>
					<td><a href="Controleur.jsp?action=Affichage_article"  target="_blank">Tous
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
					<td><a href="Controleur.jsp?action=deconnecter"
						onclick="return(confirm('Etes-vous sûr de vouloir vous déconnecter?'));">Déconnecter</a></td>
				</tr>

			</table>
		</aside>

		<article id="Contenu_Visiteur">
			<%
			RedacteurDTO red = (RedacteurDTO) session.getAttribute("redacteur");
			
			if (red.getProfil().startsWith("a")) {
				List<ArticleDTO> list = (List<ArticleDTO>) request
						.getAttribute("list");
				if (list != null) {
			%>
			<table border=1 align=center cellspacing="10px">
				<tr>
					<th>Article</th>
					<th>Pseudo</th>
					<th>Contenu</th>
					<th>Date de publication</th>
					<th>action</th>
				</tr>
				<%
					for (ArticleDTO a : list) {
							List<CommentaireDTO> com = (List<CommentaireDTO>) CommentaireDAO
									.getInstance().getListeCommentaire(a.getId());
							if (com.size() != 0) {
				%>

				<tr>
					<td rowspan="<%=com.size()%>"><h3>
							<%=a.getTitre()%>
							(<%=com.size()%>)
						</h3></td>


					<%
						for (int i = 0; i < com.size(); i++) {
					%>
					<td><%=com.get(i).getPseudo()%></td>
					<td><%=com.get(i).getContenu()%></td>
					<td><%=com.get(i).getDate()%></td>

					<td><a
						href="Controleur.jsp?action=deleteCom&idcomment=<%=com.get(i).getId()%>"
						onclick="return(confirm('Etes-vous sûr de vouloir supprimer ce commentaire?'));">Supprimer
							ce commentaire</a></td>
				</tr>
				<%
					}
				%>


				<%
					}
						}
				%>
			</table>
			<%
				} else {
			%>
			la liste est null
			<%
				}
			%>
			<br /> <br /><br/>
			<%}else{%> Vous n'avez pas le droit d'accès a cette page<%}
			%>

		</article>
	</section>

	<footer> </footer>
</body>
</html>