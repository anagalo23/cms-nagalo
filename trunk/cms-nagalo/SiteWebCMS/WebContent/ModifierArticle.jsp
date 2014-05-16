<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" import="dao.*,dto.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
	
<!-- 	fonction pour le chargement de l'editeur
		l'utilisation de l'editeur NicEditor
 -->
<script type="text/javascript"
	src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
	//         
	bkLib.onDomLoaded(function() {
		new nicEditor().panelInstance('textareaEdit');
		new nicEditor({
			fullPanel : true
		})

		new nicEditor({
			buttonList : [ 'fontSize', 'bold', 'italic', 'underline',
					'strikeThrough', 'subscript', 'superscript', 'html' ]
		})
	});
	//
</script>
<title>modification d'un article</title>
</head>
<body>
	<%
		ArticleDTO art = (ArticleDTO) request.getAttribute("modifArti");
	RedacteurDTO red = (RedacteurDTO) session
			.getAttribute("redacteur");
	%>


	<section> <a href="Controleur.jsp?action=home"><img
		id="logo" height="10%" width="140px" src="logo.PNG"></a>
	<h1>Modifier un article</h1>

	<aside id="retourAside">
	<div id="home">
		<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
	</div>
	</aside> <aside id="menuAside">
	<table id="menuTab">
		<tr>
			<td><a href="Controleur.jsp?action=Affichage_article"   target="_blank">Tous
					les articles</a>
				<hr /></td>
		</tr>
		<tr>
			<td><a href="Controleur.jsp?action=GererCommentaire">Commentaire</a>
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
	<%
		if (art != null) {
	%> </aside> <article>
	<h2>Modifier un article</h2>
	<form method="post" action="Controleur.jsp">
		<input type="hidden" name="action" value="modifArticle"> <input
			type="hidden" name="idmodif" value=<%=art.getId()%>> <input
			id="saisi" type="search" name="titreModif"
			value="<%=art.getTitre()%>" placeholder="Saisir le nouveau titre"
			required> <br /> <br />


		<textarea id="textareaEdit" rows="6" cols="100" name="contenuModif"
			placeholder="Contenu de l'article"><%=art.getContenu_art()%></textarea>

		<%
			List<RedacteurDTO> listRedact = (List<RedacteurDTO>) RedacteurDAO
						.getInstance().getListRedacteur();
				
		%>

		<table align="center" width=100% border=0>
			<tr>
				<td align="center" colspan="2"><select width=35%
					name="idRedacteurModif">
						<%
							if (red.getProfil().startsWith("a")) { // verifier que l'option commence par 'a' c est a dire qu'il 
									for (RedacteurDTO rd : listRedact) { // s'agit d un administrateur
						%>
						<option value=<%=rd.getId()%>
							<%if (rd.getId() == art.getIdRedacteur()) {%> SELECTED <%}%>><%=rd.getNom().toUpperCase()%>
							<%=rd.getPrenom()%></option>
						<%
							}
								} else {
						RedacteurDTO redacteur= RedacteurDAO.getInstance().unRedacteur(art.getIdRedacteur());
						
						%>
						<option value=<%=redacteur.getId()%>><%=redacteur.getNom().toUpperCase()%>
							<%=redacteur.getPrenom()%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td align="center"><input type="reset" name="effacement"
					id="boutonModif" value="effacer"></td>
				<td align="center"><input id="boutonModif"type="submit" value="Enregistrer les modifications"
					onclick="return(confirm('Voulez-vous enregistrer les modifications?'));"></td>
			</tr>
		</table>
	</form>
	<br/><br/><br/>
	</article> <%}%>
	 </section>
	 
	 
	<footer> </footer>
</body>
</html>