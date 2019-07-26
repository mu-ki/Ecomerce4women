-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2019 at 07:50 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goladygo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'SAREE'),
(2, 'LEHANGA'),
(3, 'SALWAR'),
(4, 'KURUTHAS'),
(5, 'SCANDLES'),
(6, 'FACE CREAM'),
(7, 'EYE LYNER'),
(8, 'LIP STICK'),
(9, 'FACE CREAM'),
(10, 'MOISTURIZERS'),
(11, 'HAND BAG');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(156, 91, '::1', 28, 1),
(157, 87, '::1', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Traditional Dress'),
(2, 'Western Wear'),
(3, 'Fahion Wear'),
(4, 'Cosmetics'),
(5, 'Accessories'),
(6, 'Kids Wear'),
(7, 'Sports Wear');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(1, 'mugunthkumar99@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 28, 'mUKII KK', 'mugu@waa.nn', '1111', 'QQQ', 'rtt', 123452, 'mugu', '123456789', '12/22', 3, 1547, 667),
(2, 29, 'Aaroon sanju', 'aaroonsanju5@gmail.com', 'veerapandi', 'tirupur', 'kjhbkh', 641605, 'sanju', '75896325254878', '12/22', 1, 199, 515),
(3, 28, 'mUKII KK', 'mugu@waa.nn', '1111', 'QQQ', 'qw', 123455, 'qwer', '1234567', '12/11', 1, 569, 123),
(4, 28, 'mUKII KK', 'mugu@waa.nn', '1111', 'QQQ', 'rtt', 638116, 'mugu', '1234567890', '12/11', 1, 299, 111);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(1, 1, 92, 1, 499),
(2, 1, 85, 1, 749),
(3, 1, 91, 1, 299),
(4, 2, 103, 1, 199),
(5, 3, 87, 1, 569),
(6, 4, 91, 1, 299);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(85, 1, 1, 'Handloom Sarere', 749, 'Explore the collection of beautifully designed sarees from Generic on Amazon. Each piece is elegantly crafted and will surely add to your wardrobe. Pair this piece with heels or flats for a graceful look.\r\n\r\n', '1564065252_saree1.jpeg', 'saree'),
(86, 1, 1, 'Anand Sarees', 699, 'Care Instructions: Dry Clean Only\r\nThe saree comes with a 80 cm separate blouse piece. It is unstitched and can be altered according to your desired style and fit.\r\nJacquard Woven (SELF) Design Soft Feel Banarasi Silk saree.\r\nNormal Hand Wash.\r\nThis traditional heavy silk saree is hand dyed and also lot of hand work is involved in preparing the product , so there might be chance of un-uniformity in design and colour on product, and this product may not shine that much has displayed , and there might be slight colour variation due to photographic effects and, product colour display may change mobile to mobile and PC to PC due to different resolutions of screen of mobile, PC', '1564077960_81GXQnMCT-L._UY741_.jpg', 'SAREE'),
(87, 1, 1, 'Sanddep Sarees', 569, 'Care Instructions: Dry Clean Only\r\nThe saree comes with a 80 cm separate blouse piece. It is unstitched and can be altered according to your desired style and fit.\r\nJacquard Woven (SELF) Design Soft Feel Banarasi Silk saree.\r\nNormal Hand Wash.\r\nThis traditional heavy silk saree is hand dyed and also lot of hand work is involved in preparing the product , so there might be chance of un-uniformity in design and colour on product, and this product may not shine that much has displayed , and there might be slight colour variation due to photographic effects and, product colour display may change mobile to mobile and PC to PC due to different resolutions of screen of mobile, PC', 'free-7944-snh-export-original-imaf8hwbmhscygep.jpeg', 'SAREE'),
(89, 2, 3, 'Vaamsi Women', 438, 'Here is the Fancy kurti by Vaamsi. Ideal for parties and festivals. Our kurtis are made and stitched using high grade fabrics and yarns under the strict surveillance of our well-versed executives. We are offering our products at most reasonable prices.\r\n\r\n', '1564080633_61Q4JoFovsL._AC_UL320_.jpg', 'SALVAR'),
(90, 2, 3, 'Myx Women Asymmetrical Hemline Kurta', 199, 'Make a fine addition to your wardrobe by adding this kurta from Myx. Crafted from a good quality fabric, this elegant piece promises style and easy maintenance.', '1564080765_download (1).jpg', 'SALVAR'),
(91, 2, 3, 'Indigo Women Straight Kurti', 299, '\r\nIndigo is a womenâ€™s ethnic and fusion wear value brand. Our range is sharply priced and offers an array of products across solids, prints and embroideries. We offer the right blend of quality, style and value aimed to delight our customers.', '1564080896_download ).jpg', 'SALVAR'),
(92, 2, 3, 'ADA Hand Embroidered Lucknow', 499, 'Length: 44 inches Touch and Feel: Soft and Comfortable For all those who love to dress up in chic and trendy style this ethnic Black Cotton pre washed kurti is the perfect pick . Designed to accentuate your beauty in a traditional way , breath-taking hand crafted chikan stitches are used such as â€˜Ulti Bakhiyaâ€™, â€˜Ghas Patti â€˜', '1564081014_81qoCub2oGL._UY741_.jpg', 'SALVAR'),
(93, 2, 3, 'ADA Lucknow Chikan Hand Embroidered Cotton Kurti Regular Wear', 166, 'Length : 44 inches Sleeves: Full Sleeves Touch and Feel: Soft and Soothing A blend of tradition and simplicity, the Blue Cotton kurti, embroidered with best traditional and elegant stitches crafted on a colour fast and non-shrinkable fabric. The chikan stitches used such as â€˜Bakhiyaâ€™ using White cotton thread .', '1564081089_71CW-gaeNNL._UY606_.jpg', 'SALVAR'),
(94, 2, 2, 'Fashion Dream Ethnic Wears Orange', 599, 'A beautiful girlâ€™s lengha choli with Embellished By mirror, Choli has a fitted waist, round-neck, Sleeveless and a lengha that flares into a flared shape', '1564081205_71irSpKeBiL._UX679_.jpg', 'Lehanga'),
(95, 2, 2, 'Tilism Girls Net Lehenga Choli', 542, 'TILISM is dedicated on line store for your Little Princess and her fashion needs. Dress up your Little Princess with the latest designs from S-ART FASHION. Our dresses are designed to be smooth and comfortable to wear for kids. S-ART FASHION offers wide range of Kids dresses, Ethnic Wear, Lehenga Choli, Party Wear LCs, Frocks and Accessories for Girls and Baby Girls. Hope you like our Trendy Kids wear collection and you enjoy shopping with us.\r\n\r\n', '1564081273_71huohd0tcL._UX679_.jpg', 'Lehanga'),
(96, 3, 5, 'J B Fashion Women', 299, 'Serch J B Fashion for more varieties in tops for women tops for women western wear top women top women tops crop tops for women women tops western tops womens tops cold shoulder tops for women girls top long skirts for women with tops tank tops for women ladies tops tops for girls crop tops off shoulder tops crop tops for women western wear off shoulder tops for women pantaloons tops for women party wear', '1564104977_81g3ausNgZL._UX679_.jpg', 'Fashion'),
(97, 3, 5, 'PATRORNA Women', 399, 'Spruce Up Your Wardrobe With This Dress From Patrorna Available On Amazon. Wear It With A Pair Of Sneakers For A Day Out Or With A Pair Of Nude Heels For The Party And You Are Sure To Make Heads Turn.\r\n\r\n', '1564105075_81gSxVkbuUL._UY879_.jpg', 'Scandals'),
(98, 3, 5, 'Xxllent Women', 609, 'Size:- 4xl,5xl,6xl,7xl,8xl,9x,10xl Bust Size:- 48â€™â€™inch,50â€™â€™inch,52â€™â€™inch,54â€™â€™inch,56â€™â€™inch,59â€™â€™inch,60â€™â€™inch. . *It is made of Georgette Material, Very comfortable for a Plus Size Person A Plus size women dress for daytime, casual Wear. This Dress is design es specially keeping in mind a plus size women. * Suitable Occasion:- Casual Wear, Occasionally wear and Outdoor wear.', '1564105182_51EduO34zoL._UX679_.jpg', 'Scandals'),
(99, 3, 5, 'Lastinch Plus Size Multicoloured Flared Knee Length ', 249, 'Material is Rayon Three Fourth Sleeve Pleated Front Knee Length', '1564105262_71cvjk0kHmL._UX679_.jpg', 'Scandals'),
(100, 3, 5, 'Material is Rayon Three Fourth Sleeve Pleated Front Knee Length', 699, 'Spruce Up Your Wardrobe With This Dress From Fashion2Wear Available On Amazon. Wear It With A Pair Of Sneakers For A Day Out Or With A Pair Of Nude Heels For The Party And You Are Sure To Make Heads Turn.', '1564105324_81Bv0ti0QzL._UX679_.jpg', 'Scandals'),
(101, 4, 6, 'Lakme Peach Milk Soft Creme', 199, 'Is your skin loosing moisture as the day goes by ? LakmÃ© brings to you the goodness of peaches and milk in a creme for the very first time! This whipped cream formula has a soothing fragrance which will make you fall in love with it instantly. This deeply nourishing formula easily absorbs into the skin to lock moisture for 24 hours to give you soft, smooth glowing skin. Apply the crÃ¨me smoothly over face and neck. Use it in the day/night to get beautiful skin around the clock. This crÃ¨me can be applied under make up. For best results - use every day for nourished skin that glows. ', '1564110958_51YFnrV9quL._SL1000_.jpg', 'Facewash'),
(102, 4, 6, ' Kaya Youth O2 Oxy-Infusion ', 125, 'As you approach the age of 30, the supply of oxygen to your skin cells drops by almost 25%. dullness and dark patches are often the first few symptoms of it. Your skin needs more than the everyday cream, It needs a boost of oxygen to stay youthful & glowing.', '1564111056_51NbO5I4EkL._SL1500_.jpg', 'Facewash'),
(103, 4, 6, ' Lakme 9 to 5 Complexion', 199, 'For women who are on the go and could use the extra minutes before stepping out, Lakme CC cream is here to the rescue. This cream acts as your everyday mini skin stylist and lets you get that perfect look of makeup + skincare for any occasion. It may be work, party or simply an evening with friends, you', '1564111119_4.jpg', 'Facewash'),
(104, 4, 6, ' Lotus Herbals Whiteglow Skin Whitening And Brightening Gel ', 199, 'The Lotus Herbals Whiteglow Skin Whitening and Brightening Gel Cream SPF-25 (60 g), is an apt product to help you fight the stern rays of the sun and remain tan-free for a long period of time, thanks to its SPF 25 PA+++ formulation. It has a one of its kind base that has the amazing combination of a gel and a cream. ', '1564111190_619b4QHhEUL._SL1200_.jpg', 'Facewash'),
(105, 4, 6, ' Ponds Age Miracle ', 199, 'The Lotus Herbals Whiteglow Skin Whitening and Brightening Gel Cream SPF-25 (60 g), is an apt product to help you fight the stern rays of the sun and remain tan-free for a long period of time, thanks to its SPF 25 PA+++ formulation. It has a one of its kind base that has the amazing combination of a gel and a cream.', '1564111325_61knDhUDoiL._SL1000_.jpg', 'Facewash'),
(106, 4, 8, ' Lakme Absolute', 121, 'Using the wand, apply the liquid lipstick starting from the center of your upper lip and then evenly spreading on the lower lip.', '1564115828_654.jpg', 'lipstick'),
(107, 4, 8, ' Maybelline New York Super ', 177, 'SuperStay Matte Ink Liquid Lipstick gives you a flawless matte finish in a range of super pigmented shades. The Super Stay Matte Ink Liquid Lipstick is available in over 25+ saturated shades and lasts for up to 16 hours. TIPS: Step 1. Apply liquid lipstick in the center of your upper lip and follow the contours of your mouth. Step 2. Glide the liquid lipstick across the entire bottom lip.', '1564115904_51Cmzt9nNkL._SL1130_.jpg', 'lipstick'),
(108, 4, 7, 'Colorbar Ultimate Eye Liner', 189, 'Ultimate Eyeliner by Colorbar is a unique product which is perfect for defining your eyes in a lightning speed without any application difficulty. Its professional flexible brush offers great accuracy to line and define the eyes, ensuring an even application. Enables ease of use with the optimal control to give jet black color.', '1564116003_51UtYHj7fWL._SL1500_.jpg', 'eyeliner'),
(109, 4, 7, ' Colorbar Waterproof Liquid Eyeliner', 123, 'The Waterproof Liquid Eye Liner Is Long-Lasting And Does Not Smudge, Crack, Flake Or Peel. With Its High Definition Flexible Felt Tip Applicator, One Stroke Is Enough To Define A Fine Or Thick Line. Fast Drying, Waterproof Liquid Eye Liner Is Suitable For Sensitive Eyes And Those Who Wear Contact Lenses Too', '1564116080_51CI1cJ-YfL._SL1500_.jpg', 'eyeliner'),
(110, 5, 11, ' NPELANZA Makeup Case Cosmetic Hand Bag with Mirror', 599, 'Multifunction Travel Cosmetic MakeUp Bag With Small Mirror Adjustable Dividers for Cosmetics Makeup Brushes (Multi color) These toiletry bags are lightweight, durable, waterproof and made out of light and soft material.\r\nSpacious and it fits makeup, lotions, brushes, and all the other accouterments of beauty that you need', '1564116239_71yborMVChL._SL1001_.jpg', 'handbag'),
(111, 5, 11, 'Vismiintrend Women Handbag', 345, 'Focus on fashionable specially designed classic lady bags, with touching of the hottest trend of fashion. ', '1564116371_71DQCtEfU8L._UY575_.jpg', 'handbag'),
(112, 4, 10, 'Toku 1 Pair Gel Heel', 199, 'This is ideal for getting some comfort while suffering from any kind of heel pain.', '1564116565_515fS1AHXRL._UL1024_.jpg', 'moisturizer'),
(113, 5, 9, 'WOW Fairness SPF 20', 299, 'Wow skin science fairness cream spf 20', '1564116675_6139VqFDEFL._SL1500_.jpg', 'face wash'),
(114, 6, 4, 'Cherokee by Unlimited Girls Cotton', 199, 'This beautiful abstract printed black dress is a must have wardrobe dress for girls. The soft cotton material in its feel makes the dress extremely comfortable and warm for an outing or an event.\r\n\r\n', '1564117007_91tRpPPcOSL._UL1500_.jpg', 'kidswear'),
(115, 6, 4, 'Cub McPaws Girls Dress', 499, 'This beautiful abstract printed black dress is a must have wardrobe dress for girls. The soft cotton material in its feel makes the dress extremely comfortable and warm for an outing or an event.\r\n\r\n', '1564117445_71YIvy5WqJL._UL1440_.jpg', 'kurthas'),
(116, 7, 4, 'Shocknshop Women', 399, 'Shop From A Wide Range Of Leggings From Shocknshop.Wear It Over A Nice Tunic Or Your Favorite Kurta And You Are Ready For The Day.', '1564117572_316Y1r4XSFL.jpg', 'kurthas');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(27, 'Mugunth', 'Kumar', 'mugunthkumar99@gmail.com', '1111', '9514444471', 'Erode', '31,Main Str'),
(28, 'mUKII', 'KK', 'mugu@waa.nn', 'QQQQ1111@', '1111111111', '1111', 'QQQ'),
(29, 'Aaroon', 'sanju', 'aaroonsanju5@gmail.com', 'sanjuinga', '9080809758', 'veerapandi', 'tirupur'),
(30, 'muki', 'muki', 'singhnexus12@gmail.com', '11111111@', '1111111111', 'werty11', 'qwe');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(27, 'Mugunth', 'Kumar', 'mugunthkumar99@gmail.com', '1111', '9514444471', 'Erode', '31,Main Str'),
(28, 'mUKII', 'KK', 'mugu@waa.nn', 'QQQQ1111@', '1111111111', '1111', 'QQQ'),
(29, 'Aaroon', 'sanju', 'aaroonsanju5@gmail.com', 'sanjuinga', '9080809758', 'veerapandi', 'tirupur'),
(30, 'muki', 'muki', 'singhnexus12@gmail.com', '11111111@', '1111111111', 'werty11', 'qwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
