<%@ page import="dao.*,dto.*,java.util.*;"%>
<%
	String action = request.getParameter("action");
	int article = 0;
	String pageSuivante = "erreur.jsp";
	try {

		//page de connection
		if ("connect".equals(action)) {
			String login = request.getParameter("mail");
			String password = request.getParameter("password");

			RedacteurDTO redacteur = RedacteurDAO.getInstance()
					.getRedacteur(login, password);
			if (redacteur!=null) {
				session.setAttribute("redacteur", redacteur);
				pageSuivante = "TableauBord.jsp";
				} else {
					pageSuivante = "Connexion.jsp";
				}
		}

		//affichage de la liste des articles
		else if ("Affichage_article".equals(action)) {
			pageSuivante = "index.jsp";

		}

		//ajout d'un article
		else if ("AjoutArticle".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				pageSuivante = "CreerArticle.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		//gerer les articles
		else if ("GererArticle".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				List<ArticleDTO> list = ArticleDAO.getInstance()
						.getListeArticle();
				request.setAttribute("list", list);
				pageSuivante = "GererArticle.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		// gerer les commentaires
		else if ("GererCommentaire".equals(action)) {

			if (session.getAttribute("redacteur") != null) {
				List<ArticleDTO> list = ArticleDAO.getInstance()
						.getListeArticle();
				request.setAttribute("list", list);
				pageSuivante = "GererCommentaire.jsp";
			} else
				pageSuivante = "Connexion.jsp";

		}

		//creer un article
		else if ("CreerArticle".equals(action)) {
			RedacteurDTO redact=(RedacteurDTO)session.getAttribute("redacteur");
			if (redact!= null) {
				String titre = request.getParameter("titre");
				String contenu = request.getParameter("contenu");
				ArticleDTO a = new ArticleDTO(0, titre, contenu,
						"2014.2.12", redact.getId());
				int ajout = ArticleDAO.getInstance().ajouterArticle(a);
				if (ajout != 0) {

					pageSuivante = "TableauBord.jsp";
				}
			} else
				pageSuivante = "Connexion.jsp";

		}

		// deconnexion
		else if ("deconnecter".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				session.removeAttribute("redacteur");
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

		//Spprimer un article 
		else if ("supprimer".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				int idc = Integer.parseInt(request.getParameter("idc"));
				ArticleDTO arti = ArticleDAO.getInstance()
						.getUnArticle(idc);
				if (arti != null) {
					int delete = ArticleDAO.getInstance()
							.deleteArticle(arti.getId());
					if (delete != 0) {
						request.setAttribute("delete", arti);
						List<ArticleDTO> list = ArticleDAO
								.getInstance().getListeArticle();
						request.setAttribute("list", list);
						pageSuivante = "GererArticle.jsp";
					} else {
						List<ArticleDTO> list = ArticleDAO
								.getInstance().getListeArticle();
						request.setAttribute("list", list);
						pageSuivante = "GererArticle.jsp";
					}
				}
			} else
				pageSuivante = "Connexion.jsp";

			//chargement de la page de modification des articles
		} else if ("modifier".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				int idm = Integer.parseInt(request.getParameter("idm"));
				ArticleDTO artiModif = ArticleDAO.getInstance()
						.getUnArticle(idm);
				if (artiModif != null) {
					request.setAttribute("modifArti", artiModif);
					pageSuivante = "ModifierArticle.jsp";
				}
			} else
				pageSuivante = "Connexion.jsp";

		}
		//recuperation des parametres pour la modification d'un article
		else if ("modifArticle".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				int idModif = Integer.parseInt(request
						.getParameter("idmodif"));
				if (idModif != 0) {
					String titreM = request.getParameter("titreModif");
					String contenuM = request
							.getParameter("contenuModif");
					int idRedacteurM = Integer.parseInt(request
							.getParameter("idRedacteurModif"));
					ArticleDTO am = new ArticleDTO(0, titreM, contenuM,
							"2014.2.12", idRedacteurM);
					if (am != null) {
						int modif = ArticleDAO.getInstance()
								.updateArticle(am, idModif);
						if (modif != 0) {
							pageSuivante = "TableauBord.jsp";
						}
					}
				}

			} else
				pageSuivante = "Connexion.jsp";
		}
		//redirection sur la page du tableau de bord
		else if ("home".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
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
			RedacteurDTO red = (RedacteurDTO) session
					.getAttribute("redacteur");
			if (red != null) {
				if (red.getProfil().startsWith("a")) {
					pageSuivante = "Configuration.jsp";
				} else {pageSuivante="Configuration.jsp";}

			} else
				pageSuivante = "Connexion.jsp";

		}
		//ajout d'un redacteur. page de configuration
		else if ("ajoutRedacteur".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String mail = request.getParameter("mail");
				String mp = request.getParameter("password");
				String pf = request.getParameter("addProfil");
				RedacteurDTO rd = new RedacteurDTO(0, nom, prenom,
						mail, mp, "12.12.12", pf);

				int ajoutR = RedacteurDAO.getInstance()
						.ajouterRedacteur(rd);
				if (ajoutR != 0) {
					pageSuivante = "Configuration.jsp";
				} else
					pageSuivante = "erreur.jsp";

			} else
				pageSuivante = "Connexion.jsp";

		}

		//rechercher un article
		else if ("recherche".equals(action)) {
			String resultat = request.getParameter("recherch");
			if (resultat != null) {
				request.setAttribute("resultat", resultat);
				pageSuivante = "Recherche.jsp";
			} else {
				pageSuivante = "index.jsp";
			}
		}
		// supprimer un commentaire
		else if ("deleteCom".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
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
			if (session.getAttribute("redacteur") != null) {
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
		//modification d'un redacteur
		else if ("modifierRedacteur".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				int idred = Integer.parseInt(request
						.getParameter("idMRedacteur"));
				RedacteurDTO redDTO = RedacteurDAO.getInstance()
						.unRedacteur(idred);
				if (redDTO != null) {
					request.setAttribute("redDTO", redDTO);
					pageSuivante = "Configuration.jsp";
				} else
					pageSuivante = "Configuration.jsp";

			} else {
				pageSuivante = "Connexion.jsp";
			}
		}
		// modification d'un redacteur
		else if ("mRedacteur".equals(action)) {
			if (session.getAttribute("redacteur") != null) {
				int idRedactModif = Integer.parseInt(request
						.getParameter("idRedactModif"));
				if (idRedactModif != 0) {
					String nomM = request.getParameter("nomModif");
					String prenomM = request
							.getParameter("prenomModif");
					String mailM = request.getParameter("mailModif");
					String passwordM = request
							.getParameter("passwordModif");
					String profil = request.getParameter("addProfil");

					RedacteurDTO redacteur = new RedacteurDTO(0, nomM,
							prenomM, mailM, passwordM, "12/12/12",
							profil);
					if (redacteur != null) {
						int update = RedacteurDAO.getInstance()
								.updateReadacteur(redacteur,
										idRedactModif);
						if (update != 0) {
							pageSuivante = "Configuration.jsp";
						}
					}
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
