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
	`password` varchar(500) COLLATE utf8_unicode_ci NOT NULL
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
  `cartId` mediumint(97) NOT  NOT NULL,
  `userId` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `Cart Items`
--
DROP TABLE IF EXISTS `cartItems`;
CREATE TABLE `cartItem` (
  `cartItemId` mediumint(97) NOT NULL,
  `cartId` mediumint(97) NOT NULL,
  `productId` mediumint(97) NOT NULL,
  `quantity` mediumint(97) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --
-- -- Insertion for table `users`
-- --
INSERT INTO `users` (`userId`, `username`, `password`) VALUES
(1, 'roob', 'roob'),
(2, 'mytzy', 'mytzy'),
(3, 'miguel', 'mytzy'),
(4, 'gerard', 'mytzy'),
(5, 'kim', 'mytzy'),
(6, 'angel', 'mytzy'),
(7, 'yeesus', 'mytzy'),
(8, 'chuy', 'mytzy'),
(9, 'chu', 'mytzy'),
(10, 'caas', 'mytzy'),
(11, 'humphrey', 'mytzy'),
(12, 'jenjen', 'mytzy'),
(13, 'theobald', 'mytzy'),
(14, 'trinh', 'mytzy'),
(15, 'escobar', 'mytzy'),
(16, 'mizel', 'mytzy'),
(17, 'doug', 'mytzy'),
(18, 'dimma', 'mytzy'),
(19, 'dome', 'mytzy'),
(20, 'bruce', 'mytzy');

--
-- Insertion for table `totalCheeses`
--
INSERT INTO `totalCheeses` (`cheeseId`, `cheeseName`, `cost`, `category`, `image`, `description`, `invnum`) VALUES
(1,'Mozzarella', 40, 'Melt', 'https://upload.wikimedia.org/wikipedia/commons/5/57/Mozzarella_di_bufala3.jpg', 'Stretch goo to put on pizza and other stuff', 10),
(2,'Cheddar Cheese', 35, 'Flavor', 'https://pinconningcheese.com/wp-content/uploads/Mild-Cheddar-cropped.jpg', 'Standard Yellow flavorful cheese you can put in your sandwich', 15),
(3,'Cheese Wheel', 889, 'Parmesan', 'https://images.costco-static.com/ImageDelivery/imageService?profileId=12026540&itemId=845390-847&recipeName=680', 'A cheese wheel is a wheel or block of cured cheese that is typically still covered in a protective rind. Most cheeses are made in the shape of wheels, with cheese shops cutting out wedges when clients request a particular cheese.', '1'),
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