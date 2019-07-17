This is my WAP final project. It's a shopping cart.
The techniques are applied in: HTML + CSS + Jquery + Servlet
- Filter (/admin /login /checkout.jsp)
- Ajax (add product /admin)
- Session & cookie (user logged in)
- Connect to Database MySQL


Database script:

CREATE DATABASE `mum` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prdName` varchar(100) NOT NULL,
  `prdImg` varchar(100) DEFAULT NULL,
  `prdPrice` decimal(4,0) DEFAULT NULL,
  `prdDesc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(155) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
