<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Cms.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="logo.PNG" />
<title>Connexion</title>
</head>
<body>

	<header id="logo_rapid"> <a
		href="Controleur.jsp?action=accueil"><img src="logo.PNG"></a> </header>


	<form id="formConnexion"  method="get" action="Controleur.jsp">
		<input type="hidden" name="action" value="connect">
		<table id="tabConnect" align=center cellpadding="5%" border="0">

			<tr>
				<td><label for="identifiant">Mail :</label></td>
				<td><input name="mail" type=email id="identifiant"
					placeholder="a@a.fr"></td>
			</tr>

			<tr>
				<td><label for="password">Mot de Passe :</label></td>
				<td><input name="password" type="password" id="password"
					placeholder="password"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Se connecter"
					style="cursor: pointer; padding: 5px 20px; background-color: Coral; border: dotted 2px grey; border-radius: 5px;"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>

