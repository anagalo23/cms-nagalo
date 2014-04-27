<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java"  import="dao.*,dto.*,java.util.*"%>
    <%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<title>Accueil</title>
</head>
<body>
	<section>
	<aside id="retourAside">
	<div id="home"> <a href="Controleur.jsp?action=accueil"><img src="home.PNG"></a></div>
 	<div id="precedent"> <a href="Controleur.jsp?action=precedent"><img src="precedent.PNG"></a></div>
 	</aside>
			<article id="Contenu_Visiteur">
			<%List<ArticleDTO> liste = ArticleDAO.getInstance()
					.getListeArticle();
				int nombreTotal = liste.size();
				int p = (nombreTotal / 5)+1;
			%>
			
			<br /> page:
			<%
				for (int i = 1; i<=p; i++) {
			%>
			<a href="Controleur.jsp?action=page&idp=<%=i%>"> <%=i%></a>
			<%}	
			
			int taille = liste.size();
			int k=0;
			if(liste!=null || liste.size()!=k){
			if(p==1 || (int)request.getAttribute("p")==1){
				for(int b=0; b<5;b++){%>
				<p id="p">
					<a href="Controleur.jsp?action=articles&id=<%=liste.get(b).getId()%>"><%=liste.get(b).getTitre()%></a><br />
					<%= liste.get(b).getDate()%><br />
					<%=StringEscapeUtils.escapeHtml(liste.get(b).getContenu_art())%><br /> <a
						href="Controleur.jsp?action=commenterArticle&idc=<%=liste.get(b).getId()%>">
						commenter</a> <br/>
				</p>
					
			<%}}else{
			for(int j=k; j<k+5;j++){
				%>
			<p id="p">
				<a href="Controleur.jsp?action=articles&id="<%=liste.get(j).getId()%>><%=liste.get(j).getTitre()%></a><br />
				<%= liste.get(j).getDate()%><br />
				<%=StringEscapeUtils.escapeHtml(liste.get(j).getContenu_art())%><br /> <a
					href="Controleur.jsp?action=commenterArticle&idc=<%=liste.get(j).getId()%>">
					commenter</a> <br/>
			</p>
			<%}
			k+=5;
			}}else {%> page non trouvée
			<%}%>
				</article>

	</section>
</body>
</html> --%>