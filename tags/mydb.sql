-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 27 Avril 2014 à 20:08
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenu` longtext,
  `redacteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titre` (`titre`),
  KEY `fk_article_redacteur_idx` (`redacteur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `date`, `contenu`, `redacteur_id`) VALUES
(14, 'Mocktar Maurice ZONGO', '2014-04-21 21:57:23', ' Président du Conseil régional du Centre-Ouest\r\nLors de sa première session tenue le 19 mars 2014, le conseil régional du Centre-Ouest a décidé de la gratuité des évacuations sanitaires. Les frais, 25 000/évacuation, seront désormais à la charge du Conseil régional. Un grand soulagement pour les patients et un bel exemple à suivre pour les autres conseils régionaux.', 36),
(15, 'Transfert d?argent ', '2014-04-21 21:58:26', ' \r\n\r\nLes transferts de fonds opérés par la diaspora vers l?Afrique coûtent 1,8 milliards de dollars par an selon un rapport publié mercredi 16 avril 2014 par l?ONG britannique, Overseas Development Institute. \r\n\r\nCe montant représente les frais des opérations imposés par les sociétés de transfert MoneyGram et Western Union. L?ONG britannique dénonce les frais très élevés pratiqués sur les transferts effectués par les Africains de l?étranger.  Une situation due au manque de concurrence.\r\n\r\n« L?Afrique subsaharienne est la région la plus pauvre au monde mais elle essuie les frais de transfert les plus élevés. Ils sont en moyenne de 12 % sur les transferts de 200 dollars américains, ce qui équivaut quasiment au double de la moyenne mondiale », selon ce rapport.\r\n\r\nLes calculs sont faits sur l?écart entre les frais de virement appliqués à l?Afrique et ceux en vigueur dans d?autres régions, ainsi que sur l?objectif international du G8 et G20 de réduire les frais à 5 %.\r\nLes transferts de fonds de diaspora vers l''Afrique coûtent près de 2 millions de dollars l''an.\r\n\r\nLes transferts de fonds de diaspora vers l?Afrique coûtent près de 2 millions de dollars l?an.\r\n\r\nCes taux très élevés impactent négativement sur le développement en Afrique et fragilisent le lien vital de centaines de familles, les ressources transférés étant pour la plupart investis dans l?éducation, la santé et la construction d?un avenir meilleur.\r\n\r\nSi cette somme n?était pas perdue en frais de transfert d?argent, elle permettrait de financer la scolarisation de quelque 14 millions d?enfants, soit presque la moitié des enfants non scolarisés en Afrique subsaharienne, et de fournir de l?eau potable à 21 millions de personnes.\r\n\r\nSur le sujet, Western Union a affirmé gagner en moyenne 5 à 6 % sur les sommes envoyées à travers le monde, et soutient que les taux sont fonction des pays à cause d?un certain nombre de facteurs, comme les coûts de protection du consommateur, les taxes locales ou la volatilité des taux de changes.', 38),
(16, 'sarr', '2014-04-23 20:57:14', 'premiere année esigelec', 38),
(17, 'Présidentielle 2015 : Le CDP en quête d?un candidat', '2014-04-25 09:58:24', 'Au stade actuel de la situation politique, tout laisse croire que le président Blaise Compaoré n?a plus d?autre choix que de respecter les termes de la constitution qui lui interdisent de briguer encore la magistrature suprême. Les médiateurs autosaisis ont fini par laisser les scrupules de côté pour lui dire ce qu?ils pensaient tout bas, à savoir : renoncer clairement à modifier l?article 37 de la constitution. « Le président du Faso prend sur lui la responsabilité de son départ en 2015, à la fin constitutionnelle de son mandat », déclarent les sages. Pour eux, c?est le seul scénario d?honneur qui s?impose à lui. Dans ce cas, « la majorité joue la carte de la responsabilité et positionne son candidat le plus à même de lui assurer la victoire ». C?est le souhait de Jean-Baptiste Ouédraogo et de ses compagnons de la médiation. Cette invite à trouver un candidat autre que Blaise Compaoré pour l?échéance électorale de 2015 est un grand défi pour le parti présidentiel, une grande responsabilité qu?il n?a jamais pu exercer jusque-là. Le président Blaise Compaoré étant l?alpha et l?oméga du parti, les éventuels présidentiables se font encore tout petits, espérant avoir la préférence du « grand maître de la loge CDP ».\r\n« Le CDP cherche candidat pour 2015. » Cela pourrait être l?intitulé d?une annonce à afficher au siège du parti, Avenue du Dr Kwamé Nkrumah. Pressé par le calendrier électoral qui défile à grande vitesse, le Congrès pour la démocratie et le progrès (CDP) commence à sortir de sa logique de « Blaise ou rien ». Les responsables du parti n?écartent plus l?hypothèse d?une autre candidature autre que celle de Blaise Compaoré à la prochaine présidentielle. Interrogé par notre confrère de L?Evénement (n°276 du 25 mars 2014) sur les intentions de Blaise Compaoré de briguer un autre mandat, le secrétaire exécutif national du parti lâche : « Etant un collaborateur du président Blaise Compaoré, je ne l?ai pas entendu se prononcer sur cette question. Et le CDP, mon parti, ne s?est pas encore exprimé sur le sujet. Il convoquera en temps opportun ses instances pour le faire. » Assimi Kouanda n?est pas non plus à l?aise quand on le questionne sur le référendum comme si le sujet était devenu subitement tabou au CDP. Il se contente d?annoncer des évidences comme la tenue d?un congrès pour début 2015 pour faire connaitre le candidat du parti. Toutes ces circonvolutions traduisent néanmoins une certaine évolution dans l?agenda politique du pouvoir, ne serait-ce que sur le plan théorique. Même lors de la réunion du bureau politique national (BPN) du parti tenue le 29 mars, Assimi Kouanda et ses camarades ont soigneusement évité d?évoquer les sujets qui fâchent (mise en place du sénat, révision de l?article 37, référendum). Ils ne martèlent plus leur souhait de voir Blaise Compaoré se représenter en 2015. C?est en soi un début de changement de cap. Mélégué Maurice Traoré, député et conseiller politique du parti, avait déjà dressé dans le quotidien Le Pays du mardi 25 mars un constat implacable de l?inutilité pour le pays d?une énième candidature de Blaise Compaoré. « ? à mon avis, quand on a fait 25 ou 30 ans à la tête d?un Etat, on ne doit plus se poser de question en terme d?avenir politique. Après 30 ans, que peut-il encore faire pour le Burkina qu?il n?a pas fait ? Il faut simplement aménager le passage à une autre phase de l?histoire politique du pays. », assène l?ex-président de l?Assemblée nationale (1997- 2002). Pour lui aussi, « si aujourd?hui ou demain, Blaise décide de ne pas se présenter, il faudra bien que le CDP présente un candidat ». Après avoir admis enfin que le CDP peut présenter quelqu?un d?autre, la question qui revient c?est celle de l?identité des hommes et des femmes susceptibles de porter l?étendard du parti à la prochaine présidentielle. Les éventuels candidats vont se recruter dans trois milieux : la diplomatie, le sérail militaire et l?appareil du parti.', 36),
(18, 'Le Balai Citoyen : « Il est possible de mettre fin aux délestages »', '2014-04-25 10:36:01', 'Les délestages de la Nationale d?Electricité exaspèrent plus d?un. Et le Mouvement Le Balai Citoyen, dont l?objectif principal est d?assainir par l?action citoyenne la gestion de la chose publique, ne pouvait demeurer dans un mutisme total. Dans le but donc de protester contre les défaillances de la SONABEL dans sa gestion de la période de pointe, il organisera un Sit-in le 29 avril 2014 en face des sièges de la SONABEL Ouaga et Bobo à partir de 8h. Au préalable, les membres de la coordination nationale du Mouvement que sont Smockey, Sams?k le Jah et Basic Soul, ont rencontré la presse en cette matinée du 24 avril afin de discuter de la question.\r\n\r\nLes raisons des délestages qu?endurent la population burkinabè, à en croire les ténors du Mouvement le Balai Citoyen, reposent sur une question de mal gouvernance au sein même de la SONABEL. Un état de fait qui aurait endetté la société de dizaines de milliards de F CFA vis-à-vis de la Société Nationale Burkinabè d?Hydrocarbures (SONABHY), selon des renseignements glanés auprès de personnes ressources. A cela viennent se greffer la vétusté des installations électriques et surtout le manque de communication de la part des premiers responsables. Pour les conférenciers du jour, on peut mettre fin aux délestages si l?Etat subventionne et met les moyens conséquents. « En principe, la SONABEL n?est pas faite pour faire des bénéfices. Elle doit assurer un service, c?est-à-dire, donner de l?électricité » affirmera Sams?K le Jah.', 36),
(19, 'ma belle', '2014-04-25 16:00:56', 'Tu es trop belle.\r\n\r\nje t''aime a mourir.\r\ntu es l''amour de ma vie\r\ntu est la plus belle de la vie\r\npour toi, je vais souffrir \r\n', 40),
(20, 'koro', '2014-04-27 19:14:52', 'je t aime\r\n\r\n\r\n\r\ntu es trop belle\r\n\r\n\r\nde la part de NAGALO Alexis', 40);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenu` varchar(700) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `pseudo`, `date`, `contenu`, `article_id`) VALUES
(19, 'gg', '2014-04-22 14:10:38', 'hgfyjfg', 14),
(20, 'al', '2014-04-22 15:17:46', 'bon article', 15),
(21, 'al', '2014-04-22 15:19:45', 'bon article', 15),
(23, 'Fatim', '2014-04-22 18:26:28', 'ooohhhhhh!!!\r\nmy god!!!!!', 15),
(24, 'g', '2014-04-23 20:52:40', 'Mr sarr', 14),
(25, 'marc', '2014-04-24 20:09:09', 'grosse tete', 14),
(26, 'alex', '2014-04-25 09:59:38', 'c''est ridicule tt ça. \r\nils vont tous partir en 2015', 17),
(30, 'koro', '2014-04-25 15:56:37', 'joili article.\r\n\r\nj aime bien. coool', 15),
(31, 'koro', '2014-04-26 18:44:22', 'cè korotoumou', 19),
(32, 'alex', '2014-04-26 21:40:36', 'je t aime à la follie', 19);

-- --------------------------------------------------------

--
-- Structure de la table `redacteur`
--

CREATE TABLE IF NOT EXISTS `redacteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `motPasse` varchar(45) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Contenu de la table `redacteur`
--

INSERT INTO `redacteur` (`id`, `nom`, `prenom`, `mail`, `motPasse`, `date`) VALUES
(36, 'nagalo', 'alexis', 'nagalo@alexis.fr', 'UCYWU\\US', '2014-04-24 00:01:20'),
(38, 'goyat', 'helene', 'goyat@helene.fr', 'UCYWU\\US', '2014-04-24 00:24:05'),
(40, 'diakite', 'korotoumou', 'koro@dia.fr', 'UCYWU\\US', '2014-04-25 15:55:01');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_redacteur` FOREIGN KEY (`redacteur_id`) REFERENCES `redacteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
