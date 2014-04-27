<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java"  import="dao.*,dto.*,java.util.*"%>
    <%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<title>Gestion des articles</title>
<link rel="icon" type="image/png" href="logo.PNG" />
</head>
<body >
<section>

					<img id="logo" src="logo.PNG">
			
				<h1>Gestion des articles</h1>
	<aside id="retourAside">
	<div id="home"> <a href="Controleur.jsp?action=home"><img src="home.PNG"></a></div>
 	<!-- <div id="precedent"> <a href="Controleur.jsp?action=precedent"><img src=></a></div> -->
 	</aside>
	<aside id="menuAside">
					<table id="menuTab">
						<tr><td><a href="Controleur.jsp?action=Affichage_article">Tous les article</a> <hr/></td></tr>
						<tr><td><a href="Controleur.jsp?action=GererCommentaire">Commentaires</a> <hr/></td></tr>
						<tr><td><a href="Controleur.jsp?action=configuration">Configuration</a> <hr/></td></tr>
						<tr> <td><a href="Controleur.jsp?action=deconnecter" >Déconnecter</a></td></tr>
					</table>
			</aside>
			
			<article  id="Contenu_Visiteur">
		
			<%List<ArticleDTO> liste = (List<ArticleDTO>)request.getAttribute("list");
			if(liste!=null){
			for (ArticleDTO a : liste) {
				%>
			<p id="pa">
				<%=a.getTitre()%><br />
				<%= a.getDate()%><br />
				<%=StringEscapeUtils.escapeHtml(a.getContenu_art())%><br /> 
				
				<% int reaction =CommentaireDAO.getInstance().getListeCommentaire(a.getId()).size(); 
				if(reaction<=1){%><u><%=reaction %> réaction</u>
				<%}	else {%><u><%=reaction %> réactions</u>
				<%} %><br />
				<table align=center width=30%>
				<tr><td align=left><div id="supp"><a href="Controleur.jsp?action=modifier&idc=<%=a.getId()%>">
					modifier l'article</a></div></td>
				<td align=right> <div id="supp"><a href="Controleur.jsp?action=supprimer&idc=<%=a.getId()%>">
					Supprimer l'article</a> </div> </td></tr>
					</table><hr/><br/>
				
			<%}%>
			
			
			</p><%}else %> page non trouvée
					
					
			</article>
		</section>
		
		<footer>
		</footer>
</body>
</html>