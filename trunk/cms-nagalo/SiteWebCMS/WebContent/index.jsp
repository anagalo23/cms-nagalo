<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" import="dao.*,dto.*,java.util.*"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<title>Affichage des articles</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />


</head>
<body>

	<section>
		<div id="div2">
			<img id="logo" height="10%" width="140px" src="logo.PNG">GONA
		</div>

		<form id="recherch" method="post" action="Controleur.jsp">
			<input type="hidden" name="action" value="recherche"> 
			<input width="150px" height="25px" type="search" name="recherch"
				placeholder="recherche...." /> 
			<input width="35px" height="23px"
				type="submit" value="trouver" />

		</form>

		<article id="indexArticle">

			<h1>Les articles</h1>


			<%List<ArticleDTO> liste = ArticleDAO.getInstance().getListeArticle();
		
			int indice=1;
			if(liste!=null){ 
			for (ArticleDTO a :liste) { %>
			<p id="p">
				article n°<%=indice++ %> <!-- affichage de l'indice de l'article -->
				: <a id="articleHref"
					href="Controleur.jsp?action=articles&ida=<%=a.getId()%>"><%=StringEscapeUtils.escapeHtml(a.getTitre())%></a><br />
				<% int reaction =CommentaireDAO.getInstance().getListeCommentaire(a.getId()).size(); 
				if(reaction<=1){%><u><%=reaction %> réaction</u>
				<%}	else {%><u><%=reaction %> réactions</u>
				<%} %><br />
				<%if(a.getContenu_art().length()>120){ %>
				<%= StringEscapeUtils.escapeHtml(a.getContenu_art().substring(0, 120)) %>....<br />
				<%} 
				else if(a.getContenu_art().length()<120){%>
				<%=StringEscapeUtils.escapeHtml(a.getContenu_art())%>
				<%} %><br />
				<!-- <a  id='LienIframe' href='http://startyourdev.com'  >voir l'article rapidement</a> -->
			</p>
			<%}}%>

		</article>
		<a id="admin" href="Controleur.jsp?action=administrateur">
			administrateur</a>
	</section>

	<footer> </footer>
</body>
</html>