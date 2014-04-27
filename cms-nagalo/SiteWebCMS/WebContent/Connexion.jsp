<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Cms.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="logo.PNG" />
<title>Connexion</title>
</head>
<body>

	<header id="logo_rapid"> <img src="logo.PNG"> </header>


	<form id="form" method="get" action="Controleur.jsp">
		<input type="hidden" name="action" value="connect">
		<table id="tabConnect" cellpadding="5%" border="0">

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

