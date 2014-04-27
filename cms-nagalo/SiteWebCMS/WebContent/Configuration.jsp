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
		<img id="logo" height="10%" width="140px" src="logo.PNG">

		<h1>Configuration</h1>
		<aside id="retourAside">
			<div id="home">
				<a href="Controleur.jsp?action=home"><img src="home.PNG"></a>
			</div>

		</aside>


		<form id="form" method="get" action="Controleur.jsp">
			<input type="hidden" name="action" value="ajoutRedacteur">
			<h2>Ajout d'un redacteur</h2>
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
					<td><input name="password" placeholder="password" type="password"
						style="border: solid 1px black; border-radius: 5px; text-align: center; box-shadow: 0 0 6px;"
						required></td>
				</tr>

				<tr>
				<tr>
					<td><input type="reset" name="effacement" value="effacer"
						style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;" /></td>
					<td align="center"><input type="submit" value="enregistrer"
						style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;"></td>
				</tr>
			</table>

		</form>
		<%
			List<RedacteurDTO> redact = (List<RedacteurDTO>) RedacteurDAO
					.getInstance().getListRedacteur();
		%>

		<form id="form" action="Controleur.jsp" method="get">
			<h2>Liste des redacteurs</h2>
			<input type="hidden" name="action" value="supSelect">

			<table cellpadding="2%" align="center" border="1">
				<tr>
					<th>identifiant</th>
					<th>nom</th>
					<th>prénom</th>
					<th>mail</th>
					<th>Nbre d'articles publiés </th>
				</tr>
				<%
					if (redact != null) {
						for (RedacteurDTO r : redact) {
							
				%>

				<tr>
					<td><%=r.getId()%></td>
					<td><%=r.getNom().toUpperCase()%></td>
					<td><%=r.getPrenom()%></td>
					<td><%=r.getMail()%></td>
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
				<td><input type="submit" value="Modifier"
						style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;"></td>
					<td align=center><input type="submit" value="modifierRedacteur"
						style="cursor: pointer; padding: 5px 20px; background-color: lightsteelblue; border: dotted 2px grey; border-radius: 5px;"></td>
				</tr>
			</table>
		</form>

	</section>
</body>
</html>