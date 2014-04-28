<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page import="java.util.List" %>
<%@ page language="java" import="dao.*,dto.*"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<title>Affichage des articles</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
 <!-- jquery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<!-- jqueryui -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />

<script>
	$(function(){
		  $( "#autocomplete" ).autocomplete({
		        source: "autocomplete",
		        minLength: 1
		    });
	})
</script>

</head>
<body>

	<section>
		<div id="div2">
			<img id="logo" height="10%" width="140px" src="logo.PNG">GONA
		</div>
		<div id="admin">
		<a href="Controleur.jsp?action=administrateur">
			administrateur</a>
		</div>
		<form id="recherch" method="post" action="Controleur.jsp">
			<input type="hidden" name="action" value="recherche"> 
			<input width="250px" height="25px" type="search" name="recherch"
				placeholder="recherche...."  id="autocomplete"/> 
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
				article n°<%= indice++ %> <!-- affichage de l'indice de l'article -->
				: <a id="articleHref"
					href="Controleur.jsp?action=articles&ida=<%=a.getId()%>"><%=StringEscapeUtils.escapeHtml(a.getTitre())%></a><br />
				<% int reaction =CommentaireDAO.getInstance().getListeCommentaire(a.getId()).size(); 
				if(reaction<=1){%><u><%=reaction %> réaction</u>
				<%}	else {%><u><%=reaction %> réactions</u>
				<%} %><br />
				<%if(a.getContenu_art().length()>120){ %>
				<%= a.getContenu_art().substring(0, 120)%>....<br />
				<%} 
				else if(a.getContenu_art().length()<120){%>
				<%=a.getContenu_art()%>
				<%} %><br />
			</p>
			<%}}%>

		</article>
		
	</section>

	<footer> </footer>
</body>
</html>
