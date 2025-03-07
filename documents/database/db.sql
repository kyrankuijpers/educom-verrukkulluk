-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2025 at 02:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ver`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_type`
--

CREATE TABLE `cuisine_type` (
  `id` int(11) NOT NULL,
  `record_type` char(1) NOT NULL COMMENT 'C:cuisine, T:type',
  `descr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuisine_type`
--

INSERT INTO `cuisine_type` (`id`, `record_type`, `descr`) VALUES
(1, 'C', 'Fusion'),
(2, 'C', 'Middle East'),
(3, 'C', 'Dutch'),
(4, 'C', 'Italian'),
(5, 'T', 'Meat'),
(6, 'T', 'Fish'),
(7, 'T', 'Vegetarian'),
(8, 'T', 'Vegan');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `recipe_id`, `product_id`, `amount`) VALUES
(1, 1, 2, 4),
(2, 1, 1, 4),
(3, 1, 4, 1000),
(4, 1, 3, 1.33),
(5, 1, 6, 4),
(6, 1, 7, 50),
(7, 1, 8, 1),
(8, 1, 18, 0.25),
(9, 2, 17, 335),
(10, 2, 2, 4),
(11, 2, 8, 1.5),
(12, 2, 18, 0.25),
(13, 2, 21, 300),
(14, 2, 20, 125),
(15, 2, 19, 200),
(16, 2, 3, 2),
(17, 3, 4, 1050),
(18, 3, 9, 2),
(19, 3, 16, 15),
(20, 3, 15, 450),
(21, 3, 10, 50),
(22, 2, 5, 33.35),
(23, 1, 5, 7.5),
(24, 4, 22, 400),
(25, 4, 23, 2),
(26, 4, 25, 75),
(27, 4, 24, 200),
(28, 4, 18, 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `descr` varchar(100) NOT NULL,
  `price` int(11) NOT NULL COMMENT 'cents',
  `unit` text NOT NULL,
  `content` float NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `descr`, `price`, `unit`, `content`, `img`) VALUES
(1, 'Zalm', 'Rauwe zalmfilet', 400, 'piece', 1, 'kflwjaifojkasf'),
(2, 'Tomaten', 'Losse tomaten', 95, 'piece', 1, 'fkweajfiopwejgklsad;jf'),
(3, 'Courgette', 'Courgette', 100, 'piece', 1, 'isdfjoiweajgkl;dsajfkl;'),
(4, 'Aardappelen', 'Aardappelen', 299, 'gram', 1000, 'asdfkljasdjwsakl'),
(5, 'Olijfolie', 'Classico', 949, 'ml', 700, 'dfkljadwswea;lg'),
(6, 'Komijnpoeder', 'Gemalen komijnzaad', 345, 'gram', 37, 'sadfkljasgl;jasg'),
(7, 'Amandel', 'Geroosterde ongezouten amandelen', 419, 'gram', 200, 'dsafklajgiow;eajg'),
(8, 'Citroen', 'Creative Technologie', 185, 'piece', 3, 'dsafjkawjgihjawkf;'),
(9, 'Ui', 'Netje uien', 100, 'kg', 1, 'weafljkao;gwj'),
(10, 'Boter', 'Om te bakken', 200, 'gram', 200, 'awefjklw;ajkl;'),
(15, 'Tuinerwten', 'Diepgevroren erwten', 320, 'kg', 1.3, 'fdsvdfhgafg'),
(16, 'Vissticks', 'Nostalgie', 300, 'piece', 15, 'dsfasd'),
(17, 'Couscous', 'Couscous', 311, 'gram', 500, 'fwafewaf'),
(18, 'Knoflook', 'Knoflook', 150, 'piece', 2, 'asfawef'),
(19, 'Kikkererwten', 'Kikkererwten', 150, 'gram', 230, 'dsfag'),
(20, 'Yoghurt', 'Yoghurt', 120, 'gram', 400, 'dsff'),
(21, 'Halloumi', 'Cypriotische geitenkaas', 299, 'gram', 150, 'ggadsf'),
(22, 'Spaghetti', 'Spaghetti', 135, 'gram', 700, 'asdfasdf'),
(23, 'Eieren', 'Medium ', 160, 'piece', 6, 'dfsgasdg'),
(24, 'Bacon', 'Bacon strips and bacon strips and bacon strips', 210, 'gram', 300, 'dagfasdgasdf'),
(25, 'Parmigiano Reggiano', 'Italiaanse kaas met een beschermde status, uit de regio Parma', 400, 'gram', 273, 'sdaf');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_date` date NOT NULL,
  `title` text NOT NULL,
  `descr_short` text NOT NULL,
  `descr_long` text NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `cuisine_id`, `type_id`, `user_id`, `add_date`, `title`, `descr_short`, `descr_long`, `img`) VALUES
(1, 1, 6, 1, '2025-03-07', 'Zalm met ovengroenten en krieltjes met amandel-dukkha', 'Dukkah is een Egyptisch specerijennotenmengel dat in vrijwel alle Egyptische huishoudens te vinden is. Dukh dukh betekent letterlijk vijzelen. De kruidige dukkah met amandelen en komijnpoeder hoeft niet heel fijngemalen te worden. Het malen is enkel om alle kruiden en smaken met elkaar samen te voegen.', 'Dukkah is een Egyptisch specerijennotenmengel dat in vrijwel alle Egyptische huishoudens te vinden is. Dukh dukh betekent letterlijk vijzelen. De kruidige dukkah met amandelen en komijnpoeder hoeft niet heel fijngemalen te worden. Het malen is enkel om alle kruiden en smaken met elkaar samen te voegen.', 'asdfasdf'),
(2, 2, 7, 1, '2025-03-07', 'Couscous met halloumi, kikkererwten en aubergine', 'Couscous is populair in veel Noord-Afrikaanse landen, waar het meestal met groenten, vlees of vis en een pittige saus wordt gegeten. In Egypte wordt het juist meer als dessert gegeten, zoals wij een rijstpudding kennen: met boter, kaneel, rozijnen en room. Vandaag maak je een couscous met een mediterrane twist door halloumi toe te voegen, een zilte kaas uit Cyprus die niet smelt tijdens het bakken.', 'Couscous is populair in veel Noord-Afrikaanse landen, waar het meestal met groenten, vlees of vis en een pittige saus wordt gegeten. In Egypte wordt het juist meer als dessert gegeten, zoals wij een rijstpudding kennen: met boter, kaneel, rozijnen en room. Vandaag maak je een couscous met een mediterrane twist door halloumi toe te voegen, een zilte kaas uit Cyprus die niet smelt tijdens het bakken.', 'bbbb'),
(3, 3, 6, 3, '2024-03-13', 'Vissticks met aardappelpuree en tuinerwten', 'In de tijd dat je de vissticks in de oven bakt, maak je zelf nog wat aardappelpuree en bereid je je groente voor. En voila, in een halfuurtje zit je aan tafel.', 'In de tijd dat je de vissticks in de oven bakt, maak je zelf nog wat aardappelpuree en bereid je je groente voor. En voila, in een halfuurtje zit je aan tafel.', 'ccccc'),
(4, 4, 5, 4, '2023-02-28', 'Spaghetti Carbonara ', 'Zonder room want dat heurt niet.', 'Carbonara of alla Carbonara is een Italiaanse bereiding die meestal met spaghetti wordt gegeten. De saus wordt bereid met \'arme\' ingrediënten als buikspek (pancetta) of wangspek (guanciale), kaas (pecorino), ei of eidooier en zwarte peper. Het komt van origine uit Lazio, maar staat standaard op de kaart bij veel restaurants in heel Italië.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_info`
--

CREATE TABLE `recipe_info` (
  `id` int(11) NOT NULL,
  `record_type` char(1) NOT NULL COMMENT 'I: instruction, C: comment, R: review, F: favourite',
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `info_numeric` int(11) DEFAULT NULL COMMENT 'I: step, R: rating',
  `info_txt` text DEFAULT NULL COMMENT 'I: instruction, C: comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_info`
--

INSERT INTO `recipe_info` (`id`, `record_type`, `recipe_id`, `user_id`, `comment_date`, `info_numeric`, `info_txt`) VALUES
(1, 'I', 1, NULL, NULL, 1, 'Verwarm de oven voor op 220 graden. Snijd de tomaat doormidden en de courgette in plakken van ongeveer een ½ cm dik. Snijd of pers de knoflook fijn.'),
(2, 'I', 1, NULL, NULL, 2, 'Meng in een ovenschaal met bakpapier de courgette met de helft van de knoflook en 1/3 van de olijfolie. Haal de vleestomaten met de open kant door de olie in de ovenschaal, keer de vleestomaten om en meng met de courgette. Bestrooi naar smaak met peper en zout en bak de groenten 20 – 25 minuten in de oven.'),
(3, 'I', 1, NULL, NULL, 3, 'Was ondertussen de krieltjes grondig en snijd in kwarten. Verhit 1/3 van de olijfolie in een wok of hapjespan met deksel en bak de krieltjes, afgedekt, 20 minuten op middelhoog vuur. Schep tussendoor om. Haal de laatste 5 minuten de deksel van de pan.'),
(4, 'I', 1, NULL, NULL, 4, 'Hak ondertussen de amandelen fijn. Was de citroen grondig en rasp de schil met een fijne rasp.'),
(5, 'I', 1, NULL, NULL, 5, 'Verhit een koekenpan op middelhoog vuur en rooster de amandelen, zonder olie, 2 minuten op middelhoog vuur. Voeg het komijnpoeder, de citroenrasp en de overige knoflook toe en bak 30 seconden. Schep de amandeldukkah over in een hoge kom of blender en bestrooi met peper en zout.'),
(6, 'I', 1, NULL, NULL, 6, 'Hak de amandel-dukkah met een staafmixer of in de blender grof. Dek goed af tijdens het malen. '),
(7, 'I', 1, NULL, NULL, 7, 'Verhit de overige olijfolie in dezelfde koekenpan en bak de zalmfilet 3 minuten op middelhoog vuur. Breng op smaak met peper en zout.'),
(8, 'I', 1, NULL, NULL, 8, 'Voeg de amandel-dukkah toe aan de gebakken krieltjes en roerbak 1 minuut. Breng eventueel verder op smaak met peper en zout.'),
(9, 'I', 1, NULL, NULL, 9, 'Verdeel de krieltjes over de borden en serveer met de groenten en zalm.'),
(10, 'C', 1, 2, '2025-03-07', NULL, 'Beetje vage combi but ok.'),
(11, 'I', 2, NULL, NULL, 1, 'Warm de oven voor op 220 graden. Giet de kikkererwten af en dep ze droog met keukenpapier. Snijd de aubergine in halve plakjes. Leg de kikkererwten en de aubergine op een bakplaat met bakpapier. Besprenkel ze met 1 el olijfolie per persoon, peper en zout en meng goed door. Bak de aubergine en de kikkererwten 20 minuten in de oven, of totdat de kikkererwten krokant zijn en goudbruin kleuren. Schep halverwege om.'),
(12, 'I', 2, NULL, NULL, 2, 'Snijd de tomaat in blokjes. Pers de knoflook of snijd fijn. Rasp de schil van de citroen en pers de citroen uit. Snijd de halloumi in blokjes van 1 – 2 cm.'),
(13, 'I', 2, NULL, NULL, 3, 'Giet de couscous en de bouillon in een saladekom en laat, afgedekt, 10 minuten wellen. Roer daarna los met een vork.'),
(14, 'I', 2, NULL, NULL, 4, 'Verhit 1/4 el olijfolie per persoon in een koekenpan op middelhoog vuur en bak de limoenrasp en de knoflook 30 seconden. Voeg de blokjes halloumi toe, bak in 3 – 4 minuten rondom krokant en haal daarna uit de pan. Bak de gewelde couscous 1 – 2 minuten in dezelfde pan in de limoen-knoflookolie.'),
(15, 'I', 2, NULL, NULL, 5, 'Meng de tomaat door de couscous en breng op smaak met de extra olie, peper en zout.'),
(16, 'I', 2, NULL, NULL, 6, 'Verdeel de couscous over de borden en schep de kikkererwten en aubergine ernaast. Besprenkel de couscous met het limoensap en garneer met de halloumi. Serveer de yoghurt apart, zodat iedereen dit naar eigen smaak kan toevoegen.'),
(22, 'F', 4, 4, NULL, NULL, NULL),
(23, 'R', 3, NULL, NULL, 2, NULL),
(24, 'R', 3, NULL, NULL, 3, NULL),
(25, 'I', 3, NULL, NULL, 1, 'Verwarm de oven voor op 220 °C. Laat de tuinerwten ontdooien. Leg de vissticks op een met bakpapier beklede bakplaat en bak in de oven in 15-20 min. lichtbruin en gaar.'),
(26, 'I', 3, NULL, NULL, 2, 'Schil en snijd ondertussen de aardappelen in gelijke stukken. Kook in 20 min. gaar. Giet af en stamp met de helft van de roomboter tot een smeuïge puree. Breng op smaak met peper en eventueel zout.'),
(27, 'I', 3, NULL, NULL, 3, 'Snijd de uien in dunne halve ringen. Smelt de rest van de boter in een koekenpan en bak de uien 5 min. Voeg de ontdooide tuinerwten toe en bak nog 4 min. Breng op smaak met peper en eventueel zout.'),
(28, 'I', 4, NULL, NULL, 1, 'Kook de spaghetti volgens de aanwijzingen op de verpakking beetgaar. Breek de eieren en klop met een vork door elkaar. Rasp de kaas erboven en meng erdoor. '),
(29, 'I', 4, NULL, NULL, 2, 'Verhit een koekenpan zonder olie of boter op middelhoog vuur en bak de spekreepjes in 5 min. uit. Schep de spekjes uit de pan en laat uitlekken op keukenpapier.'),
(30, 'I', 4, NULL, NULL, 3, 'Voeg al roerend het eimengsel toe. Blijf roeren tot de kaas gesmolten is en de saus iets is ingedikt. Voeg eventueel wat kookvocht toe om de pasta smeuïger te maken. Schep de spaghetti carbonara vlug in een schaal, zodat de restwarmte van de pan het ei in de saus niet verder laat stollen. Serveer direct.'),
(31, 'C', 4, 1, '2025-02-24', NULL, 'Dit is erg lekker, maar daar moet eigenlijk nog zwarte peper bij en de bacon kun je beter vervangen door guancale of hoe heet dat spul. Ook lekker met kip en een heel levensverhaal hierachter om te testen hoeveel ruimte het inneemt en met mijn oma gaat het ook goed.'),
(32, 'C', 4, 1, '2025-01-24', NULL, 'Dit is erg lekker maar het wordt beter als je zwarte peper toevoegt en de bacon vervangt door de guancale of hoe heet dat spul. En ook een heel levensverhaal hier om te kijken hoeveel ruimte het in beslag neemt en met mijn oma gaat het ook goed trouwens.'),
(33, 'F', 4, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `img`) VALUES
(1, 'Kyran Kuijpers', 'asdfjkl;gjk', 'kyrankuijpers@gmail.com', 'dkslfjpwafjioapwtjio'),
(2, 'Hans Zimmer', 'asdfklj*a', 'hans@zimmer.com', 'klewajfiopawgjioweaf'),
(3, 'Indiana Jones', 'ajkflPWwjasf#', 'indy@archeology.org', 'jakewfsjpiojrkwael;fjok;j'),
(4, 'Christian Bale', 'kasldjf;?6&^4ASA', 'christianbale@hotmail.com', 'sdfjklawjfioewpujt2p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuisine_type`
--
ALTER TABLE `cuisine_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_recipe` (`recipe_id`),
  ADD KEY `ingredient_product` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_cuisine` (`cuisine_id`),
  ADD KEY `recipe_type` (`type_id`),
  ADD KEY `recipe_user` (`user_id`);

--
-- Indexes for table `recipe_info`
--
ALTER TABLE `recipe_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_info_recipe` (`recipe_id`),
  ADD KEY `recipe_info_user` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuisine_type`
--
ALTER TABLE `cuisine_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_info`
--
ALTER TABLE `recipe_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `ingredient_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_cuisine` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine_type` (`id`),
  ADD CONSTRAINT `recipe_type` FOREIGN KEY (`type_id`) REFERENCES `cuisine_type` (`id`),
  ADD CONSTRAINT `recipe_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `recipe_info`
--
ALTER TABLE `recipe_info`
  ADD CONSTRAINT `recipe_info_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
