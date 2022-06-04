-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 04 juin 2022 à 14:56
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idA` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `description` text,
  `auteur` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image64` varchar(255) DEFAULT NULL,
  `dateA` date DEFAULT NULL,
  `idU` int(11) NOT NULL,
  `idCateg` int(11) NOT NULL,
  PRIMARY KEY (`idA`),
  KEY `idU` (`idU`),
  KEY `idCateg` (`idCateg`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idA`, `titre`, `description`, `auteur`, `image`, `image64`, `dateA`, `idU`, `idCateg`) VALUES
(1, 'Le projet de loi sur le passe vaccinal arrive à l’Assemblée sur fond de vague Omicron', 'C’était il y a deux semaines. Presque une éternité à l’heure de la pandémie de Covid-19, toujours aussi mouvante et imprévisible. Le 21 décembre 2021, le porte-parole du gouvernement, Gabriel Attal, se félicitait alors d’un « soutien quasi unanime » des groupes parlementaires, à l’exception de La France insoumise (LFI) et du Rassemblement national (RN), sur l’évolution du passe sanitaire en passe vaccinal.\r\n\r\nAlors que le nombre quotidien de cas positifs au Covid-19 a dépassé les 200 000, les députés se penchent, lundi 3 janvier, sur le douzième projet de loi lié à la gestion de la crise sanitaire.\r\n\r\nAvec près de 720 amendements déposés en vue de la séance, la concorde espérée par l’exécutif semble s’éloigner pour de bon, à trois mois de l’élection présidentielle. Les oppositions entendent questionner, critiquer et modifier les dispositions contenues dans ce projet de loi de trois articles. « Cela reste la meilleure réponse à ceux qui viennent nous expliquer qu’il n’y a plus de démocratie et que toutes ces mesures ne sont pas débattues », loue toutefois la présidente La République en marche (LRM) de la commission des lois, Yaël Braun-Pivet, alors que les menaces de mort anonymes contre les élus se multiplient.', 'Le Monde', 'news1.jpg', NULL, '2022-01-03', 1, 1),
(2, 'Les Etats-Unis, la Russie, la Chine, le Royaume-Uni et la France s’engagent à prévenir la dissémination de l’arme nucléaire', 'Ces cinq pays, membres du Conseil de sécurité, sont les cinq juridiquement reconnus comme « dotés de l’arme nucléaire » par le traité sur la non-prolifération.Les cinq pays membres du Conseil de sécurité, les Etats-Unis, la Chine, la Russie, le Royaume-Uni et la France, se sont engagés, lundi 3 janvier, à « prévenir la poursuite de la dissémination » des armes nucléaires, dans une déclaration commune avant une conférence d’examen du traité sur la non-prolifération (TNP).\r\n\r\nLes signataires sont les cinq Etats juridiquement reconnus comme « dotés de l’arme nucléaire » par le TNP. Trois autres pays considérés comme détenteurs de la bombe atomique – l’Inde, le Pakistan et Israël – ne sont pas signataires de ce traité, tandis que la Corée du Nord l’a dénoncé.\r\n\r\n« Nous affirmons qu’une guerre nucléaire ne peut être gagnée et ne doit jamais être menée », affirment les cinq pays signataires. « Compte tenu des conséquences de grande ampleur qu’aurait l’emploi des armes nucléaires, nous affirmons également que celles-ci, tant qu’elles existent, doivent servir à des fins défensives, de dissuasion et de prévention de la guerre », ajoutent-ils. « Chacun d’entre nous entend maintenir et renforcer encore ses mesures nationales destinées à empêcher l’utilisation non autorisée ou non intentionnelle d’armes nucléaires », poursuit le texte.\r\n\r\nNégociations avec l’Iran\r\nCette déclaration est publiée avant la tenue, prévue cette année sous l’égide de l’ONU, de la dixième conférence d’examen des parties au TNP, le traité international entré en vigueur en 1970 afin d’empêcher la propagation des armes nucléaires. Il compte 191 Etats parties.', 'Le Monde', 'news2.jpg', NULL, '2022-01-03', 1, 1),
(4, 'Insultes, menaces et fake news... Quand la rencontre entre des anti-pass et notre journaliste s\'envenime', 'TENSION - Les députés doivent examiner le projet de loi transformant le passe sanitaire en passe vaccinal jusque tard dans la nuit, lundi. L’entrée en vigueur du texte est prévue pour le 15 janvier, contestée par des députés, mais aussi des anti-pass. Avec lesquels le dialogue s\'est révélé très tendu devant l\'Assemblée nationale. Ce lundi 3 janvier, l’Assemblée a commencé à examiner le texte sur le pass vaccinal. Dans le JDD, le Professeur André Grimaldi propose de demander aux non-vaccinés d’écrire des directives anticipées sur la réanimation en cas de forme grave de Covid-19. Il relance ainsi le débat de ces soignants qui ont peur de devoir trier entre vaccinés et non vaccinés.L’Instant PoL a demandé leur avis aux députés et aux anti-pass. Avec un dialogue plus que compliqué avec ces derniers. Et une invitée surprise : Véronique Genest. Tous les soirs dans Ruth Elkrief 2022, Paul Larrouturou vous emmène dans les coulisses de la politique. Curieux, amusé, pertinent et impertinent, l’Instant Pol pose un regard décalé sur la vie politique pour casser les carcans de la com’ politique. Un nouveau rythme pour suivre la campagne présidentielle 2022.\r\n\r\n', 'LCI', 'Capture d’écran 2022-01-04 112625.png', NULL, '2022-01-04', 1, 1),
(7, 'Moi je l\'ai mon pass sanitaire', 'lol234', 'CNews', 'Capture d’écran 2022-01-04 133604.png', NULL, '2022-01-04', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCateg` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCateg`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCateg`, `libelle`) VALUES
(1, 'News'),
(2, 'Politique');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) DEFAULT NULL,
  `message` text,
  `dateMessage` date DEFAULT NULL,
  `idA` int(11) NOT NULL,
  PRIMARY KEY (`idC`),
  KEY `idA` (`idA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`idC`, `pseudo`, `message`, `dateMessage`, `idA`) VALUES
(1, 'LaaWaP', 'blablabla blabla blabla', '2022-01-12', 1),
(2, 'Toto', 'Pas mal', '2022-01-02', 1),
(3, 'SAm232', 'Heyy !!!', '2022-01-03', 1),
(4, 'toto', 'hi', '2021-01-04', 1),
(5, 'lala', 'Bsoir', '2022-01-04', 1),
(6, 'Hello', 'Pas fou', '2022-01-04', 2),
(7, 'Victor', 'C nul', '2022-01-04', 2),
(8, 'Hello', 'Test', '2022-01-05', 4),
(9, 'Bjr', 'eheheh', '2022-01-05', 4),
(10, 'Ok', 'Dacc\r\n', '2022-01-05', 7),
(11, 'TITI', 'Salut', '2022-01-05', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idU` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idU`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idU`, `email`, `mdp`, `role`) VALUES
(1, 'admin@gmail.com', '$2b$10$mXoTbGAqZzQo9wtsdsNBReWwrsrwrkxHjC.S5M0ZPXAEd3ckB462C', 'admin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`idU`) REFERENCES `utilisateur` (`idU`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`idCateg`) REFERENCES `categorie` (`idCateg`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`idA`) REFERENCES `article` (`idA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
