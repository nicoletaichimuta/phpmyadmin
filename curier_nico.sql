drop database if exists curier;

create database curier;

use curier;



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


create table masini(id_masina int(11) not null auto_increment primary key,
marca varchar(10) not null,
data_inmanarii date not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------
insert INTO masini (id_masina, marca, data_inmanarii) VALUES
(1, 'opel','2000-11-23'),
(2, 'opel','2000-11-23'),
(3, 'opel','2000-11-23'),
(4, 'opel','2000-11-23'),
(5, 'opel','2000-11-23');

CREATE TABLE angajati (
  id_angajat int(11) not null auto_increment primary key,
  Nume_angajat varchar(30) NOT NULL,
  prenume_angajat varchar(30) NOT NULL,
  telefon int(10) NOT NULL,
  id_masina_a int(11) not null,
  FOREIGN KEY(`id_masina_a`) REFERENCES `masini` (`id_masina`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




INSERT INTO angajati (id_angajat, nume_angajat, prenume_angajat,telefon,id_masina_a) VALUES
(1, 'Popescu','Alina',0765475844,1),
(2, 'Tudorica','Vlad',0723847397,2),
(3, 'Marin','Ioana',0736453874,3),
(4, 'Popa','Mircea',0857463722,4),
(5, 'Duda','Florin', 073526473,5);



--
-- Table structure for table `clienti`
create table adresa(id_adresa int(11) NOT NULL auto_increment primary key,
judet varchar(12) not null,
strada varchar(30) not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO adresa(id_adresa, judet, strada) VALUES
(1,'brasov','nicolae grigorescu nr.2'),
(2,'bucuresti','nicolae grigorescu nr.2'),
(3,'bucuresti','nicolae grigorescu nr.2'),
(4,'constanta','nicolae grigorescu nr.2'),
(5,'iasi','nicolae grigorescu nr.2');
--

CREATE TABLE clienti (
  Nume_client varchar(30) NOT NULL,
  Prenume_client varchar(30) NOT NULL,
  CNP varchar(13) NOT NULL primary key,
  id_adresa_c int(11) NOT NULL,
  Email varchar(30) NOT NULL,
  Telefon int(10) NOT NULL,
  FOREIGN KEY(`id_adresa_c`) REFERENCES `adresa` (`id_adresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO clienti(Nume_client, Prenume_client,  `CNP`, id_adresa_c, `Email`, `Telefon`) VALUES
( 'Gig',' Marina', '1294950675847' , 1, 'gigm@gmail.com', 0754789852),
('Robert','Gorgota', '1847562974884', 2, 'robig@gmail.com', 0722572787),
( 'Farfuridi ','Ion', '1883726546547', 3, 'farf666@gmail.com', 0722572787),
('Daniel ','Militaru', '1765774839209', 4, 'dan@ymail.com', 0778745254),
('Vladimir ','Putin', '1847566578909', 5, 'vladimir.putin@yahoo.com', 0787256578);

-- --------------------------------------------------------

--
-- Table structure for table `detaliitranzactii`

create table stare (id_stare int(11) NOT NULL auto_increment primary key,
stare_c enum('nelivrata','livrata')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into stare( id_stare, stare_c) values
(1,'nelivrata'),
(2,'livrata'),
(3,'livrata'),
(4,'livrata'),
(5,'nelivrata');

create table factura(id_factura int(13) NOT NULL auto_increment primary key,
data_f datetime NOT NULL,
total float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



insert into factura(id_factura, data_f, total) values
(1,'2017-01-23 12:32:01',1234),
(2,'2017-01-23 12:32:01',124),
(3,'2017-01-23 12:32:01',423523),
(4,'2017-01-23 12:32:01',2342),
(5,'2017-01-23 12:32:01',23423),
(6,'2017-01-23 12:32:01',2345);

create table sedii(id_sediu int(11) NOT NULL auto_increment primary key,
judet varchar(12) not null,
contact int(10) not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO sedii(id_sediu, judet,contact) VALUES
(1,'constanta',  0754789852),
(2,'bucuresti', 0722572787),
( 3,'iasi', 0722572787),
(4,'cluj', 0778745254),
(5,'brasov', 0787256578);


create table comanda (id_comanda int(11) NOT NULL auto_increment primary key,
  CNP_c varchar(13)  NOT NULL,
  id_stare_c int(11) not null,
  id_factura_c int(13) not null,
   FOREIGN KEY(`id_stare_c`) REFERENCES `stare` (`id_stare`) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(`CNP_c`) REFERENCES `clienti` (`CNP`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(`id_factura_c`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



insert into comanda( id_comanda, CNP_c, id_stare_c,id_factura_c) values
(1, 1294950675847,1,3),
(2, 1847562974884,2,2),
(3, 1883726546547,3,4),
(4, 1765774839209,4,5),
(5, 1847566578909,5,1);



CREATE TABLE angajare(
id_sediu_munca int (11)  NOT NULL,
id_angajat_munca int (11)  NOT NULL,
FOREIGN KEY (id_angajat_munca) REFERENCES angajati (id_angajat) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_sediu_munca) REFERENCES sedii (id_sediu) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into angajare (id_sediu_munca, id_angajat_munca) values
(1,1),
(2,2),
(3,3),
(4,3),
(4,5),
(5,4);



CREATE TABLE `login` (
  `id_login` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`) VALUES
(1, 'angajat', 'angajat'),
(2, 'client', 'client');







/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
