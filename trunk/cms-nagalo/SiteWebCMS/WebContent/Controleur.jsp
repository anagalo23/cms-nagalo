<%@ page
	import="dao.*,dto.*,java.util.*,javax.servlet.http.HttpSession;"%>
<%
	String action = request.getParameter("action");
	int article = 0;
	//SomeClass value = (SomeClass)session.getAttribute("someID");
	//System.out.println(session);
	String pageSuivante = "erreur.jsp";
	try {

		//page de connection
		if ("connect".equals(action)) {
			String login = request.getParameter("mail");
			String password = request.getParameter("password");
			int id = RedacteurDAO.getInstance()
					.getRedacteur(login, password).getId();
			String nom = RedacteurDAO.getInstance()
					.getRedacteur(login, password).getNom();
			String prenom = RedacteurDAO.getInstance()
					.getRedacteur(login, password).getPrenom();

			if (id != 0) {
				session.setAttribute("id", id);
				session.setAttribute("nom", nom);
				session.setAttribute("prenom", prenom);
				session.setAttribute("mail", login);
				if (session.getAttribute("id") != null) {
					pageSuivante = "TableauBord.jsp";
				} else
					pageSuivante = "Connexion.jsp";

			}

		}

		//affichage de la liste des articles
		else if ("Affichage_article".equals(action)) {
			pageSuivante = "index.jsp";

		}

		//ajout d'un article
		else if ("AjoutArticle".equals(action)) {
			if (session.getAttribute("id") != null) {
				pageSuivante = "CreerArticle.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		//gerer les articles
		else if ("GererArticle".equals(action)) {
			List<ArticleDTO> list = ArticleDAO.getInstance()
					.getListeArticle();
			request.setAttribute("list", list);
			if (session.getAttribute("id") != null) {
				pageSuivante = "GererArticle.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		// gerer les commentaires
		else if ("GererCommentaire".equals(action)) {

			List<ArticleDTO> list = ArticleDAO.getInstance()
					.getListeArticle();
			request.setAttribute("list", list);
			if (session.getAttribute("id") != null) {
				pageSuivante = "GererCommentaire.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		//creer un article
		else if ("CreerArticle".equals(action)) {
			String titre = request.getParameter("titre");
			String contenu = request.getParameter("contenu");
			int idRedacteur=(Integer)session.getAttribute("id");
			ArticleDTO a = new ArticleDTO(0, titre, contenu,
					"2014.2.12", idRedacteur);
			int ajout = ArticleDAO.getInstance().ajouterArticle(a);
			if (ajout != 0) {

				pageSuivante = "TableauBord.jsp";
			}

		}

		// deconnexion
		else if ("deconnecter".equals(action)) {
			if (session != null) {
				session.removeAttribute("id");
				session.removeAttribute("nom");
				session.removeAttribute("prenom");
				session.removeAttribute("mail");
				pageSuivante = "Connexion.jsp";
			}
		}

		// afficher un article
		else if ("articles".equals(action)) {
			int ida = Integer.parseInt(request.getParameter("ida"));
			ArticleDTO arti = ArticleDAO.getInstance()
					.getUnArticle(ida);
			if (arti != null) {
				request.setAttribute("art", arti);
				pageSuivante = "UnArticle.jsp";
			} else {
				pageSuivante = "index.jsp";
			}

		}

		// gestion des pages
		else if ("page".equals(action)) {
			int ida = Integer.parseInt(request.getParameter("id"));
			if (ida != 0) {
				pageSuivante = "page.jsp";
			} else
				pageSuivante = "Accueil.jsp";

		}
		//Spprimer un article 
		else if ("supprimer".equals(action)) {
			int idc = Integer.parseInt(request.getParameter("idc"));
			ArticleDTO arti = ArticleDAO.getInstance()
					.getUnArticle(idc);
			if (arti != null) {
				int delete = ArticleDAO.getInstance().deleteArticle(
						arti.getId());
				if (delete != 0) {
					request.setAttribute("delete", arti);
					List<ArticleDTO> list = ArticleDAO.getInstance()
							.getListeArticle();
					request.setAttribute("list", list);
					pageSuivante = "GererArticle.jsp";
				} else {
					List<ArticleDTO> list = ArticleDAO.getInstance()
							.getListeArticle();
					request.setAttribute("list", list);
					pageSuivante = "GererArticle.jsp";
				}
			}

		}
		//redirection sur la page du tableau de bord
		else if ("home".equals(action)) {
			if (session.getAttribute("id") != null) {
				pageSuivante = "TableauBord.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}
		//commenter un article
		else if ("commenterArticle".equals(action)) {
			int idca = Integer.parseInt(request.getParameter("idc"));
			if (idca != 0) {
				pageSuivante = "index.jsp";
				request.setAttribute("comArt", idca);
			}
		}

		// bouton administrateur. redirection vers la page de connexion
		else if (action.equals("administrateur")) {
			pageSuivante = "Connexion.jsp";
		}
		//Commenter un article 
		else if ("posterCom".equals(action)) {
			String pseudo = request.getParameter("pseudo");
			String comm = request.getParameter("comm");
			int idAr = Integer.parseInt(request.getParameter("idAr"));

			if (idAr != 0) {

				CommentaireDTO c = new CommentaireDTO(1, pseudo, comm,
						"12.12.12", idAr);
				int ajout = CommentaireDAO.getInstance()
						.ajouterCommentaire(c, idAr);
				if (ajout != 0) {
					List<ArticleDTO> liste = ArticleDAO.getInstance()
							.getListeArticle();
					request.setAttribute("liste", liste);
					pageSuivante = "index.jsp";
				}

			} else {
				pageSuivante = "erreur.jsp";
			}

		}
		//retour a la page accueil des articles
		else if ("accueil".equals(action)) {
			List<ArticleDTO> liste = ArticleDAO.getInstance()
					.getListeArticle();
			request.setAttribute("liste", liste);
			pageSuivante = "index.jsp";
		}

		// redirection vers la page de configuration du site
		else if ("configuration".equals(action)) {
			if (session.getAttribute("id") != null) {
				pageSuivante = "Configuration.jsp";

			} else
				pageSuivante = "Connexion.jsp";

		}
		//ajout d'un redacteur. page de configuration
		else if ("ajoutRedacteur".equals(action)) {
			if (session.getAttribute("id") != null) {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String mail = request.getParameter("mail");
				String mp = request.getParameter("password");
				RedacteurDTO rd = new RedacteurDTO(0, nom, prenom,
						mail, mp, "12.12.12");

				int ajoutR = RedacteurDAO.getInstance()
						.ajouterRedacteur(rd);
				if (ajoutR != 0) {
					pageSuivante = "Configuration.jsp";
				} else
					pageSuivante = "erreur.jsp";

			} else
				pageSuivante = "Connexion.jsp";

		}
		//paramétrage du site
		else if ("paraPage".equals(action)) {
			if (session.getAttribute("id") != null) {
				String couleur = request.getParameter("couleurs");
				if (couleur != null) {
					request.setAttribute("couleur", couleur);
					pageSuivante = "Configuration.jsp";
				} else
					pageSuivante = "erreur.jsp";
			} else {
				pageSuivante = "Connexion.jsp";
			}
		}
		//supprimer un redacteur
		else if ("supRedacteur".equals(action)) {
			if (session.getAttribute("id") != null) {
				int idRed = Integer.parseInt(request
						.getParameter("idRed"));
				if (idRed != 0) {
					int check = Integer.parseInt(request
							.getParameter("check"));
					if (check != 0) {

						int redSup = RedacteurDAO.getInstance()
								.deleteRedacteur(idRed);
						pageSuivante = "Configuration.jsp";
					}
				}
			} else {
				pageSuivante = "Connexion.jsp";
			}

		} 
		//rechercher un article
		else if ("recherche".equals(action)) {
			String resultat = request.getParameter("recherch");
			if (resultat != null) {
				List<ArticleDTO> listRech = (List<ArticleDTO>) ArticleDAO
						.getInstance().rechercheArticle(resultat);
				request.setAttribute("resultat", resultat);
				request.setAttribute("rRe", listRech);
				pageSuivante = "Recherche.jsp";
			} else {
				pageSuivante = "index.jsp";
			}
		} 
		// supprimer un commentaire
		else if ("deleteCom".equals(action)) {
			if (session.getAttribute("id") != null) {
				int idCom = Integer.parseInt(request
						.getParameter("idcomment"));
				List<ArticleDTO> list = ArticleDAO.getInstance()
						.getListeArticle();
				request.setAttribute("list", list);
				if (idCom != 0) {
					int del = CommentaireDAO.getInstance()
							.deleteCommentaire(idCom);
					if (del != 0) {

						pageSuivante = "GererCommentaire.jsp";
					} else {
						pageSuivante = "GereCommentaire.jsp";
					}

				} else {
					pageSuivante = "Connexion.jsp";
				}
			}
		} 
		//Supprimer un redacteur
		else if ("supSelect".equals(action)) {
			if (session.getAttribute("id") != null) {
				int idRedact = Integer.parseInt(request
						.getParameter("idRedacteur"));
				if (idRedact != 0) {
					int delRedact = RedacteurDAO.getInstance()
							.deleteRedacteur(idRedact);
					if (delRedact != 0) {
						pageSuivante = "Configuration.jsp";
					} else {
						pageSuivante = "Configuration.jsp";
					}
				} else {
					pageSuivante = "Configuration.jsp";
				}
			} else {
				pageSuivante = "Connexion.jsp";
			}
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<jsp:forward page="<%=pageSuivante%>" />
