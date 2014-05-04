<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="dao.*,dto.*,java.util.*"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<title>Gestion des articles</title>
<link rel="icon" type="image/png" href="logo.PNG" />

</head>
<body>
	<section>
		<a href="Controleur.jsp?action=home"><img id="logo" height="10%"
			width="140px" src="logo.PNG"></a>

		<h1>Gestion des articles</h1>
		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
			</div>
			<!-- <div id="precedent"> <a href="Controleur.jsp?action=precedent"><img src=></a></div> -->
		</aside>
		<aside id="menuAside">
			<table id="menuTab">
				<tr>
					<td><a href="Controleur.jsp?action=Affichage_article">Tous
							les article</a>
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
					<td><a href="Controleur.jsp?action=deconnecter" onclick="return(confirm('Etes-vous sûr de vouloir vous déconnecter?'));">Déconnecter</a></td>
				</tr>
			</table>
		</aside>

		<article id="Contenu_Visiteur">

			<%
				List<ArticleDTO> liste = (List<ArticleDTO>) request
						.getAttribute("list");
				if (liste != null) {
					for (ArticleDTO a : liste) {
			%>
			<p id="pa">
			<h3 align="center"><%=a.getTitre()%></h3>
			<br />
			<%=a.getDate()%><br />
			<div id="p"><%=StringEscapeUtils.escapeHtml(a.getContenu_art())%></div>
			<br />

			<%
				int reaction = CommentaireDAO.getInstance()
								.getListeCommentaire(a.getId()).size();
						if (reaction <= 1) {
			%><u><%=reaction%> réaction</u>
			<%
				} else {
			%><u><%=reaction%> réactions</u>
			<%
				}
			%><br />
			<table align=center width=30%>
				<tr>
					<td align=left><div id="supp">
							<a href="Controleur.jsp?action=modifier&idm=<%=a.getId()%>"  onclick="return(confirm('Etes-vous sûr de vouloir modifier cet article?'));">
								modifier l'article</a>
						</div></td>
					<td align=right>
						<div id="supp">
							<a href="Controleur.jsp?action=supprimer&idc=<%=a.getId()%>" onclick="return(confirm('Etes-vous sûr de vouloir supprimer cet article?'));">
								Supprimer l'article</a>
						</div>
					</td>
				</tr>
			</table>
			<hr />
			<br />

			<%
				}
			%>


			</p>
			<%
				} else{
			%>
			page non trouvée <%} %>

			<br/><br/>
		</article>
	</section>

	<footer> </footer>
</body>
</html>