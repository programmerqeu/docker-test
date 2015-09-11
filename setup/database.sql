CREATE DATABASE  IF NOT EXISTS `docker` DEFAULT CHARSET=utf8;

USE `docker`;

--
-- Table structure for table `Lehrveranstaltung`
--

DROP TABLE IF EXISTS `docker`;
CREATE TABLE `docker` (
  `id` varchar(16) NOT NULL,
  `container` varchar(16) DEFAULT NULL,
  `ship` int(11) DEFAULT NULL,
  `port` varchar(256) DEFAULT NULL,
  `time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`LVID`)
);

--
-- Dumping data for table `docker`
--

LOCK TABLES `docker` WRITE;
INSERT INTO `docker` VALUES
  ('SAP','1-1.10',5,'Lorem ipsum','Mo: 12:00-13:30'),
  ('SPD','18-1.18',5,'Lorem ipsum','Mo: 10:00-11:30'),
  ('SED','18-1.18',5,'Lorem ipsum','Di: 10:00-11:30'),
  ('LPD','18-1.18',5,'Lorem ipsum','Di: 12:00-13:30'),
  ('LGP','1-1.09',1,'Lorem ipsum','Fr: 10:00-11:30'),
  ('MSD','18-1.17',1,'Lorem ipsum','Mi: 14:30-16:00'),
  ('MSN','18-1.17',1,'Lorem ipsum','Mi: 16:15-17:30'),
  ('MNN','18-0.01',5,'Lorem ipsum','Fr: 12:00-13:30'),
  ('OPA','18-0.01',5,'Lorem ipsum','Fr: 14:00-15:30');
UNLOCK TABLES;
