<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="dao.*,dto.*,java.util.*"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<title>recherche de "<%=request.getAttribute("resultat")%>"
</title>
</head>
<body>
	<section>
		<div id="div2">
			<img id="logo" height="10%" width="140px" src="logo.PNG">GONA
		</div>

		<div id="home">
			<a href="Controleur.jsp?action=accueil"><img src="home.PNG"></a>
		</div>


		<article id="indexArticle">
			Resultat(s) de la recherche:<br />
			<p id="p">
			<%
				List<ArticleDTO> rs = (List<ArticleDTO>) request
						.getAttribute("rRe");
				if (rs.size() == 0) {
			%>
			
				élément non trouvé<%
				} else {
					for (int i = 0; i < rs.size(); i++) {
			%>
				Resultat:
				<%=i + 1%>
				: <a
					href="Controleur.jsp?action=articles&ida=<%=rs.get(i).getId()%>"><%=StringEscapeUtils
							.escapeHtml(rs.get(i).getTitre())%></a>
				<br />
				<br />
				<%
					}
					}
				%>
			</p>
		</article>
	</section>

</body>
</html>