SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`userId` mediumint(9) NOT NULL,
	`username` varchar(10) COLLATE utf8_unicode_ci NOT NULL UNIQUE,
	`password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(500) COLLATE utf8_unicode_ci,
	`gender` varchar(100) COLLATE utf8_unicode_ci,
	`address` varchar(500) COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `totalCheeses`
--
DROP TABLE IF EXISTS `totalCheeses`;
CREATE TABLE `totalCheeses` (
  `cheeseId` mediumint(97) NOT NULL,
  `cheeseName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `cost` mediumint(97) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `invnum` mediumint(97) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `cart`
--
  -- `category` varchar(25) COLLATE utf8_unicode_ci DE
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartId` mediumint(97) NOT NULL,
  `userId` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `Cart Items`
--
DROP TABLE IF EXISTS `cartItems`;
CREATE TABLE `cartItems` (
  `cartItemId` mediumint(97) NOT NULL,
  `cartId` mediumint(97) NOT NULL,
  `productId` mediumint(97) NOT NULL,
  `quantity` mediumint(97) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --
-- -- Insertion for table `users`
-- --
INSERT INTO `users` (`userId`, `username`, `password`, `email`, `gender`, `address`) VALUES
(1, 'roob', 'roob', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(2, 'mytzy', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(3, 'miguel', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(4, 'gerard', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(5, 'kim', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(6, 'angel', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(7, 'yeesus', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(8, 'chuy', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(9, 'chu', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(10, 'caas', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(11, 'humphrey', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(12, 'jenjen', 'mytzy', 'email@gmail.com', 'F', '123 Address Dr. Salinas CA 93906'),
(13, 'theobald', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(14, 'trinh', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(15, 'escobar', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(16, 'mizel', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(17, 'doug', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(18, 'dimma', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(19, 'dome', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906'),
(20, 'bruce', 'mytzy', 'email@gmail.com', 'M', '123 Address Dr. Salinas CA 93906');

--
-- Insertion for table `totalCheeses`
--
INSERT INTO `totalCheeses` (`cheeseId`, `cheeseName`, `cost`, `category`, `image`, `description`, `invnum`) VALUES
(1,'Mozzarella', 40, 'Melt', 'https://upload.wikimedia.org/wikipedia/commons/5/57/Mozzarella_di_bufala3.jpg', 'Stretch goo to put on pizza and other stuff', 10),
(2,'Cheddar Cheese', 35, 'Flavor', 'https://pinconningcheese.com/wp-content/uploads/Mild-Cheddar-cropped.jpg', 'Standard Yellow flavorful cheese you can put in your sandwich', 15),
(3,'Cheese Wheel', 889, 'Parmesan', 'https://images.costco-static.com/ImageDelivery/imageService?profileId=12026540&itemId=845390-847&recipeName=680', 'A cheese wheel is a wheel or block of cured cheese that is typically still covered in a protective rind. Most cheeses are made in the shape of wheels, with cheese shops cutting out wedges when clients request a particular cheese.', 5),
(4,'Goronzola', 15, 'Topping', 'https://www.welcometothetable.coop/sites/default/files/wp-content/uploads/2011/06/Gorgonzola1_0.jpg', 'It can be buttery or firm, crumbly and quite salty, with a "bite" from its blue veining.', 10),
(5,'Kraft Easy Cheese Spray', 20, 'Spray','https://www.grocery.com/store/image/cache/catalog/kraft/kraft-easy-cheese-spray-can-variety-pack-of-4-shar-2-500x500.jpg', 'Cheese in a spray can :D', 12),
(6,'Bleu Cheese', 15, 'Topping', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bleu_de_Gex.jpg/1200px-Bleu_de_Gex.jpg', 'Stinky, very stinky.', 300);


ALTER TABLE `totalCheeses`
  ADD PRIMARY KEY (`cheeseId`);
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`);
  
ALTER TABLE `totalCheeses`
  MODIFY `cheeseId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `users`
  MODIFY `userId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `cart`
  MODIFY `cartId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
COMMIT;