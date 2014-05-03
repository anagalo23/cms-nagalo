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
			<a href="Controleur.jsp?action=accueil"><img id="logo"
				src="logo.PNG"></a>GONA
		</div>
		<aside id="retourAside">
		<div id="home">
			<a href="Controleur.jsp?action=accueil"><img src="home.PNG"></a>
		</div>
		</aside>

		<article id="indexArticle">
			Resultat de la recherche:<br />
			<p id="p">
				<%
					String rs = (String) request.getAttribute("resultat");
					ArticleDTO art = ArticleDAO.getInstance().rechercheArticle(rs);
					if (rs != null) {
						if (art != null) {
				%>

				<a href="Controleur.jsp?action=articles&ida=<%=art.getId()%>"><%=rs%></a>
				<br /> <br />
				<%
					} else {
				%>
				Article non trouvé<%
					}
					}
				%>
			</p>
		</article>
	</section>

</body>
</html>