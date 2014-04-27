<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<script type="text/javascript" src="jquery.jeditable.js"> </script>
<title>Creer un article</title>
</head>
<body>
	<section> <img id="logo" src="logo.PNG">
	<h1>Creer un article</h1>

	<aside id="retourAside">
	<div id="home">
		<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
	</div>
	<!-- <div id="precedent">
		<a href="Controleur.jsp?action=precedent"><img src="precedent.PNG"></a>
	</div> --> </aside> <aside id="menuAside">
	<table id="menuTab">
		<tr>
			<td><a href="Controleur.jsp?action=Affichage_article">Tous
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
			<td><a href="Controleur.jsp?action=deconnecter">Déconnecter</a></td>
		</tr>

	</table>
	
	</aside> <article>
	<h2>Ecrire un nouvel article</h2>
	<form method="get" action="Controleur.jsp">
		<input type="hidden" name="action" value="CreerArticle"> <input
			id="saisi" type="search" name="titre"
			placeholder="saisir le titre de l'article" required>

		<textarea id="text" rows="6" cols="100" name="contenu"
			placeholder="Contenu de l'article" required></textarea>

		<table align="center" width=100% border=0>
			<tr>
				<td align="center"><input type="reset" name="effacement"
					value="effacer"
					style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;" /></td>
				<td align="center"><input type="submit"
					value="Publier cet article"
					style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;"></td>
			</tr>
		</table>
	</form>

	</article> </section>
	<footer> </footer>
</body>
</html>