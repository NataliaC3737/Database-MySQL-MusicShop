-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tienda_musica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda_musica` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema tienda_musica
-- -----------------------------------------------------
USE `tienda_musica` ;

-- -----------------------------------------------------
-- Table `tienda_musica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`proveedor` (
  `idproveedor` VARCHAR(10) NOT NULL,
  `proveedor` VARCHAR(45) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`compra` (
  `idcompra` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` VARCHAR(10) NOT NULL,
  `fecha_compra` DATE NOT NULL,
  INDEX `FK_proveedor_compras_idx` (`id_proveedor` ASC) VISIBLE,
  PRIMARY KEY (`idcompra`),
  CONSTRAINT `FK_proveedor_compras`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `tienda_musica`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`producto` (
  `idproducto` VARCHAR(10) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio_producto` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `fecha_venta` DATE NOT NULL,
  INDEX `FK_cliente_venta_idx` (`id_cliente` ASC) VISIBLE,
  PRIMARY KEY (`idventa`),
  CONSTRAINT `FK_cliente_venta`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `tienda_musica`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`detalle_venta` (
  `iddetalle_venta` INT NOT NULL,
  `id_producto` VARCHAR(10) NOT NULL,
  `id_venta` INT NOT NULL,
  `cantidad_venta` INT NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  INDEX `PK_producto_venta_idx` (`id_producto` ASC) VISIBLE,
  INDEX `PK_venta_detalleventa_idx` (`id_venta` ASC) VISIBLE,
  CONSTRAINT `PK_producto_detalleventa`
    FOREIGN KEY (`id_producto`)
    REFERENCES `tienda_musica`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PK_venta_detalleventa`
    FOREIGN KEY (`id_venta`)
    REFERENCES `tienda_musica`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_musica`.`detalle_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_musica`.`detalle_compra` (
  `iddetalle_compra` INT NOT NULL AUTO_INCREMENT,
  `id_producto` VARCHAR(10) NOT NULL,
  `id_compra` INT NOT NULL,
  `cantidad_compra` INT NOT NULL,
  `precio_compra` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`iddetalle_compra`),
  INDEX `FK_producto_detallecompra_idx` (`id_producto` ASC) VISIBLE,
  INDEX `FK_compra_detallecompra_idx` (`id_compra` ASC) VISIBLE,
  CONSTRAINT `FK_producto_detallecompra`
    FOREIGN KEY (`id_producto`)
    REFERENCES `tienda_musica`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_compra_detallecompra`
    FOREIGN KEY (`id_compra`)
    REFERENCES `tienda_musica`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Insert `cliente`
-- -----------------------------------------------------

INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (1,'Carolina ','Amat','663192378');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (2,'Carla ','de Baquero','685036754');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (3,'Narciso ','Cortina Macías','613790945');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (4,'Ibán ','Vega','626287719');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (5,'Alicia ','de Simó','622531036');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (6,'Celestina Paloma','Bellido Morata','662304149');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (7,'Alondra Alberto','Carretero','624918932');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (8,'Florina Nidia','Jáuregui Raya','668921662');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (9,'José Antonio','Ayala Salas','642604087');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (10,'Inmaculada','Giménez','649405951');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (11,'Leyre ','Moliner Bauzà','675533888');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (12,'Rosario ','Torrents','621282286');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (13,'Dafne ','Pino Vicente','656964205');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (14,'Amaro ','Viñas Rozas','603235493');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (15,'José Luis','Baró Jaén','696990748');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (16,'Nuria ','Contreras Gascón','650732915');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (17,'Alcides','del Peña','672799667');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (18,'Ismael ','Barón Soria','635951190');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (19,'Vito Arsenio','Cordero Gallardo','636443789');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (20,'Candelas ','Piña Llorente','601854838');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (21,'Adoración ',' Aguilera Villalobos','695376594');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (22,'Pío','Adadia Arteaga','611115883');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (23,'Marcia ','Azorin Pinedo','612315487');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (24,'Margarita','Guijarro Larrañaga','657177399');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (25,'Mario ','Olmedo Infante','657350066');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (26,'Concepción ','Villalonga Castro','653681546');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (27,'Juan Manuel','Acosta Hierro','653805393');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (28,'Albert ','Soto Bárcena','653365071');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (29,'Jerónimo ','Ibañez Blanch','606687784');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (30,'Eloy ','Carlos Fonseca','663534345');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (31,'Xiomara ','Río','641079650');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (32,'Gabino ','Heras Pont','663967530');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (33,'Sebas ','Barceló Carvajal','667653958');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (34,'Dorita ','del Estevez','607573689');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (35,'Ciriaco ','Gascón Diaz','617608242');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (36,'Trinidad ','Galván Pombo','688323803');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (37,'Sigfrido ','del Figueras','605664929');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (38,'Irene ','Reguera Donaire','634997185');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (39,'Eva María','Macías Alfonso','620978655');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (40,'Rafael','Cañas Bayona','616890124');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (41,'Ángela ','Marqués Llanos','651787395');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (42,'Jessica ','Carreño Quirós','600088115');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (43,'María Belén','de Ayala','647035717');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (44,'Hipólito ','Camacho Mariño','639756037');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (45,'Paula ','Blanes Arribas','690944790');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (46,'Cristóbal ','Arco','617428048');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (47,'Roldán ','Ferreras Hurtado','617303847');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (48,'Efraín ','Robles','615240468');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (49,'Lupita ','Rocamora Giner','647116439');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (50,'Cecilia África','Ferrero Marquez','684896619');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (51,'Edelmiro ','Vilanova Barrena','610303184');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (52,'Pepe ','Pulido Espejo','627183622');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (53,'Lucho ','de Gimeno','620177715');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (54,'Ricardo ','Tirado Ferrando','634342040');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (55,'Alejandro ','Sánchez Martín','669927797');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (56,'Amador ','Novoa Reig','626869221');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (57,'Dora Esperanza','Garcia Tovar','627183622');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (58,'Bibiana ','Amador Aguirre','669338538');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (59,'Adela ','Mariscal Sosa','644889878');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (60,'Carmina ','Ballesteros Solís','651390166');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (61,'César ','Vendrell Balaguer','699143505');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (62,'Armando ','Carrillo Barrena','637709249');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (63,'María Teresa ','Arana Torrens','693520204');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (64,'Rafaela ','Alonso','622788190');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (65,'Brunilda ','Báez Marín','605423502');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (66,'Roberto','Azcona Azcona','609852796');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (67,'Azahara ','Osorio Sanmiguel','678326903');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (68,'Anastasia ','Egea Correa','621258037');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (69,'Luz ','Madrigal Bravo','655940535');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (70,'Néstor','Camino Gutierrez','694208029');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (71,'Amador ','Fernández Peiró','687202772');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (72,'Narcisa ','Canals Hierro','607088233');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (73,'Jeremías ','Sanz Miranda','681474019');
INSERT INTO `cliente` (`idcliente`,`nombre`,`apellidos`,`telefono`) VALUES (74,'Maite ','Seco Benet','654556182');

-- -----------------------------------------------------
-- Insert `proveedor`
-- -----------------------------------------------------

INSERT INTO `proveedor` (`idproveedor`,`proveedor`,`correo_electronico`,`telefono`,`direccion`,`ciudad`,`codigo_postal`) VALUES ('prov_001','Top Music',' topmusic.contact@gmail.com','925895783','Calle Actor Paco Hernandez, 3','Alicante',3011);
INSERT INTO `proveedor` (`idproveedor`,`proveedor`,`correo_electronico`,`telefono`,`direccion`,`ciudad`,`codigo_postal`) VALUES ('prov_002','Hermes Music Club','hermesmusicclub@gmail.com','933902832','	Calle Alcalde de Zalamea, 47','Madrid',28931);
INSERT INTO `proveedor` (`idproveedor`,`proveedor`,`correo_electronico`,`telefono`,`direccion`,`ciudad`,`codigo_postal`) VALUES ('prov_003','DrumCity','drumcitymurcia@gmail.com','992458085','Av. Arquitecto Miguel Ángel Beloqui, 10','Murcia',30010);

-- -----------------------------------------------------
-- Insert `producto`
-- -----------------------------------------------------

INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_001','CONTROL 28-1L PR',1,'Altavoz','JBL',1343.65);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_002','colgante C65P/T',5,'Altavoz','JBL',465.24);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_003','CONTROL 25-1L PR',5,'Altavoz','JBL',750.87);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_004','CONTROL 28-1L-WH PR',3,'Altavoz','JBL',1278.75);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_005','CONTROL 5>PAIR',5,'Altavoz','JBL',708.24);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_006','CSS8008',5,'Altavoz','JBL',47.93);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_007','J104SET',3,'Altavoz','JBL',336.57);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_008','JRX212',5,'Altavoz','JBL',524.87);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_009','JRX215',4,'Altavoz','JBL',627.50);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_010','JRX225',5,'Altavoz','JBL',925.95);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_011','PortÃ¡til IRX108BT',4,'Altavoz','JBL',890.87);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_012','PRX418S',4,'Altavoz','JBL',1480.62);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_013','PRX425',1,'Altavoz','JBL',1484.40);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_014','PRX812W',5,'Altavoz','JBL',2001.71);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_015','PRX818XLFW',4,'Altavoz','JBL',2602.41);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_016','PRX825W',4,'Altavoz','JBL',2873.54);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_017','PRX835W',3,'Altavoz','JBL',2873.54);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_018','SRX812P',5,'Altavoz','JBL',2719.50);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_019','SRX815P',3,'Altavoz','JBL',3398.70);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_020','SRX835P',1,'Altavoz','JBL',3816.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_021','ADIO-AIR-GT',1,'Amplificador','VOX',646.37);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_022','VGH-AC30',1,'Amplificador De Bajo','VOX',226.53);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_023','PATHFINDERBASS10',2,'Amplificador De Bajo','VOX',253.34);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_024','VX50-BA',3,'Amplificador De Bajo','VOX',541.41);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_025','AC10C1',3,'Amplificador De Guitarra','VOX',1522.67);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_026','AC15C1',5,'Amplificador De Guitarra','VOX',2208.68);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_027','AC15C1X',3,'Amplificador De Guitarra','VOX',2245.32);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_028','AV15',5,'Amplificador De Guitarra','VOX',507.27);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_029','AV30',4,'Amplificador De Guitarra','VOX',700.82);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_030','CAMBRIDGE50',4,'Amplificador De Guitarra','VOX',703.08);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_031','MINI5-RM-IV',4,'Amplificador De Guitarra','VOX',339.06);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_032','AudÃ­fonos VGH-ROCK',1,'Amplificador De Guitarra','VOX',226.80);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_033','VT100X',2,'Amplificador De Guitarra','VOX',1485.17);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_034','VT20X',2,'Amplificador De Guitarra','VOX',673.98);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_035','VT40X',4,'Amplificador De Guitarra','VOX',844.46);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_036','VX II',1,'Amplificador De Guitarra','VOX',299.00);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_037','VX15-GT',5,'Amplificador De Guitarra','VOX',408.24);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_038','VX50-GTV',2,'Amplificador De Guitarra','VOX',531.84);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_039','AC30C2',1,'Amplificador De Guitarra','VOX',2440.37);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_040','AV60',5,'Amplificador De Guitarra','VOX',807.03);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_041','PATHFINDER10',3,'Amplificador De Guitarra','VOX',232.37);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_042','Clase A VBC-13',6,'Cable de instrumento','VOX',56.76);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_043','VCC-90RD',1,'Cable de instrumento','VOX',65.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_044','MS-2 C MARSHALL',10,'Micro Amplificador','VOX',90.45);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_045','AC30',2,'Micro Amplificador','VOX',109.37);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_046','CLASSIC ROCK',9,'Micro amplificador','VOX',109.37);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_047','METAL',1,'Micro amplificador','VOX',118.83);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_048','ASTURIA-CDN',2,'Guitarra acÃºstica','Babilon',235.02);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_049','EA 12 PRADERA',1,'Guitarra acÃºstica','Babilon',235.02);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_050','GHOST-LB',1,'Guitarra elÃ©ctrica','Babilon',266.54);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_051','NIGHTHAWK-WR',4,'Guitarra elÃ©ctrica','Babilon',280.92);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_052','ARROWHEAD-BK',1,'Guitarra elÃ©ctrica','Babilon',328.25);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_053','Babilon BLAZE- SB',1,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_054','BEG-462 BK',3,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_055','BEG-462 IV',4,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_056','BEG-462 MBL',5,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_057','BEG-462 MRD',3,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_058','BEG-462 SB',1,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_059','BLADE-BL',4,'Guitarra elÃ©ctrica','Babilon',225.27);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_060','BLADE-RD',1,'Guitarra elÃ©ctrica','Babilon',227.54);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_061','BLAZE- BK',4,'Guitarra elÃ©ctrica','Babilon',182.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_062','BLAZE- LBL',3,'Guitarra elÃ©ctrica','Babilon',182.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_063','BLAZE- MBL',3,'Guitarra elÃ©ctrica','Babilon',182.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_064','BLAZE- MGR',4,'Guitarra elÃ©ctrica','Babilon',163.94);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_065','BLAZE- MRD',4,'Guitarra elÃ©ctrica','Babilon',182.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_066','EARTHQUAKE-BK',1,'Guitarra elÃ©ctrica','Babilon',369.51);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_067','EARTHQUAKE-CRDS',3,'Guitarra elÃ©ctrica','Babilon',369.51);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_068','EARTHQUAKE-CSB',2,'Guitarra elÃ©ctrica','Babilon',369.51);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_069','EPIC â€“ BK',2,'Guitarra elÃ©ctrica','Babilon',182.10);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_070','TOURMAN BASS-BK',5,'Bajo elÃ©ctrico','Babilon',237.38);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_071','TOURMAN BASS-SB',2,'Bajo elÃ©ctrico','Babilon',237.38);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_072','1A (0009) BEG-009 PACK',3,'Cuerdas  para guitarra','Babilon',4.92);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_073','1A (0011) BAG-011 PACK',4,'Cuerdas  para guitarra','Babilon',4.92);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_074','1A (0028) BCG-028 PACK',2,'Cuerdas  para guitarra','Babilon',4.92);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_075','2A (0011) BEG-011 PACK',18,'Cuerdas  para guitarra','Babilon',5.69);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_076','(030-125) PEB54/6S',9,'Cuerdas para bajo','Babilon',26.13);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_077','(040-100) BEB50/4S',0,'Cuerdas para bajo','Babilon',10.98);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_078','(040-125) EEB52/5S',12,'Cuerdas para bajo','Babilon',12.50);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_079','(045-100) MEB50/4S',1,'Cuerdas para bajo','Babilon',12.50);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_080','5A DR-5A',19,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_081','5B DR-5B',17,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_082','7A DR-7A',20,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_083','2B DR-2BN',14,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_084','5A DR-5AN',14,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_085','5B DR-5BN',17,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_086','7A DR-7AN',10,'Baqueta','DrumCo',2.66);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_087','COPPER-BL',1,'BaterÃ­a electrÃ³nica','DrumCo',827.67);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_088','COPPER-YL',2,'BaterÃ­a electrÃ³nica','DrumCo',827.67);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_089','MERCURY-GY',1,'BaterÃ­a electrÃ³nica','DrumCo',1185.30);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_090','MERCURY-RD',0,'BaterÃ­a electrÃ³nica','DrumCo',1185.30);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_091','TITANIUM',2,'BaterÃ­a electrÃ³nica','DrumCo',1638.32);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_092','OBELIX-HC-BK',0,'BaterÃ­a acÃºstica','DrumCo',685.76);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_093','OBELIX-HC-RD',1,'BaterÃ­a acÃºstica','DrumCo',685.76);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_094','OBELIX-JR-BK',0,'BaterÃ­a acÃºstica','DrumCo',324.33);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_095','OBELIX-JR-BL',2,'BaterÃ­a acÃºstica','DrumCo',324.33);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_096','OBELIX-JR-RD',1,'BaterÃ­a acÃºstica','DrumCo',324.33);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_097',' OBELIX-JR-WR',2,'BaterÃ­a acÃºstica','DrumCo',324.33);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_098','OBELIX-HB-BK',0,'BaterÃ­a acÃºstica','DrumCo',681.21);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_099','OBELIX-HB-BL',2,'BaterÃ­a acÃºstica','DrumCo',681.21);
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_100','OBELIX-HB-RD',2,'BaterÃ­a acÃºstica','DrumCo',681.21);

-- -----------------------------------------------------
-- Insert `compra`
-- -----------------------------------------------------

INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (1,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (2,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (3,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (4,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (5,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (6,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (7,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (8,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (9,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (10,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (11,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (12,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (13,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (14,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (15,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (16,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (17,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (18,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (19,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (20,'prov_001','2023-01-05');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (21,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (22,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (23,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (24,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (25,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (26,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (27,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (28,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (29,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (30,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (31,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (32,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (33,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (34,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (35,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (36,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (37,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (38,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (39,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (40,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (41,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (42,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (43,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (44,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (45,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (46,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (47,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (48,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (49,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (50,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (51,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (52,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (53,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (54,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (55,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (56,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (57,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (58,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (59,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (60,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (61,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (62,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (63,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (64,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (65,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (66,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (67,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (68,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (69,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (70,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (71,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (72,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (73,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (74,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (75,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (76,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (77,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (78,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (79,'prov_002','2023-01-02');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (80,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (81,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (82,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (83,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (84,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (85,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (86,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (87,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (88,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (89,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (90,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (91,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (92,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (93,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (94,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (95,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (96,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (97,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (98,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (99,'prov_003','2023-01-04');
INSERT INTO `compra` (`idcompra`,`id_proveedor`,`fecha_compra`) VALUES (100,'prov_003','2023-01-04');

-- -----------------------------------------------------
-- Insert `detalle_compra`
-- -----------------------------------------------------

INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (1,'prod_001',1,1,335.91);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (2,'prod_002',2,1,116.31);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (3,'prod_003',3,1,187.72);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (4,'prod_004',4,1,319.69);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (5,'prod_005',5,1,177.06);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (6,'prod_006',6,1,11.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (7,'prod_007',7,1,84.14);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (8,'prod_008',8,1,131.22);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (9,'prod_009',9,1,156.87);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (10,'prod_010',10,1,231.49);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (11,'prod_011',11,1,222.72);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (12,'prod_012',12,1,370.16);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (13,'prod_013',13,1,371.10);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (14,'prod_014',14,1,500.43);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (15,'prod_015',15,1,650.60);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (16,'prod_016',16,1,718.38);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (17,'prod_017',17,1,718.38);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (18,'prod_018',18,1,679.88);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (19,'prod_019',19,1,849.68);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (20,'prod_020',20,1,954.17);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (21,'prod_021',21,1,161.59);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (22,'prod_022',22,1,56.63);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (23,'prod_023',23,1,63.33);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (24,'prod_024',24,1,135.35);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (25,'prod_025',25,1,380.67);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (26,'prod_026',26,1,552.17);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (27,'prod_027',27,1,561.33);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (28,'prod_028',28,1,126.82);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (29,'prod_029',29,1,175.20);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (30,'prod_030',30,1,175.77);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (31,'prod_031',31,1,84.77);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (32,'prod_032',32,1,56.70);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (33,'prod_033',33,1,371.29);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (34,'prod_034',34,1,168.50);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (35,'prod_035',35,1,211.11);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (36,'prod_036',36,1,74.75);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (37,'prod_037',37,1,102.06);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (38,'prod_038',38,1,132.96);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (39,'prod_039',39,1,610.09);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (40,'prod_040',40,1,201.76);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (41,'prod_041',41,1,58.09);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (42,'prod_042',42,10,14.19);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (43,'prod_043',43,10,16.28);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (44,'prod_044',44,1,22.61);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (45,'prod_045',45,1,27.34);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (46,'prod_046',46,1,27.34);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (47,'prod_047',47,1,29.71);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (48,'prod_048',48,1,58.76);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (49,'prod_049',49,1,58.76);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (50,'prod_050',50,1,66.63);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (51,'prod_051',51,1,70.23);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (52,'prod_052',52,1,82.06);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (53,'prod_053',53,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (54,'prod_054',54,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (55,'prod_055',55,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (56,'prod_056',56,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (57,'prod_057',57,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (58,'prod_058',58,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (59,'prod_059',59,1,56.32);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (60,'prod_060',60,1,56.88);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (61,'prod_061',61,1,45.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (62,'prod_062',62,1,45.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (63,'prod_063',63,1,45.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (64,'prod_064',64,1,40.98);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (65,'prod_065',65,1,45.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (66,'prod_066',66,1,92.38);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (67,'prod_067',67,1,92.38);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (68,'prod_068',68,1,92.38);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (69,'prod_069',69,1,45.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (70,'prod_070',70,1,59.34);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (71,'prod_071',71,1,59.34);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (72,'prod_072',72,10,1.23);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (73,'prod_073',73,10,1.23);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (74,'prod_074',74,10,1.23);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (75,'prod_075',75,10,1.42);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (76,'prod_076',76,10,6.53);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (77,'prod_077',77,10,2.75);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (78,'prod_078',78,10,3.12);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (79,'prod_079',79,10,3.12);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (80,'prod_080',80,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (81,'prod_081',81,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (82,'prod_082',82,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (83,'prod_083',83,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (84,'prod_084',84,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (85,'prod_085',85,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (86,'prod_086',86,10,0.66);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (87,'prod_087',87,1,206.92);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (88,'prod_088',88,1,206.92);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (89,'prod_089',89,1,296.33);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (90,'prod_090',90,1,296.33);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (91,'prod_091',91,1,409.58);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (92,'prod_092',92,1,171.44);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (93,'prod_093',93,1,171.44);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (94,'prod_094',94,1,81.08);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (95,'prod_095',95,1,81.08);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (96,'prod_096',96,1,81.08);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (97,'prod_097',97,1,81.08);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (98,'prod_098',98,1,170.30);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (99,'prod_099',99,1,170.30);
INSERT INTO `detalle_compra` (`iddetalle_compra`,`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES (100,'prod_100',100,1,170.30);

-- -----------------------------------------------------
-- Insert `venta`
-- -----------------------------------------------------

INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (1,1,'2023-01-01');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (2,2,'2023-01-01');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (3,3,'2023-01-01');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (4,4,'2023-01-02');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (5,5,'2023-01-02');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (6,6,'2023-01-02');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (7,7,'2023-01-02');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (8,8,'2023-01-03');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (9,9,'2023-01-03');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (10,10,'2023-01-03');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (11,11,'2023-01-04');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (12,3,'2023-01-04');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (13,12,'2023-01-04');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (14,13,'2023-01-04');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (15,13,'2023-01-04');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (16,14,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (17,15,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (18,16,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (19,17,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (20,18,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (21,18,'2023-01-05');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (22,19,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (23,10,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (24,20,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (25,21,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (26,22,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (27,23,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (28,24,'2023-01-06');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (29,24,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (30,24,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (31,24,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (32,25,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (33,26,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (34,27,'2023-01-09');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (35,10,'2023-01-10');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (36,28,'2023-01-10');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (37,29,'2023-01-10');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (38,30,'2023-01-10');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (39,31,'2023-01-11');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (40,32,'2023-01-11');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (41,33,'2023-01-11');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (42,34,'2023-01-12');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (43,9,'2023-01-12');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (44,35,'2023-01-12');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (45,36,'2023-01-12');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (46,37,'2023-01-13');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (47,38,'2023-01-13');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (48,16,'2023-01-13');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (49,39,'2023-01-16');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (50,40,'2023-01-16');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (51,41,'2023-01-16');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (52,42,'2023-01-16');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (53,43,'2023-01-17');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (54,44,'2023-01-17');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (55,45,'2023-01-18');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (56,46,'2023-01-18');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (57,47,'2023-01-18');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (58,48,'2023-01-18');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (59,45,'2023-01-19');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (60,49,'2023-01-19');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (61,50,'2023-01-19');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (62,51,'2023-01-20');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (63,52,'2023-01-20');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (64,53,'2023-01-20');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (65,54,'2023-01-20');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (66,55,'2023-01-20');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (67,56,'2023-01-23');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (68,57,'2023-01-23');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (69,58,'2023-01-23');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (70,52,'2023-01-24');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (71,59,'2023-01-24');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (72,60,'2023-01-24');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (73,61,'2023-01-24');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (74,62,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (75,62,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (76,62,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (77,62,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (78,62,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (79,63,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (80,64,'2023-01-25');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (81,29,'2023-01-26');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (82,65,'2023-01-26');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (83,66,'2023-01-26');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (84,67,'2023-01-27');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (85,67,'2023-01-27');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (86,67,'2023-01-27');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (87,68,'2023-01-27');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (88,69,'2023-01-30');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (89,70,'2023-01-30');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (90,70,'2023-01-30');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (91,71,'2023-01-30');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (92,72,'2023-01-30');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (93,73,'2023-01-31');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (94,74,'2023-01-31');
INSERT INTO `venta` (`idventa`,`id_cliente`,`fecha_venta`) VALUES (95,32,'2023-01-31');

-- -----------------------------------------------------
-- Insert `detalle_venta`
-- -----------------------------------------------------

INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (1,'prod_003',1,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (2,'prod_048',2,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (3,'prod_056',3,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (4,'prod_081',4,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (5,'prod_049',5,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (6,'prod_077',6,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (7,'prod_073',7,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (8,'prod_070',8,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (9,'prod_081',9,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (10,'prod_060',10,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (11,'prod_015',11,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (12,'prod_074',12,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (13,'prod_011',13,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (14,'prod_095',14,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (15,'prod_081',15,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (16,'prod_079',16,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (17,'prod_005',17,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (18,'prod_022',18,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (19,'prod_010',19,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (20,'prod_088',20,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (21,'prod_084',21,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (22,'prod_016',22,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (23,'prod_035',23,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (24,'prod_007',24,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (25,'prod_054',25,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (26,'prod_036',26,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (27,'prod_062',27,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (28,'prod_064',28,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (29,'prod_082',29,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (30,'prod_094',30,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (31,'prod_043',31,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (32,'prod_029',32,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (33,'prod_031',33,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (34,'prod_051',34,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (35,'prod_045',35,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (36,'prod_049',36,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (37,'prod_069',37,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (38,'prod_010',38,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (39,'prod_080',39,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (40,'prod_099',40,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (41,'prod_088',41,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (42,'prod_009',42,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (43,'prod_082',43,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (44,'prod_007',44,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (45,'prod_084',45,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (46,'prod_045',46,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (47,'prod_093',47,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (48,'prod_042',48,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (49,'prod_016',49,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (50,'prod_083',50,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (51,'prod_067',51,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (52,'prod_032',52,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (53,'prod_086',53,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (54,'prod_037',54,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (55,'prod_049',55,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (56,'prod_100',56,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (57,'prod_056',57,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (58,'prod_011',58,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (59,'prod_073',59,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (60,'prod_032',60,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (61,'prod_072',61,3);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (62,'prod_047',62,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (63,'prod_077',63,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (64,'prod_072',64,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (65,'prod_018',65,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (66,'prod_056',66,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (67,'prod_006',67,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (68,'prod_082',68,4);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (69,'prod_081',69,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (70,'prod_022',70,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (71,'prod_033',71,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (72,'prod_047',72,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (73,'prod_018',73,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (74,'prod_063',74,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (75,'prod_071',75,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (76,'prod_024',76,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (77,'prod_033',77,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (78,'prod_042',78,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (79,'prod_033',79,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (80,'prod_050',80,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (81,'prod_042',81,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (82,'prod_017',82,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (83,'prod_095',83,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (84,'prod_097',84,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (85,'prod_073',85,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (86,'prod_082',86,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (87,'prod_043',87,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (88,'prod_078',88,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (89,'prod_046',89,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (90,'prod_075',90,2);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (91,'prod_022',91,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (92,'prod_005',92,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (93,'prod_016',93,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (94,'prod_013',94,1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`id_producto`,`id_venta`,`cantidad_venta`) VALUES (95,'prod_080',95,1);

-- -----------------------------------------------------
-- CREACION DE USUARIOS (SEGURIDAD DEL SISTEMA)
-- -----------------------------------------------------

CREATE USER 'ADMINISTRADOR'@'localhost' IDENTIFIED BY 'rqt14vM';

CREATE USER 'FINANCIERO'@'localhost' IDENTIFIED BY '134fjaG';

CREATE USER 'VENDEDOR'@'localhost' IDENTIFIED BY 'V6K62Bxc';

-- Otorgamiento de los permisos necesarios de los puestos generales a la base de datos. 

GRANT ALL PRIVILEGES ON tienda_musica.* TO 'ADMINISTRADOR'@'localhost'; -- TODOS LOS PRIVILEGIOS

GRANT INSERT, SELECT, UPDATE ON tienda_musica.* TO 'FINANCIERO'@'localhost'; -- LECTURA Y ESCRITURA

GRANT INSERT, SELECT, UPDATE ON tienda_musica.* TO 'VENDEDOR'@'localhost'; -- LECTURA Y ESCRITURA

