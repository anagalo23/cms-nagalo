<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao.*,dto.*,java.util.*"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="Cms.css" />
<link rel="icon" type="image/png" href="logo.PNG" />
<title>Configuration</title>
</head>
<body>
	<section>
		<a href="Controleur.jsp?action=home"><img id="logo" height="10%"
			width="140px" src="logo.PNG"></a>

		<h1>Configuration</h1>
		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
			</div>

		</aside>
		<%
			RedacteurDTO redDTO = (RedacteurDTO) request.getAttribute("redDTO");
			RedacteurDTO red = (RedacteurDTO) session.getAttribute("redacteur");
			if (red.getProfil().startsWith("a")) { // verifier que l'option commence par 'a' c est a dire qu'il s'agit d'un administrateur
			if (redDTO != null) {
		%>

		<form id="form" method="get" action="Controleur.jsp">
			<input type="hidden" name="action" value="mRedacteur"> <input
				type="hidden" name="idRedactModif" value="<%=redDTO.getId()%>">
			<h2>Modifier ce redacteur</h2>
			<table cellspacing="15px" align="center">
				<tr>
					<td>nom :</td>
					<td><input name="nomModif" type="text"
						placeholder="saisir le nom" value="<%=redDTO.getNom()%>"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>
				<tr>
					<td>prenom :</td>
					<td><input name="prenomModif" type="text"
						value="<%=redDTO.getPrenom()%>"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>

				<tr>
					<td>Mail :</td>
					<td><input name="mailModif" type="email"
						value="<%=redDTO.getMail()%>"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>

				<tr>
					<td>Mot de Passe :</td>
					<td><input name="passwordModif" type="password"
						value="<%=redDTO.getMotPasse()%>"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>
				<tr>
					<td>Profil :</td>
					<td><select name="addProfil"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;">

							<option value="admin">Administrateur</option>
							<option value="redacteur" SELECTED>Redacteur</option>

					</select></td>

				</tr>

				<tr>
				<tr>
					<td><input type="reset" name="effacement" value="effacer" id="boutonAdmin" /></td>
					<td align="center"><input id="boutonAdmin" type="submit" value="enregistrer"></td>
				</tr>
			</table>

		</form>
		<%
			}
		%>
		<%
			List<RedacteurDTO> redact = (List<RedacteurDTO>) RedacteurDAO
					.getInstance().getListRedacteur();
		%>

		<form id="form" action="Controleur.jsp" method="get">
			<h2>Liste des redacteurs</h2>
			(clique sur le mail pour modifier le redacteur) <input type="hidden"
				name="action" value="supSelect">

			<table cellpadding="2%" align="center" border="1">
				<tr>
					<th>Identifiant</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Mail</th>
					<th>Profil</th>
					<th>Nbre d'articles publiés</th>
				</tr>
				<%
					if (redact != null) {
						for (RedacteurDTO r : redact) {
				%>

				<tr>
					<td align="center"><%=r.getId()%></td>
					<td><%=r.getNom().toUpperCase()%></td>
					<td><%=r.getPrenom()%></td>
					<td><a
						href="Controleur.jsp?action=modifierRedacteur&idMRedacteur=<%=r.getId()%>"
						onclick="return(confirm('Etes-vous sûr de vouloir modifier ce redacteur?'));"><%=r.getMail()%></a></td>
					<td> <%=r.getProfil() %></td>
					<td align="center"><%=ArticleDAO.getInstance().CompteArticle(r.getId())
							.size()%></td>
				</tr>



				<%
					}
					}
				%>


			</table>
			<hr />
			<h2>Supprimer un redacteur</h2>
			<table align=center>
				<tr>
					<td align=center><select name="idRedacteur">
							<%
								for (RedacteurDTO redac : redact) {
							%>

							<option value="<%=redac.getId()%>"><%=redac.getNom().toUpperCase()%>
								<%=redac.getPrenom()%></option>

							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" value="Supprimer le redacteur" id="boutonAdmin"
						onclick="return(confirm('Etes-vous sûr de vouloir supprimer ce redacteur?'));"></td>
				</tr>
			</table>
		</form>


		<form id="form" method="get" action="Controleur.jsp">
			<input type="hidden" name="action" value="ajoutRedacteur">
			<h2>Ajouter un redacteur</h2>
			<table id="tabConnect" align="center" cellpadding="2%" border="0">
				<tr>
					<td>nom :</td>
					<td><input name="nom" type="text" placeholder="saisir le nom"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>
				<tr>
					<td>prenom :</td>
					<td><input name="prenom" type="text"
						placeholder="saisir le prenom"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>

				<tr>
					<td>Mail :</td>
					<td><input name="mail" type="email" placeholder="a@a.fr"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>

				<tr>
					<td>Mot de Passe :</td>
					<td><input name="password" placeholder="password"
						type="password"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>
				<tr>
					<td>Profil :</td>
					<td><select name="addProfil"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;">

							<option value="admin">Administrateur</option>
							<option value="redacteur" SELECTED>Redacteur</option>

					</select></td>

				</tr>

				<tr>
					<td><input type="reset" name="effacement" value="effacer" id="boutonAdmin"/></td>
					<td align="center"><input type="submit" value="enregistrer"
						onclick="return(confirm('Etes-vous sûr de vouloir enregistrer?'));" id="boutonAdmin"></td>
				</tr>
			</table>

		</form>
		<%}else{ %> vous n'avez pas le droit d'accès à cette page<%}%> <!-- pour les redacteur simple -->

	</section>
</body>
</html>