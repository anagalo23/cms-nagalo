<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8" import="dao.*,dto.*,java.util.*"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html >
<html>
<%
	ArticleDTO m = (ArticleDTO) request.getAttribute("art");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<title><%=m.getTitre()%></title>
</head>


<body">
	<section>
		<a href="Controleur.jsp?action=accueil"><img id="logo" src="logo.PNG"></a>
		<h1><%=StringEscapeUtils.escapeHtml(m.getTitre().toUpperCase())%></h1>
		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=accueil"><img src="home.PNG"></a>
			</div>

		</aside>
		<article id="indexArticle">
			<%
				if (m == null) {
			%>pas de message correspondant<%
				} else {
					List<CommentaireDTO> com = (List<CommentaireDTO>) CommentaireDAO
							.getInstance().getListeCommentaire(m.getId());
			%>
			<%--affichage du message --%>
			date de publication:<br />
			<%=m.getDate().substring(0, 10)%><br />
			<%=m.getDate().substring(11, 19)%>
			<br /> Contenu de l'article:<br />
			<div id="p"><%=m.getContenu_art()%><br /> <br /> <br />
				<%=RedacteurDAO.getInstance()
						.unRedacteur(m.getIdRedacteur()).getNom().toUpperCase()%>
				<%=RedacteurDAO.getInstance()
						.unRedacteur(m.getIdRedacteur()).getPrenom()%><br />
				<%=RedacteurDAO.getInstance()
						.unRedacteur(m.getIdRedacteur()).getMail()%><br />
			</div>
			<hr />
			<br /> <br /> Les commentaires: <br />
			<%
				if (com.size() == 0) {
			%>
			pas de commentaire. Commenter plus bas<%
				} else {
			%>
			<%
				for (CommentaireDTO c : com) {
			%>


			<div id="p">

				pseudo: <i><%=StringEscapeUtils.escapeHtml(c.getPseudo())%></i><br />
				Date du commentaire:<br /><%=c.getDate().substring(0, 10)%><br />
				<%=c.getDate().substring(11, 19)%><br />Contenu du commentaire:<b>
					<%=StringEscapeUtils.escapeHtml(c.getContenu())%></b> <br /><hr/>

			</div>


			<%
				}
					}
			%>
			<hr />

			<form id="form" method="post" action="Controleur.jsp">
				<input type="hidden" name="action" value="posterCom"> <input
					type="hidden" name="idAr" value="<%=m.getId()%>"">
				<table id="tabConnect" cellpadding="5%">
					<tr>
						<td>pseudo</td>
						<td><input type="search" name="pseudo" placeholder="pseudo"
							required></td>
					</tr>
					<tr>
						<td>commentaire</td>
						<td><textarea name="comm" rows="8" cols="58"
								placeholder="ecrire le commentaire ici" required></textarea></td>
					</tr>
					<tr>
						<td align="center"><input type="reset" name="effacement" value="effacer"
							style="cursor: pointer; padding: 5px 20px; background-color: Coral; border: dotted 2px grey; border-radius: 5px;" /></td>
						<td align="right"><input type="submit"
							value="poster le commentaire"
							style="cursor: pointer; padding: 5px 20px; background-color: Coral; border: dotted 2px grey; border-radius: 5px;"></td>
					</tr>
				</table>

			</form>
			<%
				}
			%>
		</article>
	</section>

</body>
</html>