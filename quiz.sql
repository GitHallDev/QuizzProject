-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 07 juin 2024 à 05:11
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `quiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `jetons`
--

CREATE TABLE `jetons` (
  `id` int(11) NOT NULL,
  `jeton` varchar(250) NOT NULL,
  `dateExpire` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `propositions`
--

CREATE TABLE `propositions` (
  `id` int(11) NOT NULL,
  `props1` text NOT NULL,
  `props2` text NOT NULL,
  `props3` text NOT NULL,
  `props4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `propositions`
--

INSERT INTO `propositions` (`id`, `props1`, `props2`, `props3`, `props4`) VALUES
(5, 'Planifier', 'Contrôler', 'Organiser', 'Toutes les réponses'),
(6, 'Comprendre le comportement humain', 'Soigner les maladies mentales', 'Étudier les processus mentaux', 'Toutes les réponses'),
(7, 'Football', 'Basketball', 'Tennis', 'Cricket'),
(8, 'Java', 'Python', 'C++', 'JavaScript'),
(9, 'Structuralisme', 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme'),
(10, 'πr²', '2πr', 'πr', 'r²'),
(11, 'Diriger', 'Motiver', 'Organiser', 'Toutes les réponses'),
(12, 'Comprendre l\'inconscient', 'Soigner les maladies mentales', 'Étudier les processus mentaux', 'Aucune des réponses'),
(13, 'Hockey sur gazon', 'Cricket', 'Football', 'Badminton'),
(14, 'C++', 'Rust', 'Go', 'Java'),
(15, 'Représenter une réalité sociale', 'Évaluer les politiques publiques', 'Décrire un phénomène social', 'Toutes les réponses'),
(16, 'πr²h', '2πrh', 'πr²', 'r²h'),
(17, 'Comprendre le fonctionnement des organisations', 'Améliorer la performance des organisations', 'Étudier les relations de pouvoir dans les organisations', 'Toutes les réponses'),
(18, 'Aider les gens à résoudre leurs problèmes psychologiques', 'Étudier le comportement humain', 'Développer des théories sur le fonctionnement de l\'esprit', 'Toutes les réponses'),
(19, 'Le sprint', 'Le skeleton', 'Le bobsleigh', 'Le cyclisme sur piste'),
(20, 'JavaScript', 'Python', 'Java', 'C++'),
(21, 'Entraîner une équipe ou un athlète', 'Planifier les entraînements et les compétitions', 'Motiver les athlètes', 'Toutes les réponses'),
(22, 'Comprendre les interactions stratégiques entre les acteurs', 'Étudier les décisions optimales dans des situations incertaines', 'Analyser les conflits et les coopérations', 'Toutes les réponses'),
(23, '√[(x2-x1)² + (y2-y1)²]', '√[(x1-x2)² + (y1-y2)²]', '√[(x2-x1) + (y2-y1)]', '√[(x1-x2) + (y1-y2)]'),
(24, 'Analyser les besoins des utilisateurs', 'Concevoir des systèmes informatiques', 'Développer des applications', 'Toutes les réponses'),
(25, 'Thérapie cognitivo-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(26, 'Ping-pong', 'Basketball', 'Football', 'Badminton'),
(27, 'Python', 'Java', 'C++', 'R'),
(28, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(29, '2*(longueur + largeur)', 'longueur * largeur', '2longueur + 2largeur', 'longueur + largeur'),
(30, 'Planifier et coordonner les projets', 'Développer des logiciels', 'Assurer le support technique', 'Toutes les réponses'),
(31, 'Football', 'Basketball', 'Tennis', 'Golf'),
(32, 'Swift', 'Python', 'Java', 'C++'),
(33, 'Enquêtes', 'Expérimentation', 'Observation participante', 'Toutes les réponses'),
(34, '(4/3)πr³', '2πr', 'πr²', '4*πr²'),
(35, 'Thérapie cognitivo-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(36, 'Cricket', 'Football', 'Hockey sur gazon', 'Badminton'),
(37, 'JavaScript', 'Python', 'Java', 'C++'),
(38, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(39, '2πr', 'πr²', '2πr²', '2π'),
(40, 'Écrire du code informatique', 'Gérer les projets', 'Assurer la maintenance des systèmes', 'Toutes les réponses'),
(41, 'Football', 'Tennis', 'Rugby', 'Cyclisme'),
(42, 'Python', 'Java', 'R', 'C++'),
(43, 'Observation participante', 'Entretiens', 'Expérimentation', 'Toutes les réponses'),
(44, 'πrl', 'πr²', '2πr', 'r²h'),
(45, 'Thérapie cognitivo-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(46, 'Football', 'Volleyball', 'Jiu-Jitsu', 'Basketball'),
(47, 'Swift', 'Python', 'Java', 'C++'),
(48, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(49, 'c³', '3c', 'c²', '6c'),
(50, 'Concevoir l\'architecture d\'un système informatique', 'Développer des applications', 'Assurer la sécurité des données', 'Toutes les réponses'),
(51, 'Football', 'Tennis', 'Handball', 'Athlétisme'),
(52, 'Python', 'Java', 'R', 'C++'),
(53, 'Modélisation mathématique', 'Expérimentation', 'Analyse de données', 'Toutes les réponses'),
(54, 'Aire de la base * hauteur', 'Aire de la base / hauteur', '2 * (Aire de la base + hauteur)', 'Aire de la base + hauteur'),
(55, 'Thérapie cognitivo-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(56, 'Football', 'Basketball', 'Tennis', 'Cyclisme'),
(57, 'JavaScript', 'Python', 'Java', 'C++'),
(58, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(59, '2 * (largeur + longueur)', 'largeur * longueur', 'largeur + longueur', 'largeur / longueur'),
(60, 'Tester les applications informatiques pour détecter les erreurs', 'Concevoir l\'architecture d\'un système informatique', 'Développer des applications', 'Toutes les réponses'),
(61, 'Football', 'Cyclisme', 'Basketball', 'Tennis'),
(62, 'C', 'C++', 'Python', 'Java'),
(63, 'Cartographie', 'Analyse spatiale', 'Enquêtes', 'Toutes les réponses'),
(64, '(base * hauteur) / 2', 'base + hauteur', 'base - hauteur', 'base * hauteur'),
(65, 'Thérapie cognitivo-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(66, 'Football', 'Cricket', 'Rugby', 'Tennis'),
(67, 'C#', 'Java', 'Python', 'C++'),
(68, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(69, 'πr²', '2πr', 'πr', 'r²'),
(70, 'Analyser les données pour en extraire des informations utiles', 'Concevoir l\'architecture d\'un système informatique', 'Développer des applications', 'Toutes les réponses'),
(71, 'Football', 'Hockey sur glace', 'Basketball', 'Tennis'),
(72, 'JavaScript', 'Python', 'Java', 'C++'),
(73, 'Analyse de documents', 'Entretiens', 'Expérimentation', 'Toutes les réponses'),
(74, '√[(x2-x1)² + (y2-y1)²]', 'x2-x1 + y2-y1', 'x2x1 + y2y1', 'x2/x1 + y2/y1'),
(75, 'Thérapie cognitive-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(76, 'Football australien', 'Cricket', 'Rugby', 'Tennis'),
(77, 'Swift', 'Java', 'Python', 'C++'),
(78, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(79, 'largeur * hauteur', 'largeur + hauteur', 'largeur - hauteur', 'largeur / hauteur'),
(80, 'Concevoir et développer des logiciels', 'Tester les applications informatiques pour détecter les erreurs', 'Assurer la maintenance des systèmes informatiques', 'Toutes les réponses'),
(81, 'Thérapie cognitive-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(82, 'Football', 'Basketball', 'Rugby', 'Tennis'),
(83, 'JavaScript', 'Python', 'Java', 'C++'),
(84, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(85, '(√3/4) * a²', '3/2 * a', '2 * a', '√3 * a'),
(86, 'Conseiller les entreprises sur les technologies informatiques', 'Développer des applications', 'Assurer la maintenance des systèmes informatiques', 'Toutes les réponses'),
(87, 'Hockey sur glace', 'Football', 'Basketball', 'Tennis'),
(88, 'Python', 'Java', 'C++', 'R'),
(89, 'Analyse de textes', 'Expérimentation', 'Observation', 'Toutes les réponses'),
(90, '√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (w2-w1)²]', 'x2-x1 + y2-y1 + z2-z1 + w2-w1', 'x2x1 + y2y1 + z2z1 + w2w1', 'x2/x1 + y2/y1 + z2/z1 + w2/w1'),
(91, 'Thérapie cognitive-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(92, 'Cricket', 'Football', 'Hockey sur gazon', 'Tennis'),
(93, 'C#', 'JavaScript', 'Python', 'C++'),
(94, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(95, '(base1 + base2) * hauteur / 2', 'base1 + base2 + hauteur', 'base1 * base2 * hauteur', 'base1 - base2 + hauteur'),
(96, 'Planifier et coordonner les projets informatiques', 'Développer des applications', 'Assurer la maintenance des systèmes informatiques', 'Toutes les réponses'),
(97, 'Football', 'Rugby', 'Cricket', 'Tennis'),
(98, 'Solidity', 'Python', 'Java', 'C++'),
(99, 'Etude de terrain', 'Analyse de textes', 'Expérimentation', 'Toutes les réponses'),
(100, '√[(x2-x1)² + (y2-y1)² + ... + (z2-z1)²]', 'x2-x1 + y2-y1 + ... + z2-z1', 'x2x1 + y2y1 + ... + z2*z1', 'x2/x1 + y2/y1 + ... + z2/z1'),
(101, 'Thérapie cognitive-comportementale', 'Psychanalyse', 'Thérapie familiale', 'Toutes les réponses'),
(102, 'Football', 'Basketball', 'Tennis', 'Padel'),
(103, 'C#', 'JavaScript', 'Python', 'C++'),
(104, 'Fonctionnalisme', 'Interactionnisme symbolique', 'Marxisme', 'Structuralisme'),
(105, '(b/2) * h', 'πr²', '2πr', 'πr'),
(106, 'Concevoir et développer des systèmes d\'intelligence artificielle', 'Développer des applications', 'Assurer la maintenance des systèmes informatiques', 'Toutes les réponses'),
(107, 'Football', 'Basketball', 'Cyclisme', 'Tennis'),
(108, 'Java', 'Python', 'C++', 'Go'),
(109, 'Etude de cas', 'Analyse de textes', 'Expérimentation', 'Toutes les réponses'),
(110, '√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (t2-t1)²]', 'x2-x1 + y2-y1 + z2-z1 + t2-t1', 'x2x1 + y2y1 + z2z1 + t2t1', 'x2/x1 + y2/y1 + z2/z1 + t2/t1');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `answer` varchar(225) NOT NULL,
  `niveaux` varchar(150) NOT NULL,
  `theme` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `contenu`, `answer`, `niveaux`, `theme`) VALUES
(1, 'Quelle est la fonction principale d\'un manager ?', 'Toutes les réponses', 'intermediaire', 'Management'),
(2, 'Quelle est la fonction principale d\'un manager ?', 'Toutes les réponses', 'intermediaire', 'Management'),
(3, 'Quelle est la fonction principale d\'un manager ?', 'Toutes les réponses', 'intermediaire', 'Management'),
(4, 'Quelle est la fonction principale d\'un manager ?', 'Toutes les réponses', 'intermediaire', 'Management'),
(5, 'Quelle est la fonction principale d\'un manager ?', 'Toutes les réponses', 'intermediaire', 'Management'),
(6, 'Quel est le but principal de la psychologie ?', 'Toutes les réponses', 'difficile', 'Psychologie'),
(7, 'Quel est le sport le plus populaire dans le monde ?', 'Football', 'facile', 'Sport'),
(8, 'Quel est le langage de programmation le plus populaire en 2023 ?', 'Python', 'intermediaire', 'Programmation'),
(9, 'Quelle est la théorie sociologique qui met l\'accent sur les interactions symboliques ?', 'Interactionnisme symbolique', 'intermediaire', 'Science sociale'),
(10, 'Quelle est la formule pour calculer l\'aire d\'un cercle ?', 'πr²', 'facile', 'Mathematique'),
(11, 'Quel est le rôle principal d\'un leader ?', 'Toutes les réponses', 'difficile', 'Management'),
(12, 'Quel est le but principal de la psychanalyse ?', 'Comprendre l\'inconscient', 'intermediaire', 'Psychologie'),
(13, 'Quel est le sport national de l\'Inde ?', 'Cricket', 'facile', 'Sport'),
(14, 'Quel est le langage de programmation le plus rapide en 2023 ?', 'C++', 'difficile', 'Programmation'),
(15, 'Quel est le rôle d\'un modèle dans le domaine des sciences sociales ?', 'Représenter une réalité sociale', 'intermediaire', 'Science sociale'),
(16, 'Quelle est la formule pour calculer le volume d\'un cylindre ?', 'πr²h', 'facile', 'Mathematique'),
(17, 'Quel est le but principal de la théorie des organisations ?', 'Comprendre le fonctionnement des organisations', 'difficile', 'Management'),
(18, 'Quel est le rôle principal d\'un psychologue ?', 'Aider les gens à résoudre leurs problèmes psychologiques', 'intermediaire', 'Psychologie'),
(19, 'Quel est le sport le plus rapide au monde ?', 'Le sprint', 'facile', 'Sport'),
(20, 'Quel est le langage de programmation le plus utilisé dans le développement web en 2023 ?', 'JavaScript', 'difficile', 'Programmation'),
(21, 'Quel est le rôle principal d\'un entraîneur sportif ?', 'Toutes les réponses', 'intermediaire', 'Sport'),
(22, 'Quel est le but principal de la théorie des jeux ?', 'Comprendre les interactions stratégiques entre les acteurs', 'difficile', 'Science sociale'),
(23, 'Quelle est la formule pour calculer la distance entre deux points dans un plan cartésien ?', '√[(x2-x1)² + (y2-y1)²]', 'facile', 'Mathematique'),
(24, 'Quel est le rôle principal d\'un analyste en informatique ?', 'Analyser les besoins des utilisateurs', 'intermediaire', 'Programmation'),
(25, 'Quelle est la principale approche thérapeutique en psychologie clinique ?', 'Thérapie cognitivo-comportementale', 'difficile', 'Psychologie'),
(26, 'Quel est le sport le plus pratiqué en Chine ?', 'Ping-pong', 'facile', 'Sport'),
(27, 'Quel est le langage de programmation le plus adapté pour le machine learning ?', 'Python', 'difficile', 'Programmation'),
(28, 'Quelle est la théorie sociologique qui met l\'accent sur la structure sociale et les institutions ?', 'Fonctionnalisme', 'intermediaire', 'Science sociale'),
(29, 'Quelle est la formule pour calculer le périmètre d\'un rectangle ?', '2*(longueur + largeur)', 'facile', 'Mathematique'),
(30, 'Quel est le rôle principal d\'un chef de projet en informatique ?', 'Planifier et coordonner les projets', 'intermediaire', 'Programmation'),
(31, 'Quel est le sport le plus regardé à la télévision ?', 'Football', 'facile', 'Sport'),
(32, 'Quel est le langage de programmation le plus adapté pour les applications mobiles ?', 'Swift', 'difficile', 'Programmation'),
(33, 'Quelle est la principale méthode de recherche en sociologie ?', 'Enquêtes', 'intermediaire', 'Science sociale'),
(34, 'Quelle est la formule pour calculer le volume d\'une sphère ?', '(4/3)*πr³', 'difficile', 'Mathematique'),
(35, 'Quelle est la principale approche en psychologie pour traiter les phobies ?', 'Thérapie cognitivo-comportementale', 'difficile', 'Psychologie'),
(36, 'Quel est le sport le plus pratiqué en Inde ?', 'Cricket', 'facile', 'Sport'),
(37, 'Quel est le langage de programmation le plus utilisé pour le développement web front-end en 2023 ?', 'JavaScript', 'difficile', 'Programmation'),
(38, 'Quelle théorie sociologique met l\'accent sur les conflits de classe ?', 'Marxisme', 'intermediaire', 'Science sociale'),
(39, 'Quelle est la formule pour calculer le périmètre d\'un cercle ?', '2πr', 'facile', 'Mathematique'),
(40, 'Quel est le rôle principal d\'un développeur logiciel ?', 'Écrire du code informatique', 'intermediaire', 'Programmation'),
(41, 'Quel est le sport le plus pratiqué en France ?', 'Football', 'facile', 'Sport'),
(42, 'Quel est le langage de programmation le plus utilisé pour l\'analyse de données en 2023 ?', 'Python', 'difficile', 'Programmation'),
(43, 'Quelle est la principale méthode de recherche en anthropologie ?', 'Observation participante', 'intermediaire', 'Science sociale'),
(44, 'Quelle est la formule pour calculer la surface latérale d\'un cône ?', 'πrl', 'difficile', 'Mathematique'),
(45, 'Quelle est la principale approche en psychologie pour traiter la dépression ?', 'Thérapie cognitivo-comportementale', 'difficile', 'Psychologie'),
(46, 'Quel est le sport le plus populaire au Brésil ?', 'Football', 'facile', 'Sport'),
(47, 'Quel est le langage de programmation le plus utilisé pour les applications mobiles en 2023 ?', 'Swift', 'difficile', 'Programmation'),
(48, 'Quelle théorie sociologique met l\'accent sur la division du travail dans la société ?', 'Fonctionnalisme', 'intermediaire', 'Science sociale'),
(49, 'Quelle est la formule pour calculer le volume d\'un cube ?', 'c³', 'facile', 'Mathematique'),
(50, 'Quel est le rôle principal d\'un architecte logiciel ?', 'Concevoir l\'architecture d\'un système informatique', 'intermediaire', 'Programmation'),
(51, 'Quel est le sport le plus pratiqué en Allemagne ?', 'Football', 'facile', 'Sport'),
(52, 'Quel est le langage de programmation le plus adapté pour les applications scientifiques en 2023 ?', 'Python', 'difficile', 'Programmation'),
(53, 'Quelle est la principale méthode de recherche en économie ?', 'Modélisation mathématique', 'intermediaire', 'Science sociale'),
(54, 'Quelle est la formule pour calculer le volume d\'un prisme droit ?', 'Aire de la base * hauteur', 'difficile', 'Mathematique'),
(55, 'Quelle est la principale approche en psychologie pour traiter les troubles obsessionnels compulsifs ?', 'Thérapie cognitivo-comportementale', 'difficile', 'Psychologie'),
(56, 'Quel est le sport le plus pratiqué en Espagne ?', 'Football', 'facile', 'Sport'),
(57, 'Quel est le langage de programmation le plus adapté pour le développement web back-end en 2023 ?', 'Java', 'difficile', 'Programmation'),
(58, 'Quelle théorie sociologique met l\'accent sur les interactions entre les acteurs sociaux ?', 'Interactionnisme symbolique', 'intermediaire', 'Science sociale'),
(59, 'Quelle est la formule pour calculer le périmètre d\'un rectangle ?', '2 * (largeur + longueur)', 'facile', 'Mathematique'),
(60, 'Quel est le rôle principal d\'un testeur logiciel ?', 'Tester les applications informatiques pour détecter les erreurs', 'intermediaire', 'Programmation'),
(61, 'Quel est le sport le plus pratiqué en Italie ?', 'Football', 'facile', 'Sport'),
(62, 'Quel est le langage de programmation le plus adapté pour les systèmes embarqués en 2023 ?', 'C', 'difficile', 'Programmation'),
(63, 'Quelle est la principale méthode de recherche en géographie ?', 'Cartographie', 'intermediaire', 'Science sociale'),
(64, 'Quelle est la formule pour calculer la surface d\'un triangle ?', '(base * hauteur) / 2', 'difficile', 'Mathematique'),
(65, 'Quelle est la principale approche en psychologie pour traiter les troubles anxieux ?', 'Thérapie cognitivo-comportementale', 'difficile', 'Psychologie'),
(66, 'Quel est le sport le plus pratiqué en Angleterre ?', 'Football', 'facile', 'Sport'),
(67, 'Quel est le langage de programmation le plus adapté pour le développement de jeux vidéo en 2023 ?', 'C++', 'difficile', 'Programmation'),
(68, 'Quelle théorie sociologique met l\'accent sur les relations de pouvoir dans la société ?', 'Marxisme', 'intermediaire', 'Science sociale'),
(69, 'Quelle est la formule pour calculer la surface d\'un cercle ?', 'πr²', 'facile', 'Mathematique'),
(70, 'Quel est le rôle principal d\'un analyste de données ?', 'Analyser les données pour en extraire des informations utiles', 'intermediaire', 'Programmation'),
(71, 'Quel est le sport le plus pratiqué en Russie ?', 'Hockey sur glace', 'facile', 'Sport'),
(72, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications en ligne en 2023 ?', 'JavaScript', 'difficile', 'Programmation'),
(73, 'Quelle est la principale méthode de recherche en histoire ?', 'Analyse de documents', 'intermediaire', 'Science sociale'),
(74, 'Quelle est la formule pour calculer la distance entre deux points dans un plan ?', '√[(x2-x1)² + (y2-y1)²]', 'difficile', 'Mathematique'),
(75, 'Quelle est la principale approche en psychologie pour traiter les troubles bipolaires ?', 'Thérapie cognitive-comportementale', 'difficile', 'Psychologie'),
(76, 'Quel est le sport le plus pratiqué en Australie ?', 'Football australien', 'facile', 'Sport'),
(77, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications mobiles en 2023 ?', 'Swift', 'difficile', 'Programmation'),
(78, 'Quelle théorie sociologique met l\'accent sur les normes et les valeurs dans la société ?', 'Fonctionnalisme', 'intermediaire', 'Science sociale'),
(79, 'Quelle est la formule pour calculer la surface d\'un rectangle ?', 'largeur * hauteur', 'facile', 'Mathematique'),
(80, 'Quel est le rôle principal d\'un ingénieur logiciel ?', 'Concevoir et développer des logiciels', 'intermediaire', 'Programmation'),
(81, 'Quelle est la principale approche en psychologie pour traiter les troubles de la personnalité ?', 'Thérapie cognitive-comportementale', 'difficile', 'Psychologie'),
(82, 'Quel est le sport le plus pratiqué en Argentine ?', 'Football', 'facile', 'Sport'),
(83, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications web en 2023 ?', 'JavaScript', 'difficile', 'Programmation'),
(84, 'Quelle théorie sociologique met l\'accent sur les inégalités sociales ?', 'Marxisme', 'intermediaire', 'Science sociale'),
(85, 'Quelle est la formule pour calculer la surface d\'un triangle équilatéral ?', '(√3/4) * a²', 'facile', 'Mathematique'),
(86, 'Quel est le rôle principal d\'un consultant informatique ?', 'Conseiller les entreprises sur les technologies informatiques', 'intermediaire', 'Programmation'),
(87, 'Quel est le sport le plus pratiqué en Canada ?', 'Hockey sur glace', 'facile', 'Sport'),
(88, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications de machine learning en 2023 ?', 'Python', 'difficile', 'Programmation'),
(89, 'Quelle est la principale méthode de recherche en sociologie de la culture ?', 'Analyse de textes', 'intermediaire', 'Science sociale'),
(90, 'Quelle est la formule pour calculer la distance entre deux points dans un espace à quatre dimensions ?', '√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (w2-w1)²]', 'difficile', 'Mathematique'),
(91, 'Quelle est la principale approche en psychologie pour traiter les troubles alimentaires ?', 'Thérapie cognitive-comportementale', 'difficile', 'Psychologie'),
(92, 'Quel est le sport le plus pratiqué en Inde ?', 'Cricket', 'facile', 'Sport'),
(93, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications de réalité virtuelle en 2023 ?', 'C#', 'difficile', 'Programmation'),
(94, 'Quelle théorie sociologique met l\'accent sur les interactions entre les individus et leur environnement social ?', 'Interactionnisme symbolique', 'intermediaire', 'Science sociale'),
(95, 'Quelle est la formule pour calculer la surface d\'un trapèze ?', '(base1 + base2) * hauteur / 2', 'facile', 'Mathematique'),
(96, 'Quel est le rôle principal d\'un chef de projet informatique ?', 'Planifier et coordonner les projets informatiques', 'intermediaire', 'Programmation'),
(97, 'Quel est le sport le plus pratiqué en Afrique du Sud ?', 'Rugby', 'facile', 'Sport'),
(98, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications de blockchain en 2023 ?', 'Solidity', 'difficile', 'Programmation'),
(99, 'Quelle est la principale méthode de recherche en anthropologie culturelle ?', 'Etude de terrain', 'intermediaire', 'Science sociale'),
(100, 'Quelle est la formule pour calculer la distance entre deux points dans un espace à n dimensions ?', '√[(x2-x1)² + (y2-y1)² + ... + (z2-z1)²]', 'difficile', 'Mathematique'),
(101, 'Quelle est la principale approche en psychologie pour traiter les troubles de l\'apprentissage ?', 'Thérapie cognitive-comportementale', 'difficile', 'Psychologie'),
(102, 'Quel est le sport le plus pratiqué en Espagne ?', 'Football', 'facile', 'Sport'),
(103, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications de réalité augmentée en 2023 ?', 'C#', 'difficile', 'Programmation'),
(104, 'Quelle théorie sociologique met l\'accent sur les normes et les valeurs dans la société ?', 'Fonctionnalisme', 'intermediaire', 'Science sociale'),
(105, 'Quelle est la formule pour calculer la surface d\'un paraboloïde hyperbolique ?', '(b/2) * h', 'facile', 'Mathematique'),
(106, 'Quel est le rôle principal d\'un ingénieur en intelligence artificielle ?', 'Concevoir et développer des systèmes d\'intelligence artificielle', 'intermediaire', 'Programmation'),
(107, 'Quel est le sport le plus pratiqué en Italie ?', 'Football', 'facile', 'Sport'),
(108, 'Quel est le langage de programmation le plus adapté pour le développement d\'applications de cloud computing en 2023 ?', 'Java', 'difficile', 'Programmation'),
(109, 'Quelle est la principale méthode de recherche en sociologie de la famille ?', 'Etude de cas', 'intermediaire', 'Science sociale'),
(110, 'Quelle est la formule pour calculer la distance entre deux points dans un espace-temps courbe ?', '√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (t2-t1)²]', 'difficile', 'Mathematique');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(9, 'hallleg', 'badara@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(10, 'Bless ', 'blessing.sangninon@gmail.com', '202cb962ac59075b964b07152d234b70'),
(11, 'Rio', 'cisseabdoulkadermodibo@gmail.com', 'a554a93d5738ea034191c03bb32fe15a'),
(12, 'mariam tall', 'tallmariam329@gmail.com', '70ec411bcdecfe5bb1328cb35481cda5'),
(13, 'Folé ', 'fole@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(14, 'Sissoko', 'mouhammadsissoko5@gmail.com', '69527a40de96807a35298c7091492627'),
(15, 'kounta', 'dkounta14@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b'),
(16, 'halleg', 'doumbiab@mail.com', '4100c4d44da9177247e44a5fc1546778');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `jetons`
--
ALTER TABLE `jetons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `propositions`
--
ALTER TABLE `propositions`
  ADD KEY `id` (`id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `jetons`
--
ALTER TABLE `jetons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `propositions`
--
ALTER TABLE `propositions`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `questions` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
