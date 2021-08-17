-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: aug. 17, 2021 la 08:10 AM
-- Versiune server: 10.4.19-MariaDB
-- Versiune PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `magazin`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `angajati`
--

CREATE TABLE `angajati` (
  `id` int(10) NOT NULL,
  `nume` varchar(128) NOT NULL DEFAULT 'fara nume',
  `prenume` varchar(128) NOT NULL DEFAULT 'fara prenume',
  `functie` varchar(128) NOT NULL DEFAULT 'fara functie',
  `salariu` int(10) NOT NULL DEFAULT 0,
  `magazinID` int(10) NOT NULL DEFAULT 0,
  `imagine` varchar(128) NOT NULL DEFAULT 'fara imagine'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `angajati`
--

INSERT INTO `angajati` (`id`, `nume`, `prenume`, `functie`, `salariu`, `magazinID`, `imagine`) VALUES
(1, 'COSTIN', 'BUCUROIU', 'MANAGER RAIONR', 0, 1, 'src/img/img angajati/2.jpg'),
(9, 'MIRELA', 'BOTEEA', 'CASIER', 0, 7, 'src/img/img angajati/3.jpg'),
(11, 'ANDREI', 'ZANFIR', 'ASISTENT DE VANZARI', 0, 1, 'src/img/img angajati/5.jpg'),
(12, 'MARIAN\r\n', 'ILIE', 'DIRECTOR ADJUNCT', 0, 1, 'src/img/img angajati/4.jpg'),
(13, 'CARSTEA', 'MARIUS', 'DIRECTOR', 0, 10, 'src/img/img angajati/6.jpg'),
(14, 'ALEXANDRU ', 'IULIAN', 'BOOK KEEPER', 0, 8, 'src/img/img angajati/1.jpg');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categorii_produse`
--

CREATE TABLE `categorii_produse` (
  `id` int(10) NOT NULL,
  `nume` varchar(128) NOT NULL DEFAULT 'fara nume'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `categorii_produse`
--

INSERT INTO `categorii_produse` (`id`, `nume`) VALUES
(1, 'Telefoane'),
(2, 'Electrocasnice'),
(3, 'Calculatoare'),
(4, 'Televizore'),
(5, 'Auto');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `clienti`
--

CREATE TABLE `clienti` (
  `id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT 'fara nume',
  `password` varchar(128) NOT NULL DEFAULT 'fara prenume',
  `gender` char(1) NOT NULL,
  `email` varchar(128) NOT NULL DEFAULT 'fara email',
  `phoneCode` varchar(128) NOT NULL DEFAULT 'fara parola',
  `phone` varchar(128) NOT NULL DEFAULT 'fara numar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `clienti`
--

INSERT INTO `clienti` (`id`, `username`, `password`, `gender`, `email`, `phoneCode`, `phone`) VALUES
(1, 'asd', 'asda', 'm', 'asdasd@gmail.com', '072', '7815665'),
(2, 'test', 'parola', 'm', 'bla@bla.cl', '979', '123458798'),
(3, 'test', 'qqqq', 'm', 'bla@bla.cl2', '979', '123458798'),
(4, 'test', 'qqqq', 'm', 'bla@bla.cl2q', '979', '123458798'),
(5, 'asdd', '1233', 'f', 'a@gmail.com', '072', '12312312'),
(6, 'Elena', '123', 'f', 'elena@gmail.com', '072', '12312312');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comenzi`
--

CREATE TABLE `comenzi` (
  `id` int(10) NOT NULL,
  `clientID` int(10) NOT NULL,
  `listaID` int(10) NOT NULL,
  `magazinID` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `liste`
--

CREATE TABLE `liste` (
  `id` int(10) NOT NULL,
  `produsID1` int(10) NOT NULL,
  `produsID2` int(10) NOT NULL,
  `produsID3` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('BogdanStm', '12345');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `magazine`
--

CREATE TABLE `magazine` (
  `id` int(10) NOT NULL,
  `judet` varchar(128) NOT NULL DEFAULT 'fara judet',
  `oras` varchar(128) NOT NULL DEFAULT 'fara oras'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `magazine`
--

INSERT INTO `magazine` (`id`, `judet`, `oras`) VALUES
(1, 'Prahova', 'Ploiesti'),
(2, 'Prahova', 'Plopeni'),
(3, 'Prahova', 'Sinaia'),
(4, 'Ilfov', 'Buftea'),
(5, 'Ilfov', 'Pantelimon'),
(6, 'Dambovita', 'Targoviste'),
(7, 'Prahova', 'Blejoi'),
(8, 'Dambovita', 'Moreni'),
(9, 'Olt', 'Slatina'),
(10, 'Olt', 'Bals'),
(11, 'Vrancea', 'Focsani'),
(12, 'Hunedoara', 'Deva');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `produse`
--

CREATE TABLE `produse` (
  `id` int(10) NOT NULL,
  `nume_produs` varchar(128) NOT NULL DEFAULT 'fara nume',
  `pret` int(10) NOT NULL DEFAULT 0,
  `reducere` int(10) NOT NULL DEFAULT 0,
  `stoc` int(10) NOT NULL DEFAULT 0,
  `categorie_id` int(10) NOT NULL DEFAULT 0,
  `imagine` varchar(128) NOT NULL DEFAULT 'fara imagine',
  `rating` int(10) NOT NULL DEFAULT 0,
  `descriere` text NOT NULL DEFAULT 'fara descriere'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `produse`
--

INSERT INTO `produse` (`id`, `nume_produs`, `pret`, `reducere`, `stoc`, `categorie_id`, `imagine`, `rating`, `descriere`) VALUES
(1, 'Samsung S21 Ultra 256gb', 1135, 0, 21, 1, 'src/img/samsungs21.jpg', 4, 'Telefon praff'),
(2, 'Iphone XS Max 256gb', 955, 10, 41, 1, 'src/img/iphonexsmax.png', 5, 'fara descriere'),
(3, 'Samsung Note 9 128gb', 376, 12, 11, 1, 'src/img/samsungnote.png', 3, 'fara descriere'),
(8, 'Huawei p20 128gb', 350, 5, 100, 1, 'src/img/HuaweiP20_.jpg', 3, 'fara descriere'),
(9, 'OnePlus 9 Pro 256gb', 995, 7, 31, 1, 'src/img/oneplus.png', 5, 'fara descriere'),
(11, 'Masina de spalat rufe ELECTROLUX', 450, 12, 5, 2, 'src/img/rufe.jpg', 3, 'fara descriere'),
(12, 'Combina frigorifica LIEBHERR', 300, 2, 14, 2, 'src/img/frigider1.jpg', 4, 'fara descriere'),
(13, 'Aspirator cu sac KARCHER', 150, 40, 21, 2, 'src/img/aspirator.jpg', 5, 'Aspirator multifunctional Karcher WD 3, Aspirare umeda si uscata, 17 l, Furtun 2 m, 1000 W, Sac filtru din hartie, Functie de suflare, Galben/Negru'),
(14, 'Televizor Smart NanoCell LG', 355, 10, 5, 4, 'src/img/televizor.jpg', 3, 'fara descriere'),
(15, 'Sistem Desktop MYRIA v31', 813, 10, 9, 3, 'src/img/calculator.jpg', 5, 'fara descriere'),
(16, 'Kit Subwoofer auto', 200, 2, 53, 5, 'src/img/subwoofer.jpg', 5, 'fara descriere'),
(17, 'Sistem Gaming Predator', 3800, 5, 2, 3, 'src/img/calculator2.jpg', 5, 'fara descriere'),
(18, 'Sistem Gaming Lenovo', 862, 20, 5, 3, 'src/img/lenovo.jpg', 4, 'fara descriere'),
(19, 'Samsung TV LED ultra 4k', 500, 25, 19, 4, 'src/img/samsungtv.png', 3, 'fara descriere'),
(20, 'LG Smart TV UHD 4k', 470, 15, 16, 4, 'src/img/jg.jpg', 4, 'fara descriere'),
(21, 'Anvelope Vara SAETTA Touring', 70, 35, 41, 5, 'src/img/anvelopa.jpg', 5, 'fara descriere'),
(22, 'Kit Becuri LED H7', 50, 10, 61, 5, 'src/img/becuri.jpg', 3, 'fara descriere');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `angajati`
--
ALTER TABLE `angajati`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `magazinID` (`magazinID`);

--
-- Indexuri pentru tabele `categorii_produse`
--
ALTER TABLE `categorii_produse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexuri pentru tabele `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexuri pentru tabele `comenzi`
--
ALTER TABLE `comenzi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `clientID` (`clientID`),
  ADD KEY `listaID` (`listaID`),
  ADD KEY `magazinID` (`magazinID`);

--
-- Indexuri pentru tabele `liste`
--
ALTER TABLE `liste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produsID1` (`produsID1`),
  ADD KEY `produsID2` (`produsID2`),
  ADD KEY `produsID3` (`produsID3`);

--
-- Indexuri pentru tabele `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexuri pentru tabele `produse`
--
ALTER TABLE `produse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `angajati`
--
ALTER TABLE `angajati`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pentru tabele `categorii_produse`
--
ALTER TABLE `categorii_produse`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `comenzi`
--
ALTER TABLE `comenzi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `liste`
--
ALTER TABLE `liste`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `magazine`
--
ALTER TABLE `magazine`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pentru tabele `produse`
--
ALTER TABLE `produse`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `angajati`
--
ALTER TABLE `angajati`
  ADD CONSTRAINT `angajati_ibfk_1` FOREIGN KEY (`magazinID`) REFERENCES `magazine` (`id`);

--
-- Constrângeri pentru tabele `comenzi`
--
ALTER TABLE `comenzi`
  ADD CONSTRAINT `comenzi_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `clienti` (`id`),
  ADD CONSTRAINT `comenzi_ibfk_2` FOREIGN KEY (`magazinID`) REFERENCES `magazine` (`id`);

--
-- Constrângeri pentru tabele `liste`
--
ALTER TABLE `liste`
  ADD CONSTRAINT `liste_ibfk_1` FOREIGN KEY (`id`) REFERENCES `comenzi` (`listaID`),
  ADD CONSTRAINT `liste_ibfk_2` FOREIGN KEY (`produsID1`) REFERENCES `produse` (`id`),
  ADD CONSTRAINT `liste_ibfk_3` FOREIGN KEY (`produsID2`) REFERENCES `produse` (`id`),
  ADD CONSTRAINT `liste_ibfk_4` FOREIGN KEY (`produsID3`) REFERENCES `produse` (`id`);

--
-- Constrângeri pentru tabele `produse`
--
ALTER TABLE `produse`
  ADD CONSTRAINT `produse_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorii_produse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
