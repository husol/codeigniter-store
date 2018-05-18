-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2016 at 10:05 AM
-- Server version: 5.6.34
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoanmy`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cid` int(4) NOT NULL,
  `c_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_ischild` int(1) NOT NULL DEFAULT '0',
  `c_parent` int(4) NOT NULL DEFAULT '0',
  `c_grparent` int(4) DEFAULT NULL,
  `c_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `c_type` varchar(30) CHARACTER SET latin1 NOT NULL,
  `c_hasmeta` tinyint(1) NOT NULL DEFAULT '0',
  `c_level` int(4) NOT NULL DEFAULT '1',
  `c_ordering` tinyint(2) DEFAULT '1',
  `c_editable` int(2) NOT NULL DEFAULT '1',
  `c_stat` int(1) NOT NULL DEFAULT '1',
  `c_lastmodified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_intro` text CHARACTER SET latin1
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `c_name`, `c_slug`, `c_ischild`, `c_parent`, `c_grparent`, `c_group`, `c_type`, `c_hasmeta`, `c_level`, `c_ordering`, `c_editable`, `c_stat`, `c_lastmodified`, `c_intro`) VALUES
(1, 'Contact form', 'contact-form', 0, 0, NULL, 'page', 'contact form', 0, 1, 1, 0, 1, NULL, NULL),
(2, 'Single page', 'single-page', 0, 0, 0, 'page', 'single page', 1, 1, 1, 0, 1, NULL, NULL),
(8, 'Tin tức', 'tin-tuc', 0, 0, 0, 'page', 'post', 0, 1, 1, 1, 1, NULL, NULL),
(44, 'Sản Phẩm', 'san-pham', 0, 0, 0, 'page', 'post', 0, 1, 1, 1, 1, NULL, ''),
(51, 'May đồng phục doanh nghiệp', 'may-dong-phuc-doanh-nghiep', 0, 44, 0, 'page', 'post', 0, 2, 1, 1, 1, NULL, ''),
(52, 'May áo khoác đồng phục', 'may-ao-khoac-dong-phuc', 0, 44, 0, 'page', 'post', 0, 2, 2, 1, 1, NULL, ''),
(53, 'Bảo quản nông sản quy mô hộ gi', 'bao-quan-nong-san-quy-mo-ho-gi', 0, 0, 0, 'page', 'post', 0, 0, 1, 1, 1, NULL, NULL),
(54, 'May áo thun đồng phục, áo thun quảng cáo', 'may-ao-thun-dong-phuc-ao-thun-quang-cao', 0, 44, 0, 'page', 'post', 0, 2, 3, 1, 1, NULL, ''),
(58, 'Bảo quản xi lô', 'bao-quan-xi-lo', 0, 0, 0, 'page', 'post', 0, 0, 1, 1, 1, NULL, NULL),
(59, 'May nón quảng cáo, nón du lịch', 'may-non-quang-cao-non-du-lich', 0, 44, 0, 'page', 'post', 0, 2, 4, 1, 1, NULL, ''),
(60, 'May balo - túi xách', 'may-balo-tui-xach', 0, 44, 0, 'page', 'post', 0, 2, 5, 1, 1, NULL, ''),
(61, 'Thiết bị hỗ trợ', 'thiet-bi-ho-tro', 0, 0, 0, 'page', 'post', 0, 0, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_trans`
--

CREATE TABLE IF NOT EXISTS `category_trans` (
  `cid` int(3) NOT NULL,
  `c_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_ref` int(3) NOT NULL,
  `c_intro` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_trans`
--

INSERT INTO `category_trans` (`cid`, `c_name`, `c_slug`, `c_ref`, `c_intro`) VALUES
(1, 'Products', 'products', 44, NULL),
(2, 'News', 'news', 8, NULL),
(3, 'Organic Storage', 'organic-storage', 45, NULL),
(4, 'Organic', 'organic', 46, NULL),
(5, 'Cocoon system', 'cocoon-system', 47, NULL),
(6, 'Drying sheets', 'drying-sheets', 48, NULL),
(7, 'temp EN 1', 'temp-en-1', 49, NULL),
(8, 'Organic Storage type 1', 'organic-storage-type-1', 50, NULL),
(9, 'Single page', 'single-page', 2, NULL),
(11, 'Contact form', 'contact-form', 1, NULL),
(12, 'Office custom', 'office-custom', 51, NULL),
(13, 'Coat', 'coat', 52, NULL),
(14, 'Farming storage', 'farming-storage', 53, NULL),
(15, 'Pull, Ads Pull', 'pull-ads-pull', 54, NULL),
(16, 'Commercial storage', 'commercial-storage', 55, NULL),
(17, 'Transport storage', 'transport-storage', 56, NULL),
(18, 'Silage storage', 'silage-storage', 57, NULL),
(19, 'Silage storage', 'silage-storage', 58, NULL),
(20, 'Hat', 'hat', 59, NULL),
(21, 'Backpack', 'backpack', 60, NULL),
(22, 'Accessories', 'accessories', 61, NULL),
(23, 'ut aliquid iusto', 'ut-aliquid-iusto', 62, NULL),
(24, 'dolor illum quos sint odit', 'dolor-illum-quos-sint-odit', 63, NULL),
(25, 'dicta beatae sequi voluptates', 'dicta-beatae-sequi-voluptates', 64, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('06ac680ee3d756c7d663f72144cda755', '66.249.66.16', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478395613, ''),
('0d855fa3d8b2f5e2fbd137ef41cf9c1b', '66.102.6.120', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1478400796, ''),
('26ba57375441e55a61ec48fd11abb2c9', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398238, ''),
('278e9ed56f85d7e483e08ae64876953c', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398232, ''),
('2b765926a21b6d0a1ea64cbeeff21b87', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398219, ''),
('30d9f111051f83c3898f7a6078311db9', '66.249.66.16', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1478397173, ''),
('3976ea671dfcaa00c6c68e7cd8f39694', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398229, ''),
('3de6d430133d6fda02494bbc7e829ac6', '66.102.6.118', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', 1478400796, ''),
('5952b1d6e0f79f0c458b9ad66250ef60', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398231, ''),
('6b50f6169605fc3b08d86e4283d8b24b', '66.249.66.19', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478397441, ''),
('74e1bc60211678f9807af760c202fa1d', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398221, ''),
('79c9654c7dff3182edb8139f7ea1f57f', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398207, ''),
('80a28be88aaa504926ee3af9a87e5a1c', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398227, ''),
('96d19d743835e6b1056170cd21c0872d', '66.249.66.22', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478399628, ''),
('97434e23cdc9318f8d0e70ee0777abad', '66.249.66.16', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478397755, ''),
('b3b20ba93c40f847d8ed1ec76a8a3f8b', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398223, ''),
('b5696bed0a259142f1b3ce8b6f048d0e', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398239, ''),
('b72700d3cc6a61e54a6cda230fe51231', '157.55.39.90', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1478394592, ''),
('c8811fd036fb3f5f7eb42872523bc939', '66.249.66.16', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478393093, ''),
('cabaf6a39b09a20e75cc6aa7e5f68ff8', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398216, ''),
('cdedfc7e3d91b5e67dc65d324590f1a3', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398234, ''),
('ce4451d7e146e055b9b27a8ef7d98a11', '66.249.66.16', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', 1478393035, ''),
('d0d7e770821d319a77b415ce7140b65b', '66.249.66.22', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1478395081, ''),
('d92a45d9e650d14d8d1c4b3f82df8634', '163.172.66.95', 'Mozilla/5.0 (compatible; AhrefsBot/5.1; +http://ahrefs.com/robot/)', 1478400326, ''),
('e008b7ef21eda49b3d33cf4c120c9cde', '116.106.196.172', 'Mozilla/5.0 (X11; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0', 1478398627, 'a:4:{s:9:"user_data";s:0:"";s:4:"auth";s:1:"1";s:2:"id";s:1:"1";s:4:"user";s:5:"husol";}'),
('ff0618955b3f4696904c3e45a407e415', '217.103.97.99', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 1478398218, '');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `cfid` int(11) NOT NULL DEFAULT '1',
  `sitename` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_sender` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_receiver` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `metadescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `metakeyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fb_profile` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fb_aid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_api_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_channel_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ppp` int(2) NOT NULL,
  `ipp` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`cfid`, `sitename`, `title`, `logo`, `email_sender`, `email_receiver`, `metadescription`, `metakeyword`, `fb_profile`, `fb_aid`, `youtube_api_key`, `youtube_channel_id`, `ppp`, `ipp`) VALUES
(1, 'Dong Phuc Hoan My', 'Công ty TNHH SX Đồng Phục Hoàn Mỹ', 'asset/data/partners/thumbnail/logo.png', '', 'phangia0385@gmail.com', 'Công ty cung cấp các loại thời trang, đồng phục', 'cung cấp các loại đồng phục, cung cấp các loại thời trang', '', NULL, 'AIzaSyCTmJPgzcBcB2Fq6iBzy2GeZBtPAdHa2GA', 'UCybcPSMWjyv4oXoLA9qb6Gg', 16, 20);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `iid` int(11) NOT NULL,
  `i_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `i_caption` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `i_caption_trans` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `i_pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `mnid` int(4) NOT NULL,
  `mn_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mn_slug` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `mn_name_trans` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mn_slug_trans` varchar(30) NOT NULL,
  `mn_group` varchar(20) NOT NULL DEFAULT 'Main menu',
  `mn_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mn_title_trans` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mn_target` int(11) NOT NULL DEFAULT '0',
  `mn_ordering` int(2) NOT NULL,
  `mn_cid` int(11) NOT NULL,
  `mn_stat` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`mnid`, `mn_name`, `mn_slug`, `mn_name_trans`, `mn_slug_trans`, `mn_group`, `mn_title`, `mn_title_trans`, `mn_target`, `mn_ordering`, `mn_cid`, `mn_stat`) VALUES
(2, 'Sản phẩm', 'san-pham', 'Products', 'products', 'Main menu', 'Sản phẩm', 'Products', 0, 3, 44, 1),
(3, 'Tin tức', 'tin-tuc', 'News', 'news', 'Main menu', 'Tin tức', 'News', 0, 2, 8, 1),
(9, 'Liên hệ', 'lien-he', 'Contact', 'contact', 'Top menu', 'Liên hệ', 'Contact', 0, 4, 1, 1),
(10, 'Giới thiệu', 'gioi-thieu', 'About us', 'about-us', 'Main menu', 'Giới thiệu', 'About us', 7, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `mid` int(4) NOT NULL,
  `m_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `m_name_trans` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `m_content` text COLLATE utf8_unicode_ci NOT NULL,
  `m_content_trans` text COLLATE utf8_unicode_ci NOT NULL,
  `m_meta` text COLLATE utf8_unicode_ci,
  `m_mcid` int(11) NOT NULL,
  `m_ordering` int(2) DEFAULT '1',
  `m_lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_stat` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`mid`, `m_name`, `m_name_trans`, `m_content`, `m_content_trans`, `m_meta`, `m_mcid`, `m_ordering`, `m_lastmodified`, `m_stat`) VALUES
(2, 'Footer info', 'Footer Info', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\r\n\r\n<p>Quis ab harum temporibus delectus tempora quaerat reiciendis dolore.</p>\r\n\r\n<p>Ipsam fugiat nam deleniti dolores magnam, delectus</p>\r\n\r\n<p>Email:&nbsp;<a href="mailto:contact@bhl.com.vn">contact@demo.com</a></p>\r\n', '<p><strong>BHL AgroSmart Company Limited</strong></p>\r\n\r\n<p>Address:&nbsp; 88/1 Street No. 9, Ward 9, Go Vap District, Ho Chi Minh City</p>\r\n\r\n<p>Tel: (+84) 8.62570498. Fax: (+84) 8.62570499</p>\r\n\r\n<p>Email:&nbsp;<a href="mailto:contact@bhl.com.vn">contact@bhl.com.vn</a></p>\r\n', '', 2, 1, '2016-06-01 03:16:15', 1),
(4, 'Banner', 'Banner', '<p><object width="1198" height="198" data="asset/data/upload/new/banner.swf"></object></p>', '', '', 1, 1, '2016-07-03 23:06:59', 1),
(24, 'Top viewed', '', '', '', NULL, 9, 1, '2014-07-17 12:04:01', 1),
(25, 'Latest posts', '', '', '', NULL, 10, 3, '2014-07-17 13:16:48', 1),
(28, 'New youtube video 2', 'test', '', '', '{"val":"7Hr_3eIysE4","title":"Post harvest technology - GrainPro Solutions to Post-Harvest Problems- Agribusiness","thumbnail":"https://i.ytimg.com/vi/7Hr_3eIysE4/mqdefault.jpg","channelId":"UCrLmtJ2KE6lNDXCfQSIqzHw","channelTitle":"Agribusiness HowItWorks"}', 12, 6, '2016-06-02 18:51:19', 0),
(60, 'Sản Phẩm', 'Products', '', '', '{"id":"44","name":"Sản Phẩm"}', 18, 2, '2016-07-03 03:29:55', 1),
(62, 'Slideshow', 'Slideshow', '', '', '{"slideshow":{"0":{"src":"slideshows/img_1.jpg","caption":"Đồng phục doanh nghiệp","caption_trans":"Office Custom"},"1":{"src":"slideshows/img_2.jpg","caption":"Áo khoác đồng phục","caption_trans":"Coat"},"2":{"src":"slideshows/img_3.jpg","caption":"Áo thun đồng phục","caption_trans":"Pull"},"3":{"src":"slideshows/img_4.jpg","caption":"Nón quảng cáo","caption_trans":"Hat"},"4":{"src":"slideshows/img_5.jpg","caption":"Ba lô quảng cáo","caption_trans":"Backpack"}}}', 17, 1, '2015-07-27 04:52:00', 1),
(63, 'Tin tức', 'News', '', '', '{"id":"44","name":"Sản phẩm"}', 19, 3, '2016-06-01 23:19:15', 1),
(64, 'new cat', 'new cat', '', '', '{"id":"48","name":"Hỗ trợ sấy nông sản"}', 15, 2, '2015-07-27 05:01:31', 0),
(65, 'test', 'test', '', '', '', 11, 1, '2016-06-01 23:22:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_category`
--

CREATE TABLE IF NOT EXISTS `module_category` (
  `mcid` int(3) NOT NULL,
  `mc_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mc_slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mc_ischild` int(1) NOT NULL DEFAULT '0',
  `mc_parent` int(3) NOT NULL DEFAULT '0',
  `mc_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mc_pos` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_hasmeta` tinyint(1) NOT NULL DEFAULT '0',
  `mc_fn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_level` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_category`
--

INSERT INTO `module_category` (`mcid`, `mc_name`, `mc_slug`, `mc_ischild`, `mc_parent`, `mc_type`, `mc_pos`, `mc_hasmeta`, `mc_fn`, `mc_level`) VALUES
(1, 'Banner', 'banner', 0, 0, 'banner', NULL, 0, NULL, 1),
(2, 'Footer', 'footer', 0, 0, 'footer', NULL, 0, NULL, 1),
(7, 'Sidebar', 'sidebar', 0, 0, 'sidebar', NULL, 0, NULL, 1),
(8, 'Default sidebar', 'default-sidebar', 1, 7, 'sidebar', NULL, 0, 'default', 2),
(9, 'Top viewed', 'top-viewed', 1, 7, 'sidebar', NULL, 0, 'top_viewed', 2),
(10, 'Latest', 'latest', 1, 7, 'sidebar', NULL, 0, 'latest', 2),
(11, 'Facebook likebox', 'facebook-likebox', 1, 7, 'sidebar', NULL, 1, 'facebook_like_box', 2),
(12, 'Youtube video', 'youtube-video', 1, 7, 'sidebar', NULL, 1, 'youtube_video', 2),
(16, 'Homepage', 'homepage', 0, 0, 'homepage', NULL, 0, NULL, 1),
(17, 'Slideshow', 'slideshow', 1, 16, 'homepage', NULL, 1, 'slideshow', 2),
(18, 'Featured posts style 1', 'featured-posts-style-1', 1, 16, 'homepage', NULL, 1, 'featured_s1', 2),
(19, 'Featured posts style 2', 'featured-posts-style-2', 1, 16, 'homepage', NULL, 1, 'featured_s2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE IF NOT EXISTS `partner` (
  `ptid` int(11) NOT NULL,
  `pt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_link` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_des` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`ptid`, `pt_name`, `pt_slug`, `pt_img`, `pt_link`, `pt_des`) VALUES
(1, 'chiakhoadulich', '', 'asset/data/upload/new/thumbnail/partner_chiakhoadulich.png', '', ''),
(2, 'cocacola', '', 'asset/data/upload/new/thumbnail/partner_cocacola.jpg', '', ''),
(3, 'fpt', '', 'asset/data/upload/new/thumbnail/partner_fpt.jpg', '', ''),
(4, 'hoasen', '', 'asset/data/upload/new/thumbnail/partner_hoasen.jpg', '', ''),
(5, 'kinhdo', '', 'asset/data/upload/new/thumbnail/partner_kinhdo.jpg', '', ''),
(6, 'loinoigoivang', '', 'asset/data/upload/new/thumbnail/partner_loinoigoivang.jpg', '', ''),
(7, 'petrovn', '', 'asset/data/upload/new/thumbnail/partner_petrovn.jpg', '', ''),
(8, 'vietinbank', '', 'asset/data/upload/new/thumbnail/partner_vietinbank.png', '', ''),
(9, 'wwf', '', 'asset/data/upload/new/thumbnail/partner_wwf.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `pid` int(11) NOT NULL,
  `p_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_slug` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_ym` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_shorttext` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `p_meta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `p_author` int(4) DEFAULT '1',
  `p_datetime` datetime DEFAULT NULL,
  `p_published` datetime DEFAULT NULL,
  `p_lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `p_cid` int(11) NOT NULL,
  `p_views` int(11) NOT NULL DEFAULT '0',
  `p_stat` int(11) NOT NULL DEFAULT '1',
  `p_featured` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(9, 'Áo Khoác 007', 'ao-khoac-007', 'products/AoKhoac/', 'AoKhoac007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', NULL, 1, '2016-05-31 22:05:58', '2016-10-27 03:00:00', '2016-10-27 18:20:11', 52, 61, 1, 0),
(10, 'Áo Khoác 006', 'ao-khoac-006', 'products/AoKhoac/', 'AoKhoac006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;phối xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 1, '2016-06-01 00:07:18', '2016-10-27 03:10:00', '2016-10-27 18:20:33', 52, 29, 1, 0),
(12, 'Áo Khoác 005', 'ao-khoac-005', 'products/AoKhoac/', 'AoKhoac005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối v&agrave;ng chanh&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 1, '2016-06-01 00:08:22', '2016-10-27 03:20:00', '2016-10-27 18:20:51', 52, 29, 1, 0),
(13, 'Áo Khoác 004', 'ao-khoac-004', 'products/AoKhoac/', 'AoKhoac004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 1, '2016-06-02 14:53:51', '2016-10-27 03:30:00', '2016-10-27 18:21:10', 52, 29, 1, 0),
(14, 'Áo Khoác 001', 'ao-khoac-001', 'products/AoKhoac/', 'AoKhoac001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu : </strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>- <strong>M&ocirc; tả : </strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>- <strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>- <strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; phối xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 1, '2016-06-02 14:55:24', '2016-10-27 14:17:00', '2016-10-27 18:17:56', 52, 20, 1, 0),
(18, 'Áo Thun đồng phục', 'ao-thun-dong-phuc', 'news/undefined/', 'AoThunDongPhuc.png', '', '<p>Cơ sở sản xuất Ho&agrave;n Mỹ chuy&ecirc;n may &aacute;o thun như:<br />\n&ndash; &Aacute;o thun l&agrave;m đồng phục c&ocirc;ng ty, nh&agrave; h&agrave;ng, qu&aacute;n ăn.<br />\n&ndash; &Aacute;o nh&oacute;m, &aacute;o lớp với c&aacute;c chất liệu vải như:<br />\n+ Vải c&aacute; sấu (100% cotton; 65/35; PE)<br />\n+ Vải thun Cotton (100% cotton; 65/35; PE)&hellip;<br />\nSản phẩm được thiết kế, sản xuất theo y&ecirc;u cầu của kh&aacute;ch h&agrave;ng.<br />\nGi&aacute; cả cạnh tranh, giao h&agrave;ng tận nơi trong Tp.HCM v&agrave; c&aacute;c tỉnh th&agrave;nh.<br />\nHi vọng sẽ c&oacute; cơ hội được phục vụ Qu&yacute; kh&aacute;ch!</p>\n', '', 2, '2016-07-11 12:16:59', '2016-07-11 12:15:00', '2016-07-11 16:16:59', 8, 13, 1, 0),
(19, 'Nón du lịch', 'non-du-lich', 'news/undefined/', 'NonDuLich_2.png', '', '<p style="text-align: justify;">C&ocirc;ng ty TNHH TMSX &amp; DV Ho&agrave;n Mỹ xin giới thiệu đến qu&yacute; kh&aacute;ch h&agrave;ng giải ph&aacute;p quảng b&aacute; thương hiệu mới th&ocirc;ng qua những chiếc n&oacute;n tai b&egrave;o. Doanh nghiệp bạn c&oacute; thắc mắc l&agrave; chiếc n&oacute;n tai b&egrave;o th&igrave; l&agrave;m sao quảng b&aacute; được thương hiệu cho m&igrave;nh? Những chiếc n&oacute;n c&oacute; in logo, slogan của doanh nghiệp sẽ mang thương hiệu đến với cộng đồng xung quanh.<br />\nTự h&agrave;o l&agrave; đơn vị may mặc với nhiều năm kinh nghiệm th&igrave; Ho&agrave;n Mỹ lu&ocirc;n lu&ocirc;n cho ra đời những sản phẩm tốt nhất v&agrave; gi&aacute; th&agrave;nh cạnh tranh nhất nhằm đ&aacute;p ứng nhu cầu của c&aacute;c doanh nghiệp, c&ocirc;ng ty.<br />\nC&aacute;c sản phẩm của c&ocirc;ng ty:<br />\n- N&oacute;n quảng c&aacute;o<br />\n- N&oacute;n sự kiện<br />\n- N&oacute;n du lịch</p>\n\n<p>Đến với ch&uacute;ng t&ocirc;i, bạn sẽ được hỗ trợ từ kh&acirc;u thiết kế, l&ecirc;n mẫu cho đến l&uacute;c sản phẩm được kiểm duyệt v&agrave; xuất xưởng. Sử dụng c&ocirc;ng nghệ d&acirc;y chuyền ti&ecirc;n tiến lu&ocirc;n đảm bảo được độ ch&iacute;nh x&aacute;c cũng như ti&ecirc;u chuẩn đảm bảo của sản phẩm<br />\nH&atilde;y li&ecirc;n hệ ngay với ch&uacute;ng t&ocirc;i để c&oacute; được những chiếc n&oacute;n tai b&egrave;o đẹp nhất v&agrave; rẻ nhất.</p>\n', '', 2, '2016-07-11 13:58:58', '2016-07-11 12:17:00', '2016-07-11 18:09:48', 8, 18, 1, 0),
(20, 'Balo, Túi xách', 'balo-tui-xach', 'news/undefined/', 'BaloTuiXach_2.png', '', '<p style="text-align: justify;">Balo, t&uacute;i x&aacute;ch l&agrave; loại qu&agrave; tặng quảng c&aacute;o kh&aacute; phổ biến v&agrave; c&oacute; hiệu quả tốt. Một chiếc t&uacute;i x&aacute;ch, balo sẽ được người d&ugrave;ng sử dụng rất l&acirc;u, mỗi khi x&aacute;ch đi du lịch, c&ocirc;ng t&aacute;c, đi học... th&igrave; ai cũng nh&igrave;n thấy thương hiệu được in tr&ecirc;n sản phẩm rất r&otilde; r&agrave;ng. Nếu mẫu m&atilde; sản phẩm đẹp, chất lượng tốt th&igrave; c&agrave;ng tạo được thiện cảm với người sử dụng v&agrave; kh&aacute;ch h&agrave;ng, đem đến cho bạn nhiều kh&aacute;ch h&agrave;ng tiềm năng hơn. Gi&aacute; của balo, t&uacute;i x&aacute;ch cũng kh&aacute; tốt, c&oacute; thể dao động từ v&agrave;i chục ng&agrave;n đến hơn 100.000 đồng/c&aacute;i t&ugrave;y theo k&iacute;ch cỡ, loại vải, kiểu d&aacute;ng... Những ng&agrave;nh hay đặt qu&agrave; tặng balo t&uacute;i x&aacute;ch l&agrave; trường học, trung t&acirc;m ngoại ngữ d&agrave;nh tặng học sinh, sinh vi&ecirc;n; c&aacute;c h&atilde;ng xe m&aacute;y, xe oto tặng kh&aacute;ch h&agrave;ng sử dụng khi đi du lịch, c&ocirc;ng t&aacute;c; c&aacute;c ng&acirc;n h&agrave;ng tặng kh&aacute;ch h&agrave;ng sử dụng v&agrave;o c&aacute;c mục đ&iacute;ch h&agrave;ng ng&agrave;y... Ngo&agrave;i ra, c&aacute;c nh&atilde;n h&agrave;ng thời trang cũng đặt balo, t&uacute;i x&aacute;ch để tặng kh&aacute;ch h&agrave;ng kh&aacute; nhiều.</p>\n', '', 2, '2016-07-11 14:00:38', '2016-07-11 13:59:00', '2016-07-11 18:00:38', 8, 11, 1, 0),
(21, 'Balo Túi Xách', 'balo-tui-xach', 'news/undefined/', 'BaloTuiXach_3.png', '', '<p style="text-align: justify;">Balo t&uacute;i x&aacute;ch kh&ocirc;ng chỉ đơn thuần để đựng vật dụng thiết yếu khi ra ngo&agrave;i, đi học, đi du lịch,&hellip; m&agrave; n&oacute; c&ograve;n t&ocirc; điểm th&ecirc;m cho trang phục của bạn, hay mặt kh&aacute;c n&oacute; c&ograve;n gi&uacute;p đem thương hiệu của bạn đi đến khắp những nơi m&agrave; bạn đ&atilde; đặt ch&acirc;n qua.<br />\nC&ocirc;ng ty TNHH TMDV May GIA PH&Uacute;với đội ngũ c&ocirc;ng nh&acirc;n vi&ecirc;n c&oacute; kinh nghiệm cao trong lĩnh vực may mặc, ch&uacute;ng t&ocirc;i tự h&agrave;o về chất lượng sản phẩm m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; cung cấp tr&ecirc;n thị trường tr&ecirc;n phương diện hợp t&aacute;c với c&aacute;c thương hiệu lớn như: Adidas, Eastak, Lammer, Bauer, Adidas, Nike, Redbook,&hellip;<br />\nNgo&agrave;i ra ch&uacute;ng t&ocirc;i cũng đưa sản phẩm của m&igrave;nh đến gần hơn với người ti&ecirc;u d&ugrave;ng trong những chiếc cặp xinh xắn c&aacute;c b&eacute; mần non mang theo b&ecirc;n m&igrave;nh mỗi ng&agrave;y, những chiếc cặp đưa thương hiệu của c&aacute;c trường đại học đi khắp c&aacute;c trường anh ngữ: Ila, Việt Mỹ,&hellip; những thương hiệu nổi tiếng như: Honda, Dai-ichi-life&hellip;<br />\nHy vọng trong thời gian sắp tới c&oacute; cơ hội hợp t&aacute;c.</p>\n', '', 2, '2016-07-11 14:02:14', '2016-07-11 14:00:00', '2016-07-11 18:07:47', 8, 19, 1, 0),
(22, 'Đồng phục công sở sang trọng', 'dong-phuc-cong-so-sang-trong', 'news/undefined/', 'DongPhucCongSoSangTrong.jpg', '', '<p>Ng&agrave;y nay, x&atilde; hội ph&aacute;t triển dẫn đến sự cạnh tranh khốc liệt giữa c&aacute;c doanh nghiệp, c&ocirc;ng ty. Việc cần l&agrave;m của c&aacute;c doanh nghiệp ch&iacute;nh l&agrave; thu h&uacute;t được kh&aacute;ch h&agrave;ng mới v&agrave; n&iacute;u giữ được c&aacute;c kh&aacute;ch h&agrave;ng th&acirc;n thiết. Ch&iacute;nh l&uacute;c n&agrave;y, những phương thức quảng b&aacute; thương hiệu bắt đầu được phổ biến rộng r&atilde;i. May một bộ dong phuc cong so vừa c&oacute; thể gi&uacute;p bạn quảng b&aacute; vừa c&oacute; hiệu quả tr&ecirc;n nhiều phương diện kh&aacute;c nhau.</p>\n\n<p style="text-align: justify;">Một bộ đồng phục c&ocirc;ng sở tinh tế, m&agrave;u sắc h&agrave;i h&ograve;a v&agrave; thiết kế sang trọng, lịch l&atilde;m c&oacute; thể khiến nh&acirc;n vi&ecirc;n của bạn tự tin hơn cũng như c&oacute; thể g&acirc;y được ấn tượng tốt với kh&aacute;ch h&agrave;ng. Nh&acirc;n vi&ecirc;n sẽ cảm thấy tự tin, năng động hơn từ đ&oacute; hiệu quả c&ocirc;ng việc v&agrave; tinh thần tập thể sẽ được n&acirc;ng cao.<br />\nC&ograve;n đối với kh&aacute;ch h&agrave;ng th&igrave; rất dễ d&agrave;ng g&acirc;y ấn tượng tốt với họ. Con người rất dễ bị ảnh hưởng bởi về bề ngo&agrave;i của người kh&aacute;c. V&igrave; thế việc đầu tư v&agrave;o may dong phuc cong so đẹp l&agrave; rất c&oacute; t&aacute;c dụng.</p>\n', '', 2, '2016-07-11 14:04:26', '2016-07-11 14:02:00', '2016-07-11 18:04:26', 8, 26, 1, 0),
(25, 'Áo Thun Đồng Phục 001', 'ao-thun-dong-phuc-001', 'products/AoThunDongPhuc/', 'AoThunDongPhuc001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom : </strong>theo chuẩn form của <strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size : </strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-20 23:15:04', '2016-10-27 15:35:00', '2016-10-27 19:35:40', 54, 8, 1, 0),
(27, 'Áo Khoác 002', 'ao-khoac-002', 'products/AoKhoac/', 'AoKhoac002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:41:15', '2016-10-27 05:55:00', '2016-10-27 18:21:49', 52, 7, 1, 0),
(28, 'Áo Khoác 003', 'ao-khoac-003', 'products/AoKhoac/', 'AoKhoac003.jpg', '', '', '', 2, '2016-10-21 18:41:50', '2016-10-21 18:41:00', '2016-10-21 22:41:50', 0, 0, 1, 0),
(29, 'Áo Khoác 008', 'ao-khoac-008', 'products/AoKhoac/', 'AoKhoac008.jpg', '', '', '', 2, '2016-10-21 18:42:56', '2016-10-21 18:42:00', '2016-10-21 22:42:56', 0, 0, 1, 0),
(30, 'Áo Khoác 003', 'ao-khoac-003', 'products/AoKhoac/', 'AoKhoac003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 3 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh coban&nbsp;phối xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:44:32', '2016-10-27 05:00:00', '2016-10-27 18:21:32', 52, 6, 1, 0),
(31, 'Áo Khoác 008', 'ao-khoac-008', 'products/AoKhoac/', 'AoKhoac008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;bo thun phối sọc&nbsp;kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh biển&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:45:26', '2016-10-27 01:15:00', '2016-10-27 18:15:10', 52, 7, 1, 0),
(32, 'Áo Khoác 009', 'ao-khoac-009', 'products/AoKhoac/', 'AoKhoac009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp, d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:46:05', '2016-10-27 01:15:00', '2016-10-27 18:14:55', 52, 7, 1, 0),
(33, 'Áo Khoác 010', 'ao-khoac-010', 'products/AoKhoac/', 'AoKhoac010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:46:48', '2016-10-27 01:10:00', '2016-10-27 18:14:40', 52, 7, 1, 0),
(34, 'Áo Khoác 011', 'ao-khoac-011', 'products/AoKhoac/', 'AoKhoac011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;cam phối xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:47:48', '2016-10-27 01:10:00', '2016-10-27 18:14:28', 52, 5, 1, 0),
(35, 'Áo Khoác 012', 'ao-khoac-012', 'products/AoKhoac/', 'AoKhoac012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối m&agrave;u ở tay&nbsp;kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối v&agrave;ng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:48:36', '2016-10-27 01:05:00', '2016-10-27 18:13:57', 52, 8, 1, 0),
(36, 'Áo Khoác 013', 'ao-khoac-013', 'products/AoKhoac/', 'AoKhoac013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp n&uacute;t bấm&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp; theo chuẩn m&agrave;u pantone&nbsp;</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:49:26', '2016-10-27 01:05:00', '2016-10-27 18:13:42', 52, 6, 1, 0),
(37, 'Áo Khoác 014', 'ao-khoac-014', 'products/AoKhoac/', 'AoKhoac014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh da ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:50:10', '2016-10-27 01:00:00', '2016-10-27 18:13:25', 52, 6, 1, 0),
(38, 'Áo Khoác 015', 'ao-khoac-015', 'products/AoKhoac/', 'AoKhoac015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>xanh coban phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:51:16', '2016-10-27 01:00:00', '2016-10-27 18:13:11', 52, 6, 1, 0),
(39, 'Áo Khoác 016', 'ao-khoac-016', 'products/AoKhoac/', 'AoKhoac016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp, bo thun&nbsp;kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:51:52', '2016-10-27 00:55:00', '2016-10-27 18:12:56', 52, 6, 1, 0),
(40, 'Áo Khoác 017', 'ao-khoac-017', 'products/AoKhoac/', 'AoKhoac017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 3 lớp,&nbsp;phối&nbsp;m&agrave;u ở cổ v&agrave; bo tay</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:52:49', '2016-10-27 00:55:00', '2016-10-27 18:12:32', 52, 7, 1, 0),
(41, 'Áo Khoác 018', 'ao-khoac-018', 'products/AoKhoac/', 'AoKhoac018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thu đ&ocirc;ng</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải kaki , micro cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp, kh&oacute;a k&eacute;o t&uacute;i thời trang kết hợp với n&uacute;t bấm</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;n&acirc;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:53:33', '2016-10-27 00:50:00', '2016-10-27 18:12:18', 52, 6, 1, 0),
(42, 'Áo Khoác 019', 'ao-khoac-019', 'products/AoKhoac/', 'AoKhoac019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải thời trang hoa văn cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:54:14', '2016-10-27 00:50:00', '2016-10-27 18:12:05', 52, 5, 1, 0),
(43, 'Áo Khoác 020', 'ao-khoac-020', 'products/AoKhoac/', 'AoKhoac020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp phối m&agrave;u độc đ&aacute;o</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 18:55:02', '2016-10-27 00:45:00', '2016-10-27 18:11:49', 52, 5, 1, 0),
(44, 'Áo Khoác 021', 'ao-khoac-021', 'products/AoKhoac/', 'AoKhoac021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;chạy viền ở tay phong c&aacute;ch</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:36:49', '2016-10-27 00:40:00', '2016-10-27 18:11:33', 52, 6, 1, 0),
(45, 'Áo Khoác 022', 'ao-khoac-022', 'products/AoKhoac/', 'AoKhoac022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:37:38', '2016-10-27 00:40:00', '2016-10-27 18:11:20', 52, 5, 1, 0),
(46, 'Áo Khoác 023', 'ao-khoac-023', 'products/AoKhoac/', 'AoKhoac023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>Kaki cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp, t&uacute;i hộp lịch l&atilde;m sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh r&ecirc;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:38:19', '2016-10-27 00:35:00', '2016-10-27 18:11:08', 52, 5, 1, 0),
(47, 'Áo Khoác 024', 'ao-khoac-024', 'products/AoKhoac/', 'AoKhoac024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải nỉ nhập khẩu</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o c&oacute; n&oacute;n kết hợp với n&uacute;t bấm tạo n&ecirc;n sự trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;x&aacute;m trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:39:27', '2016-10-27 00:35:00', '2016-10-27 18:10:48', 52, 6, 1, 0),
(48, 'Áo Khoác 025', 'ao-khoac-025', 'products/AoKhoac/', 'AoKhoac025.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:40:10', '2016-10-27 00:30:00', '2016-10-27 18:10:16', 52, 6, 1, 0),
(49, 'Áo Khoác 026', 'ao-khoac-026', 'products/AoKhoac/', 'AoKhoac026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:40:49', '2016-10-27 00:30:00', '2016-10-27 18:10:02', 52, 5, 1, 0),
(50, 'Áo Khoác 027', 'ao-khoac-027', 'products/AoKhoac/', 'AoKhoac027.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro &nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp thể thao kết hợp với viền phản quang trước ngực&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:41:27', '2016-10-27 00:25:00', '2016-10-27 18:09:48', 52, 5, 1, 0),
(51, 'Áo Khoác 028', 'ao-khoac-028', 'products/AoKhoac/', 'AoKhoac028.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro &nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp thể thao</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:43:30', '2016-10-27 00:25:00', '2016-10-27 18:09:35', 52, 6, 1, 0),
(52, 'Áo Khoác 029', 'ao-khoac-029', 'products/AoKhoac/', 'AoKhoac029.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; cao cấp&nbsp;</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp chống thấm nước rất tốt</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng tinh ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:44:15', '2016-10-27 00:20:00', '2016-10-27 18:09:09', 52, 5, 1, 0),
(53, 'Áo Khoác 030', 'ao-khoac-030', 'products/AoKhoac/', 'AoKhoac030.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:46:04', '2016-10-27 00:15:00', '2016-10-27 18:08:55', 52, 6, 1, 0),
(54, 'Áo Khoác 031', 'ao-khoac-031', 'products/AoKhoac/', 'AoKhoac031.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro cao cấp&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh biển&nbsp;phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:46:45', '2016-10-27 00:15:00', '2016-10-27 18:08:40', 52, 5, 1, 0),
(55, 'Áo Khoác 032', 'ao-khoac-032', 'products/AoKhoac/', 'AoKhoac032.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp; đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:47:42', '2016-10-27 00:10:00', '2016-10-27 18:08:15', 52, 6, 1, 0),
(56, 'Áo Khoác 033', 'ao-khoac-033', 'products/AoKhoac/', 'AoKhoac033.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh E ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:48:42', '2016-10-27 00:05:00', '2016-10-27 18:08:01', 52, 6, 1, 0),
(57, 'Áo Khoác 034', 'ao-khoac-034', 'products/AoKhoac/', 'AoKhoac034.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; phối đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:49:28', '2016-10-27 00:05:00', '2016-10-27 18:07:45', 52, 6, 1, 0),
(58, 'Áo Khoác 035', 'ao-khoac-035', 'products/AoKhoac/', 'AoKhoac035.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro &nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp phối m&agrave;u độc đ&aacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp; theo chuẩn m&agrave;u pantone&nbsp;</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:50:06', '2016-10-27 00:00:00', '2016-10-27 18:07:10', 52, 8, 1, 0),
(59, 'Áo Khoác 036', 'ao-khoac-036', 'products/AoKhoac/', 'AoKhoac036.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải gi&oacute; , dầu&nbsp;, su&yacute;t , micro , nỉ&nbsp;...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>&aacute;o kho&aacute;c 2 lớp,&nbsp;phối 2 m&agrave;u kết hợp với d&acirc;y kh&oacute;a k&eacute;o&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; thiết kế&nbsp;theo form ch&acirc;u &aacute;&nbsp;</p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối xanh E&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:50:43', '2016-10-27 00:00:00', '2016-10-27 18:06:53', 52, 10, 1, 0),
(60, 'Áo Thun Đồng Phục 002', 'ao-thun-dong-phuc-002', 'products/AoThunDongPhuc/', 'AoThunDongPhuc002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:52:37', '2016-10-27 15:35:00', '2016-10-27 19:35:19', 54, 7, 1, 0),
(61, 'Áo Thun Đồng Phục 003', 'ao-thun-dong-phuc-003', 'products/AoThunDongPhuc/', 'AoThunDongPhuc003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o viền&nbsp;cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:53:06', '2016-10-27 15:35:00', '2016-10-27 19:35:07', 54, 5, 1, 0),
(62, 'Áo Thun Đồng Phục 004', 'ao-thun-dong-phuc-004', 'products/AoThunDongPhuc/', 'AoThunDongPhuc004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:53:43', '2016-10-27 15:34:00', '2016-10-27 19:34:56', 54, 3, 1, 0),
(63, 'Áo Thun Đồng Phục 005', 'ao-thun-dong-phuc-005', 'products/AoThunDongPhuc/', 'AoThunDongPhuc005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o viền&nbsp;cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 19:54:10', '2016-10-27 15:34:00', '2016-10-27 19:34:44', 54, 5, 1, 0);
INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(64, 'Áo Thun Đồng Phục 006', 'ao-thun-dong-phuc-006', 'products/AoThunDongPhuc/', 'AoThunDongPhuc006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:35:05', '2016-10-27 15:34:00', '2016-10-27 19:34:18', 54, 3, 1, 0),
(65, 'Áo Thun Đồng Phục 007', 'ao-thun-dong-phuc-007', 'products/AoThunDongPhuc/', 'AoThunDongPhuc007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:35:34', '2016-10-27 15:33:00', '2016-10-27 19:34:06', 54, 7, 1, 0),
(66, 'Áo Thun Đồng Phục 008', 'ao-thun-dong-phuc-008', 'products/AoThunDongPhuc/', 'AoThunDongPhuc008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:36:04', '2016-10-27 15:33:00', '2016-10-27 19:33:55', 54, 3, 1, 0),
(67, 'Áo Thun Đồng Phục 009', 'ao-thun-dong-phuc-009', 'products/AoThunDongPhuc/', 'AoThunDongPhuc009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:36:43', '2016-10-27 15:33:00', '2016-10-27 19:33:43', 54, 4, 1, 0),
(68, 'Áo Thun Đồng Phục 010', 'ao-thun-dong-phuc-010', 'products/AoThunDongPhuc/', 'AoThunDongPhuc010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:37:25', '2016-10-27 15:33:00', '2016-10-27 19:33:32', 54, 5, 1, 0),
(69, 'Áo Thun Đồng Phục 011', 'ao-thun-dong-phuc-011', 'products/AoThunDongPhuc/', 'AoThunDongPhuc011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:37:59', '2016-10-27 15:33:00', '2016-10-27 19:33:14', 54, 3, 1, 0),
(70, 'Áo Thun Đồng Phục 012', 'ao-thun-dong-phuc-012', 'products/AoThunDongPhuc/', 'AoThunDongPhuc012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:38:30', '2016-10-27 15:32:00', '2016-10-27 19:32:57', 54, 3, 1, 0),
(71, 'Áo Thun Đồng Phục 013', 'ao-thun-dong-phuc-013', 'products/AoThunDongPhuc/', 'AoThunDongPhuc013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:38:58', '2016-10-27 15:32:00', '2016-10-27 19:32:47', 54, 3, 1, 0),
(72, 'Áo Thun Đồng Phục 014', 'ao-thun-dong-phuc-014', 'products/AoThunDongPhuc/', 'AoThunDongPhuc014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:39:33', '2016-10-27 15:32:00', '2016-10-27 19:32:36', 54, 5, 1, 0),
(73, 'Áo Thun Đồng Phục 015', 'ao-thun-dong-phuc-015', 'products/AoThunDongPhuc/', 'AoThunDongPhuc015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o m&agrave;u t&iacute;m trẻ trung&nbsp;</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:40:09', '2016-10-27 15:32:00', '2016-10-27 19:32:25', 54, 4, 1, 0),
(74, 'Áo Thun Đồng Phục 016', 'ao-thun-dong-phuc-016', 'products/AoThunDongPhuc/', 'AoThunDongPhuc016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:41:21', '2016-10-27 15:32:00', '2016-10-27 19:32:14', 54, 4, 1, 0),
(75, 'Áo Thun Đồng Phục 017', 'ao-thun-dong-phuc-017', 'products/AoThunDongPhuc/', 'AoThunDongPhuc017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o m&agrave;u xanh biển&nbsp;năng động</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:42:06', '2016-10-27 15:31:00', '2016-10-27 19:32:04', 54, 4, 1, 0),
(76, 'Áo Thun Đồng Phục 018', 'ao-thun-dong-phuc-018', 'products/AoThunDongPhuc/', 'AoThunDongPhuc018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:42:40', '2016-10-27 15:31:00', '2016-10-27 19:31:53', 54, 2, 1, 0),
(77, 'Áo Thun Đồng Phục 019', 'ao-thun-dong-phuc-019', 'products/AoThunDongPhuc/', 'AoThunDongPhuc019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:43:13', '2016-10-27 15:31:00', '2016-10-27 19:31:39', 54, 4, 1, 0),
(78, 'Áo Thun Đồng Phục 020', 'ao-thun-dong-phuc-020', 'products/AoThunDongPhuc/', 'AoThunDongPhuc020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:43:51', '2016-10-27 15:31:00', '2016-10-27 19:31:29', 54, 3, 1, 0),
(79, 'Áo Thun Đồng Phục 021', 'ao-thun-dong-phuc-021', 'products/AoThunDongPhuc/', 'AoThunDongPhuc021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:44:24', '2016-10-27 15:31:00', '2016-10-27 19:31:18', 54, 3, 1, 0),
(80, 'Áo Thun Đồng Phục 022', 'ao-thun-dong-phuc-022', 'products/AoThunDongPhuc/', 'AoThunDongPhuc022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; tru&nbsp;tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:44:56', '2016-10-27 15:30:00', '2016-10-27 19:31:03', 54, 2, 1, 0),
(81, 'Áo Thun Đồng Phục 023', 'ao-thun-dong-phuc-023', 'products/AoThunDongPhuc/', 'AoThunDongPhuc023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:45:40', '2016-10-27 15:30:00', '2016-10-27 19:30:52', 54, 4, 1, 0),
(82, 'Áo Thun Đồng Phục 024', 'ao-thun-dong-phuc-024', 'products/AoThunDongPhuc/', 'AoThunDongPhuc024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o viền&nbsp;cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:46:13', '2016-10-27 15:30:00', '2016-10-27 19:30:42', 54, 2, 1, 0),
(83, 'Áo Thun Đồng Phục 025', 'ao-thun-dong-phuc-025', 'products/AoThunDongPhuc/', 'AoThunDongPhuc025.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:46:49', '2016-10-27 15:30:00', '2016-10-27 19:30:30', 54, 2, 1, 0),
(84, 'Áo Thun Đồng Phục 026', 'ao-thun-dong-phuc-026', 'products/AoThunDongPhuc/', 'AoThunDongPhuc026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:47:18', '2016-10-27 15:30:00', '2016-10-27 19:30:18', 54, 2, 1, 0),
(85, 'Áo Thun Đồng Phục 027', 'ao-thun-dong-phuc-027', 'products/AoThunDongPhuc/', 'AoThunDongPhuc027.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o m&agrave;u đỏ c&aacute; t&iacute;nh gi&agrave;u năng lượng</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:47:48', '2016-10-27 15:29:00', '2016-10-27 19:30:01', 54, 2, 1, 0),
(86, 'Áo Thun Đồng Phục 028', 'ao-thun-dong-phuc-028', 'products/AoThunDongPhuc/', 'AoThunDongPhuc028.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o m&agrave;u v&agrave;ng chanh tạo n&ecirc;n n&eacute;t h&agrave;i h&ograve;a nơi l&agrave;m việc</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:48:28', '2016-10-27 15:29:00', '2016-10-27 19:29:50', 54, 4, 1, 0),
(87, 'Áo Thun Đồng Phục 029', 'ao-thun-dong-phuc-029', 'products/AoThunDongPhuc/', 'AoThunDongPhuc029.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o m&agrave;u xanh da&nbsp;tạo n&ecirc;n sự năng động trong c&ocirc;ng việc</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:49:19', '2016-10-27 15:29:00', '2016-10-27 19:29:32', 54, 2, 1, 0),
(88, 'Áo Thun Đồng Phục 030', 'ao-thun-dong-phuc-030', 'products/AoThunDongPhuc/', 'AoThunDongPhuc030.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:49:54', '2016-10-27 15:29:00', '2016-10-27 19:29:21', 54, 3, 1, 0),
(89, 'Áo Thun Đồng Phục 031', 'ao-thun-dong-phuc-031', 'products/AoThunDongPhuc/', 'AoThunDongPhuc031.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:50:24', '2016-10-27 15:29:00', '2016-10-27 19:29:10', 54, 4, 1, 0),
(90, 'Áo Thun Đồng Phục 032', 'ao-thun-dong-phuc-032', 'products/AoThunDongPhuc/', 'AoThunDongPhuc032.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:50:54', '2016-10-27 15:28:00', '2016-10-27 19:28:59', 54, 3, 1, 0),
(91, 'Áo Thun Đồng Phục 033', 'ao-thun-dong-phuc-033', 'products/AoThunDongPhuc/', 'AoThunDongPhuc033.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:51:23', '2016-10-27 15:28:00', '2016-10-27 19:28:49', 54, 2, 1, 0),
(92, 'Áo Thun Đồng Phục 034', 'ao-thun-dong-phuc-034', 'products/AoThunDongPhuc/', 'AoThunDongPhuc034.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:51:56', '2016-10-27 15:28:00', '2016-10-27 19:28:36', 54, 3, 1, 0),
(93, 'Áo Thun Đồng Phục 035', 'ao-thun-dong-phuc-035', 'products/AoThunDongPhuc/', 'AoThunDongPhuc035.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:52:33', '2016-10-27 15:28:00', '2016-10-27 19:28:27', 54, 5, 1, 0),
(94, 'Áo Thun Đồng Phục 036', 'ao-thun-dong-phuc-036', 'products/AoThunDongPhuc/', 'AoThunDongPhuc036.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:53:17', '2016-10-27 15:28:00', '2016-10-27 19:28:16', 54, 2, 1, 0),
(95, 'Áo Thun Đồng Phục 037', 'ao-thun-dong-phuc-037', 'products/AoThunDongPhuc/', 'AoThunDongPhuc037.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:53:53', '2016-10-27 15:27:00', '2016-10-27 19:28:05', 54, 2, 1, 0),
(96, 'Áo Thun Đồng Phục 038', 'ao-thun-dong-phuc-038', 'products/AoThunDongPhuc/', 'AoThunDongPhuc038.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:54:23', '2016-10-27 15:27:00', '2016-10-27 19:27:54', 54, 3, 1, 0),
(97, 'Áo Thun Đồng Phục 039', 'ao-thun-dong-phuc-039', 'products/AoThunDongPhuc/', 'AoThunDongPhuc039.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:54:54', '2016-10-27 15:27:00', '2016-10-27 19:27:44', 54, 3, 1, 0),
(98, 'Áo Thun Đồng Phục 040', 'ao-thun-dong-phuc-040', 'products/AoThunDongPhuc/', 'AoThunDongPhuc040.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:55:35', '2016-10-27 15:27:00', '2016-10-27 19:27:29', 54, 3, 1, 0),
(99, 'Áo Thun Đồng Phục 041', 'ao-thun-dong-phuc-041', 'products/AoThunDongPhuc/', 'AoThunDongPhuc041.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:56:16', '2016-10-27 15:27:00', '2016-10-27 19:27:18', 54, 4, 1, 0),
(100, 'Áo Thun Đồng Phục 042', 'ao-thun-dong-phuc-042', 'products/AoThunDongPhuc/', 'AoThunDongPhuc042.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:56:46', '2016-10-27 15:26:00', '2016-10-27 19:27:04', 54, 3, 1, 0),
(101, 'Áo Thun Đồng Phục 043', 'ao-thun-dong-phuc-043', 'products/AoThunDongPhuc/', 'AoThunDongPhuc043.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:57:13', '2016-10-27 15:26:00', '2016-10-27 19:26:54', 54, 2, 1, 0),
(102, 'Áo Thun Đồng Phục 044', 'ao-thun-dong-phuc-044', 'products/AoThunDongPhuc/', 'AoThunDongPhuc044.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:57:49', '2016-10-27 15:26:00', '2016-10-27 19:26:44', 54, 2, 1, 0),
(103, 'Áo Thun Đồng Phục 045', 'ao-thun-dong-phuc-045', 'products/AoThunDongPhuc/', 'AoThunDongPhuc045.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:58:18', '2016-10-27 15:26:00', '2016-10-27 19:26:33', 54, 2, 1, 0),
(104, 'Áo Thun Đồng Phục 046', 'ao-thun-dong-phuc-046', 'products/AoThunDongPhuc/', 'AoThunDongPhuc046.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:58:52', '2016-10-27 15:26:00', '2016-10-27 19:26:18', 54, 3, 1, 0),
(105, 'Áo Thun Đồng Phục 047', 'ao-thun-dong-phuc-047', 'products/AoThunDongPhuc/', 'AoThunDongPhuc047.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 20:59:26', '2016-10-27 15:26:00', '2016-10-27 19:26:07', 54, 2, 1, 0),
(106, 'Áo Thun Đồng Phục 048', 'ao-thun-dong-phuc-048', 'products/AoThunDongPhuc/', 'AoThunDongPhuc048.jpg', '', '', '', 2, '2016-10-21 20:59:59', '2016-10-27 15:25:00', '2016-10-27 19:25:53', 54, 2, 1, 0),
(107, 'Áo Thun Quảng Cáo 001', 'ao-thun-quang-cao-001', 'products/AoThunQuangCao/', 'AoThunQuangCao001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:05:44', '2016-10-27 15:23:00', '2016-10-27 19:23:30', 54, 3, 1, 0),
(108, 'Áo Thun Quảng Cáo 002', 'ao-thun-quang-cao-002', 'products/AoThunQuangCao/', 'AoThunQuangCao002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:06:42', '2016-10-27 15:23:00', '2016-10-27 19:23:19', 54, 3, 1, 0);
INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(109, 'Áo Thun Quảng Cáo 003', 'ao-thun-quang-cao-003', 'products/AoThunQuangCao/', 'AoThunQuangCao003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in logo</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:07:13', '2016-10-27 15:22:00', '2016-10-27 19:23:02', 54, 3, 1, 0),
(110, 'Áo Thun Quảng Cáo 004', 'ao-thun-quang-cao-004', 'products/AoThunQuangCao/', 'AoThunQuangCao004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in logo</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:07:40', '2016-10-27 15:22:00', '2016-10-27 19:22:50', 54, 2, 1, 0),
(111, 'Áo Thun Quảng Cáo 005', 'ao-thun-quang-cao-005', 'products/AoThunQuangCao/', 'AoThunQuangCao005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ in logo</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:08:06', '2016-10-27 15:22:00', '2016-10-27 19:22:37', 54, 3, 1, 0),
(112, 'Áo Thun Quảng Cáo 006', 'ao-thun-quang-cao-006', 'products/AoThunQuangCao/', 'AoThunQuangCao006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:08:34', '2016-10-27 15:22:00', '2016-10-27 19:22:21', 54, 2, 1, 0),
(113, 'Áo Thun Quảng Cáo 007', 'ao-thun-quang-cao-007', 'products/AoThunQuangCao/', 'AoThunQuangCao007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:09:31', '2016-10-27 15:22:00', '2016-10-27 19:22:08', 54, 2, 1, 0),
(114, 'Áo Thun Quảng Cáo 008', 'ao-thun-quang-cao-008', 'products/AoThunQuangCao/', 'AoThunQuangCao008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:09:59', '2016-10-27 15:21:00', '2016-10-27 19:21:55', 54, 3, 1, 0),
(115, 'Áo Thun Quảng Cáo 009', 'ao-thun-quang-cao-009', 'products/AoThunQuangCao/', 'AoThunQuangCao009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in cao cấp</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:10:30', '2016-10-27 15:21:00', '2016-10-27 19:21:34', 54, 2, 1, 0),
(116, 'Áo Thun Quảng Cáo 010', 'ao-thun-quang-cao-010', 'products/AoThunQuangCao/', 'AoThunQuangCao010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun quảng c&aacute;o cổ tr&ograve;n</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:10:58', '2016-10-27 15:21:00', '2016-10-27 19:21:21', 54, 2, 1, 0),
(117, 'Áo Thun Quảng Cáo 011', 'ao-thun-quang-cao-011', 'products/AoThunQuangCao/', 'AoThunQuangCao011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in chất lượng cao</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:11:25', '2016-10-27 15:21:00', '2016-10-27 19:21:11', 54, 7, 1, 0),
(118, 'Áo Thun Quảng Cáo 012', 'ao-thun-quang-cao-012', 'products/AoThunQuangCao/', 'AoThunQuangCao012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:11:56', '2016-10-27 15:20:00', '2016-10-27 19:21:00', 54, 4, 1, 0),
(119, 'Áo Thun Quảng Cáo 013', 'ao-thun-quang-cao-013', 'products/AoThunQuangCao/', 'AoThunQuangCao013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:12:30', '2016-10-27 15:20:00', '2016-10-27 19:20:49', 54, 3, 1, 0),
(120, 'Áo Thun Quảng Cáo 014', 'ao-thun-quang-cao-014', 'products/AoThunQuangCao/', 'AoThunQuangCao014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in chất lượng cao</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:12:58', '2016-10-27 15:20:00', '2016-10-27 19:20:34', 54, 2, 1, 0),
(121, 'Áo Thun Quảng Cáo 015', 'ao-thun-quang-cao-015', 'products/AoThunQuangCao/', 'AoThunQuangCao015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:13:27', '2016-10-27 15:20:00', '2016-10-27 19:20:23', 54, 4, 1, 0),
(122, 'Áo Thun Quảng Cáo 016', 'ao-thun-quang-cao-016', 'products/AoThunQuangCao/', 'AoThunQuangCao016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:14:00', '2016-10-27 15:20:00', '2016-10-27 19:20:12', 54, 3, 1, 0),
(123, 'Áo Thun Quảng Cáo 017', 'ao-thun-quang-cao-017', 'products/AoThunQuangCao/', 'AoThunQuangCao017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:14:30', '2016-10-27 15:19:00', '2016-10-27 19:20:01', 54, 2, 1, 0),
(124, 'Áo Thun Quảng Cáo 018', 'ao-thun-quang-cao-018', 'products/AoThunQuangCao/', 'AoThunQuangCao018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in chất lượng cao</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:15:01', '2016-10-27 15:19:00', '2016-10-27 19:19:50', 54, 3, 1, 0),
(125, 'Áo Thun Quảng Cáo 019', 'ao-thun-quang-cao-019', 'products/AoThunQuangCao/', 'AoThunQuangCao019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave;&nbsp;tay rap-lan tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:15:28', '2016-10-27 15:19:00', '2016-10-27 19:19:39', 54, 4, 1, 0),
(126, 'Áo Thun Quảng Cáo 020', 'ao-thun-quang-cao-020', 'products/AoThunQuangCao/', 'AoThunQuangCao020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o viền&nbsp;cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:16:01', '2016-10-27 15:19:00', '2016-10-27 19:19:29', 54, 2, 1, 0),
(127, 'Áo Thun Quảng Cáo 021', 'ao-thun-quang-cao-021', 'products/AoThunQuangCao/', 'AoThunQuangCao021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ trụ</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:16:28', '2016-10-27 15:19:00', '2016-10-27 19:19:16', 54, 3, 1, 0),
(128, 'Áo Thun Quảng Cáo 022', 'ao-thun-quang-cao-022', 'products/AoThunQuangCao/', 'AoThunQuangCao022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:16:56', '2016-10-27 15:18:00', '2016-10-27 19:19:02', 54, 3, 1, 0),
(129, 'Áo Thun Quảng Cáo 023', 'ao-thun-quang-cao-023', 'products/AoThunQuangCao/', 'AoThunQuangCao023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o cổ tr&ograve;n phối trước th&acirc;n phong c&aacute;ch</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:17:28', '2016-10-27 15:18:00', '2016-10-27 19:18:52', 54, 2, 1, 0),
(130, 'Áo Thun Quảng Cáo 024', 'ao-thun-quang-cao-024', 'products/AoThunQuangCao/', 'AoThunQuangCao024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in chất lượng cao</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:17:58', '2016-10-27 15:18:00', '2016-10-27 19:18:40', 54, 4, 1, 0),
(131, 'Áo Thun Quảng Cáo 025', 'ao-thun-quang-cao-025', 'products/AoThunQuangCao/', 'AoThunQuangCao025.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o thun cổ tr&ograve;n in chất lượng cao</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:18:38', '2016-10-27 15:18:00', '2016-10-27 19:18:29', 54, 11, 1, 0),
(132, 'Áo Thun Quảng Cáo 026', 'ao-thun-quang-cao-026', 'products/AoThunQuangCao/', 'AoThunQuangCao026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton/ c&aacute; sấu ( co gi&atilde;n&nbsp;: 2 chiều, 4 chiều ; h&agrave;m lượng : 100%, 65/35, polyester )</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;&aacute;o phối cổ v&agrave; bo tay tạo n&ecirc;n n&eacute;t độc đ&aacute;o trong phong c&aacute;ch đồng phục của bạn</p>\n\n<p><strong>- Phom :&nbsp;</strong>theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p><strong>- Size :&nbsp;</strong>S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:19:10', '2016-10-27 15:18:00', '2016-10-27 19:18:18', 54, 8, 1, 0),
(133, 'Balo Quảng Cáo 001', 'balo-quang-cao-001', 'products/BaloTuiXach/', 'BaloQuangCao001.jpg', '', '', '', 2, '2016-10-21 21:20:30', '2016-10-21 21:19:00', '2016-10-22 01:20:30', 0, 0, 1, 0),
(134, 'Balo Quảng Cáo 001', 'balo-quang-cao-001', 'products/BaloTuiXach/', 'BaloQuangCao001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3 ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:21:18', '2016-10-27 15:03:00', '2016-10-27 19:03:50', 60, 6, 1, 0),
(135, 'Balo Quảng Cáo 002', 'balo-quang-cao-002', 'products/BaloTuiXach/', 'BaloQuangCao002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3 ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:21:44', '2016-10-27 15:03:00', '2016-10-27 19:03:39', 60, 3, 1, 0),
(136, 'Balo Quảng Cáo 003', 'balo-quang-cao-003', 'products/BaloTuiXach/', 'BaloQuangCao003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:22:09', '2016-10-27 15:03:00', '2016-10-27 19:03:29', 60, 6, 1, 0),
(137, 'Balo Quảng Cáo 004', 'balo-quang-cao-004', 'products/BaloTuiXach/', 'BaloQuangCao004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:22:48', '2016-10-27 15:03:00', '2016-10-27 19:03:18', 60, 3, 1, 0),
(138, 'Balo Quảng Cáo 005', 'balo-quang-cao-005', 'products/BaloTuiXach/', 'BaloQuangCao005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học,đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế hợp thời trang</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:23:18', '2016-10-27 15:03:00', '2016-10-27 19:03:07', 60, 4, 1, 0),
(139, 'Balo Quảng Cáo 006', 'balo-quang-cao-006', 'products/BaloTuiXach/', 'BaloQuangCao006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải shop, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:23:48', '2016-10-27 15:02:00', '2016-10-27 19:02:57', 60, 3, 1, 0),
(140, 'Balo Quảng Cáo 007', 'balo-quang-cao-007', 'products/BaloTuiXach/', 'BaloQuangCao007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:24:27', '2016-10-27 15:02:00', '2016-10-27 19:02:47', 60, 3, 1, 0),
(141, 'Balo Quảng Cáo 008', 'balo-quang-cao-008', 'products/BaloTuiXach/', 'BaloQuangCao008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:24:52', '2016-10-27 15:02:00', '2016-10-27 19:02:35', 60, 3, 1, 0),
(142, 'Balo Quảng Cáo 009', 'balo-quang-cao-009', 'products/BaloTuiXach/', 'BaloQuangCao009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để&nbsp;đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:25:28', '2016-10-27 15:02:00', '2016-10-27 19:02:25', 60, 3, 1, 0),
(143, 'Balo Quảng Cáo 010', 'balo-quang-cao-010', 'products/BaloTuiXach/', 'BaloQuangCao010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:26:12', '2016-10-27 15:02:00', '2016-10-27 19:02:14', 60, 3, 1, 0),
(144, 'Balo Quảng Cáo 011', 'balo-quang-cao-011', 'products/BaloTuiXach/', 'BaloQuangCao011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:26:48', '2016-10-27 15:01:00', '2016-10-27 19:02:03', 60, 3, 1, 0),
(145, 'Balo Quảng Cáo 012', 'balo-quang-cao-012', 'products/BaloTuiXach/', 'BaloQuangCao012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, da,&nbsp;l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:27:16', '2016-10-27 15:01:00', '2016-10-27 19:01:49', 60, 4, 1, 0),
(146, 'Balo Quảng Cáo 013', 'balo-quang-cao-013', 'products/BaloTuiXach/', 'BaloQuangCao013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420,vảisimili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:27:51', '2016-10-27 15:01:00', '2016-10-27 19:01:35', 60, 3, 1, 0),
(147, 'Balo Quảng Cáo 014', 'balo-quang-cao-014', 'products/BaloTuiXach/', 'BaloQuangCao014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:28:20', '2016-10-27 15:01:00', '2016-10-27 19:01:25', 60, 3, 1, 0),
(148, 'Balo Quảng Cáo 015', 'balo-quang-cao-015', 'products/BaloTuiXach/', 'BaloQuangCao015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simila, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:29:03', '2016-10-27 15:01:00', '2016-10-27 19:01:10', 60, 4, 1, 0),
(149, 'Balo Quảng Cáo 016', 'balo-quang-cao-016', 'products/BaloTuiXach/', 'BaloQuangCao017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:29:40', '2016-10-27 15:00:00', '2016-10-27 19:00:59', 60, 4, 1, 0),
(150, 'Balo Quảng Cáo 017', 'balo-quang-cao-017', 'products/BaloTuiXach/', 'BaloQuangCao017_2.jpg', '', '', '', 2, '2016-10-21 21:30:28', '2016-10-27 15:00:00', '2016-10-27 19:00:17', 60, 3, 1, 0),
(151, 'Balo Quảng Cáo 018', 'balo-quang-cao-018', 'products/BaloTuiXach/', 'BaloQuangCao018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420,vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:31:02', '2016-10-27 14:59:00', '2016-10-27 18:59:18', 60, 5, 1, 0),
(152, 'Balo Quảng Cáo 019', 'balo-quang-cao-019', 'products/BaloTuiXach/', 'BaloQuangCao019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:31:39', '2016-10-27 14:58:00', '2016-10-27 18:59:06', 60, 2, 1, 0),
(153, 'Balo Quảng Cáo 020', 'balo-quang-cao-020', 'products/BaloTuiXach/', 'BaloQuangCao020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:32:19', '2016-10-27 14:58:00', '2016-10-27 18:58:54', 60, 3, 1, 0),
(154, 'Balo Quảng Cáo 021', 'balo-quang-cao-021', 'products/BaloTuiXach/', 'BaloQuangCao021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:32:51', '2016-10-27 14:58:00', '2016-10-27 18:58:42', 60, 4, 1, 0),
(155, 'Balo Quảng Cáo 022', 'balo-quang-cao-022', 'products/BaloTuiXach/', 'BaloQuangCao022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm,vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo được thiết kế 2 ngăn phụ mặt trước tiện lợi, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:33:23', '2016-10-27 14:58:00', '2016-10-27 18:58:30', 60, 3, 1, 0),
(156, 'Balo Quảng Cáo 023', 'balo-quang-cao-023', 'products/BaloTuiXach/', 'BaloQuangCao023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải shop hoa văn&nbsp;thời trang,&nbsp;l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước balo để tạo điểm nhấn&nbsp;l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:33:56', '2016-10-27 14:58:00', '2016-10-27 18:58:18', 60, 2, 1, 0),
(157, 'Balo Quảng Cáo 024', 'balo-quang-cao-024', 'products/BaloTuiXach/', 'BaloQuangCao024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:34:37', '2016-10-27 14:57:00', '2016-10-27 18:58:06', 60, 2, 1, 0);
INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(158, 'Balo Quảng Cáo 025', 'balo-quang-cao-025', 'products/BaloTuiXach/', 'BaloQuangCao025.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;: </strong>balo thời trang</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:35:12', '2016-10-27 14:57:00', '2016-10-27 18:57:55', 60, 3, 1, 0),
(159, 'Balo Quảng Cáo 026', 'balo-quang-cao-026', 'products/BaloTuiXach/', 'BaloQuangCao026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:35:42', '2016-10-27 14:57:00', '2016-10-27 18:57:45', 60, 2, 1, 0),
(160, 'Balo Quảng Cáo 027', 'balo-quang-cao-027', 'products/BaloTuiXach/', 'BaloQuangCao027.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:36:19', '2016-10-27 14:57:00', '2016-10-27 18:57:34', 60, 2, 1, 0),
(161, 'Balo Quảng Cáo 028', 'balo-quang-cao-028', 'products/BaloTuiXach/', 'BaloQuangCao028.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm, simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:36:59', '2016-10-27 14:57:00', '2016-10-27 18:57:21', 60, 5, 1, 0),
(162, 'Balo Quảng Cáo 029', 'balo-quang-cao-029', 'products/BaloTuiXach/', 'BaloQuangCao029.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:37:33', '2016-10-27 14:56:00', '2016-10-27 18:57:03', 60, 4, 1, 0),
(163, 'Balo Quảng Cáo 030', 'balo-quang-cao-030', 'products/BaloTuiXach/', 'BaloQuangCao030.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m ,thời trang</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải shop, simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:38:10', '2016-10-27 14:56:00', '2016-10-27 18:56:51', 60, 3, 1, 0),
(164, 'Balo Quảng Cáo 031', 'balo-quang-cao-031', 'products/BaloTuiXach/', 'BaloQuangCao031.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải d&ugrave; chống thấm,vải simili, da,&nbsp;l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:38:39', '2016-10-27 14:56:00', '2016-10-27 18:56:33', 60, 3, 1, 0),
(165, 'Balo Quảng Cáo 032', 'balo-quang-cao-032', 'products/BaloTuiXach/', 'BaloQuangCao032.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m , du lịch</p>\n\n<p><strong>- Chất liệu :</strong> vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:39:10', '2016-10-27 14:56:00', '2016-10-27 18:56:21', 60, 3, 1, 0),
(166, 'Balo Quảng Cáo 033', 'balo-quang-cao-033', 'products/BaloTuiXach/', 'BaloQuangCao033.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i&nbsp;x&aacute;ch k&eacute;o 2 ngăn ,thiết kế&nbsp;tinh tế, nhỏ gọn, tiện lợi cho bạn trong l&uacute;c&nbsp;du lịch.&nbsp;Logo được đặt ch&iacute;nh giữa t&uacute;i l&agrave;m nổi bật l&ecirc;n thương hiệu của bạn</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:39:58', '2016-10-27 14:55:00', '2016-10-27 18:56:06', 60, 11, 1, 0),
(167, 'Balo Quảng Cáo 034', 'balo-quang-cao-034', 'products/BaloTuiXach/', 'BaloQuangCao034.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i&nbsp;x&aacute;ch k&eacute;o 2 ngăn ,thiết kế&nbsp;tinh tế, nhỏ gọn, tiện lợi cho bạn trong l&uacute;c&nbsp;du lịch.&nbsp;Logo được đặt ch&iacute;nh giữa t&uacute;i l&agrave;m nổi bật l&ecirc;n thương hiệu của bạn</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:40:31', '2016-10-27 14:55:00', '2016-10-27 18:55:54', 60, 4, 1, 0),
(168, 'Balo Quảng Cáo 035', 'balo-quang-cao-035', 'products/BaloTuiXach/', 'BaloQuangCao035.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m, du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420,vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:41:15', '2016-10-27 14:55:00', '2016-10-27 18:55:42', 60, 2, 1, 0),
(169, 'Balo Quảng Cáo 036', 'balo-quang-cao-036', 'products/BaloTuiXach/', 'BaloQuangCao036.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 3&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ch&iacute;nh giữa balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:41:44', '2016-10-27 14:55:00', '2016-10-27 18:55:26', 60, 4, 1, 0),
(170, 'Balo Quảng Cáo 037', 'balo-quang-cao-037', 'products/BaloTuiXach/', 'BaloQuangCao037.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m, du lịch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải d&ugrave; chống th&acirc;m nước,&nbsp;vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i g&uacute;t gọn nhẹ hợp thời trang</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:42:25', '2016-10-21 21:50:00', '2016-10-27 19:07:34', 60, 3, 1, 0),
(171, 'Balo Quảng Cáo 038', 'balo-quang-cao-038', 'products/BaloTuiXach/', 'BaloQuangCao038.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi học, đi l&agrave;m</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-D600-D420, vải simili, da, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;balo 2&nbsp;ngăn, thiết kế&nbsp;tinh tế, logo được đặt ph&iacute;a trước&nbsp;balo l&agrave;m tăng độ nhận dạng thương hiệu</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:42:59', '2016-10-21 21:45:00', '2016-10-27 19:06:45', 60, 3, 1, 0),
(172, 'Túi Xách 001', 'tui-xach-001', 'products/BaloTuiXach/', 'TuiXach001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế nhỏ gọn, phối m&agrave;u tinh tế</p>\n\n<p><strong>- K&iacute;ch thước </strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:45:21', '2016-10-27 14:54:00', '2016-10-27 18:54:28', 60, 4, 1, 0),
(173, 'Túi Xách 002', 'tui-xach-002', 'products/BaloTuiXach/', 'TuiXach002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:45:58', '2016-10-27 14:54:00', '2016-10-27 18:54:15', 60, 2, 1, 0),
(174, 'Túi Xách 003', 'tui-xach-003', 'products/BaloTuiXach/', 'TuiXach003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:47:12', '2016-10-27 14:53:00', '2016-10-27 18:54:02', 60, 5, 1, 0),
(175, 'Túi Xách 004', 'tui-xach-004', 'products/BaloTuiXach/', 'TuiXach004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:47:43', '2016-10-27 14:53:00', '2016-10-27 18:53:40', 60, 2, 1, 0),
(176, 'Túi Xách 005', 'tui-xach-005', 'products/BaloTuiXach/', 'TuiXach005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:48:15', '2016-10-27 14:53:00', '2016-10-27 18:53:28', 60, 2, 1, 0),
(177, 'Túi Xách 006', 'tui-xach-006', 'products/BaloTuiXach/', 'TuiXach006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong> t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:48:45', '2016-10-27 14:52:00', '2016-10-27 18:52:44', 60, 3, 1, 0),
(178, 'Túi Xách 007', 'tui-xach-007', 'products/BaloTuiXach/', 'TuiXach007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:49:17', '2016-10-27 14:52:00', '2016-10-27 18:52:33', 60, 3, 1, 0),
(179, 'Túi Xách 008', 'tui-xach-008', 'products/BaloTuiXach/', 'TuiXach008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:49:49', '2016-10-27 14:52:00', '2016-10-27 18:52:22', 60, 3, 1, 0),
(180, 'Túi Xách 009', 'tui-xach-009', 'products/BaloTuiXach/', 'TuiXach009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:50:15', '2016-10-27 14:52:00', '2016-10-27 18:52:10', 60, 3, 1, 0),
(181, 'Túi Xách 010', 'tui-xach-010', 'products/BaloTuiXach/', 'TuiXach010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:50:52', '2016-10-27 14:51:00', '2016-10-27 18:51:22', 60, 2, 1, 0),
(182, 'Túi Xách 011', 'tui-xach-011', 'products/BaloTuiXach/', 'TuiXach011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>&nbsp;Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp để đi du lịch,&nbsp;chơi thể thao,&nbsp;picnic</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải bố 1680-vải d&ugrave; chống thấm nước, l&oacute;t ph&iacute;a trong vải 210 cao cấp</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :</strong>&nbsp;t&uacute;i x&aacute;ch 2 lớp,<strong>&nbsp;</strong>thiết kế thể thao phong c&aacute;ch</p>\n\n<p><strong>- K&iacute;ch thước&nbsp;</strong>: may theo y&ecirc;u cầu qu&yacute; kh&aacute;ch</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;nhiều m&agrave;u</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:51:28', '2016-10-27 14:51:00', '2016-10-27 18:51:09', 60, 4, 1, 0),
(183, 'Túi Xách 012', 'tui-xach-012', 'products/BaloTuiXach/', 'TuiXach012.jpg', '', '', '', 2, '2016-10-21 21:51:58', '2016-10-27 14:50:00', '2016-10-27 18:50:57', 60, 3, 1, 0),
(184, 'Đồng Phục Công Sở 001', 'dong-phuc-cong-so-001', 'products/DongPhucCongSo/', 'DongPhucCongSo001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;Sơmi nam phong c&aacute;ch trẻ trung , c&aacute; t&iacute;nh</p>\n\n<p><strong>- Chất liệu : </strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả : </strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng, kết hợp với viền ở cổ &aacute;o chạy dọc theo h&agrave;ng n&uacute;t tạo n&ecirc;n phong c&aacute;ch năng động&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của <strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng tinh kh&ocirc;i&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:53:35', '2016-10-27 14:34:00', '2016-10-27 18:34:49', 51, 12, 1, 0),
(185, 'Đồng Phục Công Sở 002', 'dong-phuc-cong-so-002', 'products/DongPhucCongSo/', 'DongPhucCongSo002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;Sơmi nam phong c&aacute;ch trẻ trung , c&aacute; t&iacute;nh</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u xanh trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh da trời&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:54:07', '2016-10-27 14:34:00', '2016-10-27 18:34:36', 51, 6, 1, 0),
(186, 'Đồng Phục Công Sở 003', 'dong-phuc-cong-so-003', 'products/DongPhucCongSo/', 'DongPhucCongSo003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;Sơmi nam phong c&aacute;ch trẻ trung , c&aacute; t&iacute;nh</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u xanh năng động</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh nước biển&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:54:41', '2016-10-27 14:34:00', '2016-10-27 18:34:25', 51, 8, 1, 0),
(187, 'Đồng Phục Công Sở 004', 'dong-phuc-cong-so-004', 'products/DongPhucCongSo/', 'DongPhucCongSo004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u hồng trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;hồng t&iacute;m&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:55:07', '2016-10-27 14:34:00', '2016-10-27 18:34:13', 51, 7, 1, 0),
(188, 'Đồng Phục Công Sở 005', 'dong-phuc-cong-so-005', 'products/DongPhucCongSo/', 'DongPhucCongSo005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng tinh kh&ocirc;i&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:55:32', '2016-10-27 14:33:00', '2016-10-27 18:34:01', 51, 9, 1, 0),
(189, 'Đồng Phục Công Sở 006', 'dong-phuc-cong-so-006', 'products/DongPhucCongSo/', 'DongPhucCongSo006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay ngắn với vải kẻ sọc kết hợp với điểm nhấn ở cổ v&agrave; tay &aacute;o tạo n&ecirc;n sự trẻ trung c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;kẻ sọc đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:56:08', '2016-10-27 14:33:00', '2016-10-27 18:33:48', 51, 6, 1, 0),
(190, 'Đồng Phục Công Sở 007', 'dong-phuc-cong-so-007', 'products/DongPhucCongSo/', 'DongPhucCongSo007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay ngắn&nbsp;trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:56:38', '2016-10-27 14:33:00', '2016-10-27 18:33:35', 51, 4, 1, 0),
(191, 'Đồng Phục Công Sở 008', 'dong-phuc-cong-so-008', 'products/DongPhucCongSo/', 'DongPhucCongSo008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay lỡ với m&agrave;u đen sang trọng kết hợp với điểm nhấn ở cổ &aacute;o tạo n&ecirc;n sự quyến rủ</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:57:04', '2016-10-27 14:33:00', '2016-10-27 18:33:24', 51, 4, 1, 0),
(192, 'Đồng Phục Công Sở 09', 'dong-phuc-cong-so-09', 'products/DongPhucCongSo/', 'DongPhucCongSo009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;Sơmi nam phong c&aacute;ch trẻ trung , c&aacute; t&iacute;nh</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng, kết hợp với viền ở cổ &aacute;o chạy dọc theo h&agrave;ng n&uacute;t tạo n&ecirc;n phong c&aacute;ch năng động&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng tinh kh&ocirc;i&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:57:40', '2016-10-27 14:33:00', '2016-10-27 18:33:12', 51, 15, 1, 0),
(193, 'Đồng Phục Công Sở 010', 'dong-phuc-cong-so-010', 'products/DongPhucCongSo/', 'DongPhucCongSo010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i c&oacute; t&uacute;i &aacute;o&nbsp;với m&agrave;u xanh lịch l&atilde;m</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:58:19', '2016-10-27 14:32:00', '2016-10-27 18:32:51', 51, 5, 1, 0),
(194, 'Đồng Phục Công Sở 011', 'dong-phuc-cong-so-011', 'products/DongPhucCongSo/', 'DongPhucCongSo011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i c&oacute; t&uacute;i &aacute;o&nbsp;với m&agrave;u trắng sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:58:51', '2016-10-27 14:32:00', '2016-10-27 18:32:39', 51, 5, 1, 0),
(195, 'Đồng Phục Công Sở 012', 'dong-phuc-cong-so-012', 'products/DongPhucCongSo/', 'DongPhucCongSo012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i c&oacute; t&uacute;i &aacute;o&nbsp;với m&agrave;u hồng&nbsp;trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:59:25', '2016-10-27 14:32:00', '2016-10-27 18:32:21', 51, 5, 1, 0),
(196, 'Đồng Phục Công Sở 013', 'dong-phuc-cong-so-013', 'products/DongPhucCongSo/', 'DongPhucCongSo013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u ghi lịch l&atilde;m</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 21:59:55', '2016-10-27 14:32:00', '2016-10-27 18:32:09', 51, 6, 1, 0),
(197, 'Đồng Phục Công Sở 014', 'dong-phuc-cong-so-014', 'products/DongPhucCongSo/', 'DongPhucCongSo014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:00:22', '2016-10-27 14:31:00', '2016-10-27 18:31:44', 51, 5, 1, 0),
(198, 'Đồng Phục Công Sở 015', 'dong-phuc-cong-so-015', 'products/DongPhucCongSo/', 'DongPhucCongSo015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng , c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc,kết hợp với điểm nhấn ở cổ v&agrave; tay &aacute;o tạo n&ecirc;n phong c&aacute;ch thời trang c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:00:51', '2016-10-27 14:31:00', '2016-10-27 18:31:30', 51, 7, 1, 0),
(199, 'Đồng Phục Công Sở 016', 'dong-phuc-cong-so-016', 'products/DongPhucCongSo/', 'DongPhucCongSo016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc,kết hợp với điểm nhấn ở cổ v&agrave; tay &aacute;o tạo n&ecirc;n phong c&aacute;ch thời trang c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:16:02', '2016-10-27 14:31:00', '2016-10-27 18:31:10', 51, 4, 1, 0),
(200, 'Đồng Phục Công Sở 017', 'dong-phuc-cong-so-017', 'products/DongPhucCongSo/', 'DongPhucCongSo017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc,kết hợp với t&uacute;i&nbsp;&aacute;o tạo n&ecirc;n phong c&aacute;ch c&ocirc;ng sở&nbsp;c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:16:32', '2016-10-27 14:30:00', '2016-10-27 18:30:55', 51, 3, 1, 0),
(201, 'Đồng Phục Công Sở 018', 'dong-phuc-cong-so-018', 'products/DongPhucCongSo/', 'DongPhucCongSo018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:17:05', '2016-10-27 14:30:00', '2016-10-27 18:30:40', 51, 4, 1, 0),
(202, 'Đồng Phục Công Sở 019', 'dong-phuc-cong-so-019', 'products/DongPhucCongSo/', 'DongPhucCongSo019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u xanh lịch l&atilde;m</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:17:31', '2016-10-27 14:30:00', '2016-10-27 18:30:29', 51, 8, 1, 0),
(203, 'Đồng Phục Công Sở 020', 'dong-phuc-cong-so-020', 'products/DongPhucCongSo/', 'DongPhucCongSo020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng, kết hợp với viền ở cổ &aacute;o chạy dọc theo h&agrave;ng n&uacute;t tạo n&ecirc;n phong c&aacute;ch năng động&nbsp;</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng tinh kh&ocirc;i&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:18:02', '2016-10-27 14:29:00', '2016-10-27 18:29:55', 51, 5, 1, 0),
(204, 'Đồng Phục Công Sở 021', 'dong-phuc-cong-so-021', 'products/DongPhucCongSo/', 'DongPhucCongSo021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i&nbsp;với m&agrave;u xanh lịch l&atilde;m</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:18:32', '2016-10-27 14:29:00', '2016-10-27 18:29:43', 51, 8, 1, 0),
(205, 'Đồng Phục Công Sở 022', 'dong-phuc-cong-so-022', 'products/DongPhucCongSo/', 'DongPhucCongSo022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải trắng sang trọng,kết hợp với điểm nhấn ở cổ v&agrave; tay &aacute;o tạo n&ecirc;n phong c&aacute;ch c&ocirc;ng sở&nbsp;c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:18:58', '2016-10-27 14:29:00', '2016-10-27 18:29:32', 51, 8, 1, 0);
INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(206, 'Đồng Phục Công Sở 023', 'dong-phuc-cong-so-023', 'products/DongPhucCongSo/', 'DongPhucCongSo023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế d&agrave;i tay&nbsp;với m&agrave;u đen sang trọng kết hợp với điểm nhấn ở t&uacute;i &aacute;o&nbsp;tạo n&ecirc;n sự năng động</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:19:29', '2016-10-27 14:28:00', '2016-10-27 18:29:03', 51, 6, 1, 0),
(207, 'Đồng Phục Công Sở 024', 'dong-phuc-cong-so-024', 'products/DongPhucCongSo/', 'DongPhucCongSo024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng sang trọng,kết hợp với điểm nhấn ở cổ v&agrave; tay &aacute;o tạo n&ecirc;n phong c&aacute;ch thời trang c&aacute; t&iacute;nh</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:19:55', '2016-10-27 14:28:00', '2016-10-27 18:28:42', 51, 6, 1, 0),
(208, 'Đồng Phục Công Sở 025', 'dong-phuc-cong-so-025', 'products/DongPhucCongSo/', 'DongPhucCongSo025.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:20:24', '2016-10-27 14:28:00', '2016-10-27 18:28:24', 51, 5, 1, 0),
(209, 'Đồng Phục Công Sở 026', 'dong-phuc-cong-so-026', 'products/DongPhucCongSo/', 'DongPhucCongSo026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kate m&agrave;u ghi tr&ocirc;ng thật đẳng cấp</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:20:48', '2016-10-27 14:27:00', '2016-10-27 18:28:04', 51, 4, 1, 0),
(210, 'Đồng Phục Công Sở 027', 'dong-phuc-cong-so-027', 'products/DongPhucCongSo/', 'DongPhucCongSo027.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với&nbsp;m&agrave;u đen sang trọng,kết hợp với viền dọc theo h&agrave;ng n&uacute;t tạo n&ecirc;n sự trẻ trung</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:21:33', '2016-10-27 14:27:00', '2016-10-27 18:27:49', 51, 4, 1, 0),
(211, 'Đồng Phục Công Sở 028', 'dong-phuc-cong-so-028', 'products/DongPhucCongSo/', 'DongPhucCongSo028.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay ngắn với vải kẻ sọc xanh lịch l&atilde;m</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:22:14', '2016-10-27 14:27:00', '2016-10-27 18:27:28', 51, 5, 1, 0),
(212, 'Đồng Phục Công Sở 029', 'dong-phuc-cong-so-029', 'products/DongPhucCongSo/', 'DongPhucCongSo029.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng tinh kh&ocirc;i tạo n&ecirc;n n&eacute;t&nbsp;sang trọng nơi c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:22:43', '2016-10-27 14:26:00', '2016-10-27 18:27:04', 51, 5, 1, 0),
(213, 'Đồng Phục Công Sở 030', 'dong-phuc-cong-so-030', 'products/DongPhucCongSo/', 'DongPhucCongSo030.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u trắng tinh kh&ocirc;i tạo n&ecirc;n n&eacute;t&nbsp;sang trọng nơi c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:23:09', '2016-10-27 14:26:00', '2016-10-27 18:26:28', 51, 5, 1, 0),
(214, 'Đồng Phục Công Sở 031', 'dong-phuc-cong-so-031', 'products/DongPhucCongSo/', 'DongPhucCongSo031.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với m&agrave;u xanh trơn&nbsp;tạo n&ecirc;n sự trẻ trung&nbsp;nơi c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:23:34', '2016-10-27 14:26:00', '2016-10-27 18:26:14', 51, 4, 1, 0),
(215, 'Đồng Phục Công Sở 032', 'dong-phuc-cong-so-032', 'products/DongPhucCongSo/', 'DongPhucCongSo032.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc caro tạo n&ecirc;n n&eacute;t nam t&iacute;nh chốn c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:24:04', '2016-10-27 14:25:00', '2016-10-27 18:25:59', 51, 12, 1, 0),
(216, 'Đồng Phục Công Sở 033', 'dong-phuc-cong-so-033', 'products/DongPhucCongSo/', 'DongPhucCongSo033.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kẻ sọc,kết hợp với t&uacute;i &aacute;o tạo n&ecirc;n sự sang trọng</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:24:29', '2016-10-27 14:25:00', '2016-10-27 18:25:43', 51, 5, 1, 0),
(217, 'Đồng Phục Công Sở 034', 'dong-phuc-cong-so-034', 'products/DongPhucCongSo/', 'DongPhucCongSo034.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế tay d&agrave;i với vải kate trơn cao cấp tạo n&ecirc;n đẳng cấp nơi c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:24:55', '2016-10-27 14:25:00', '2016-10-27 18:25:30', 51, 8, 1, 0),
(218, 'Đồng Phục Công Sở 035', 'dong-phuc-cong-so-035', 'products/DongPhucCongSo/', 'DongPhucCongSo035.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;ph&ugrave; hợp với văn ph&ograve;ng ,c&ocirc;ng sở&nbsp;</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton ,linen,&nbsp;silk , polyester , kate ...</p>\n\n<p>-&nbsp;<strong>M&ocirc; tả :&nbsp;</strong>thiết kế&nbsp;d&agrave;i tay với vải kẻ sọc cao cấp tạo n&ecirc;n đẳng cấp chốn c&ocirc;ng sở</p>\n\n<p>-&nbsp;<strong>Phom :</strong>&nbsp; theo chuẩn form của&nbsp;<strong>đồng phục Ho&agrave;n Mỹ</strong></p>\n\n<p>-&nbsp;<strong>Size :</strong>&nbsp;S,M,L,XL,XXL ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;24 m&agrave;u&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:25:30', '2016-10-27 14:25:00', '2016-10-27 18:25:17', 51, 8, 1, 0),
(219, 'Nón Du Lịch 001', 'non-du-lich-001', 'products/NonDuLich/', 'NonDuLich001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh chuối ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '', 2, '2016-10-21 22:29:05', '2016-10-20 00:00:00', '2016-10-27 17:25:57', 59, 37, 1, 0),
(220, 'Nón Du Lịch 002', 'non-du-lich-002', 'products/NonDuLich/', 'NonDuLich002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;cam ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:29:31', '2016-10-20 00:05:00', '2016-10-27 17:26:16', 59, 5, 1, 0),
(221, 'Nón Du Lịch 003', 'non-du-lich-003', 'products/NonDuLich/', 'NonDuLich003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:29:57', '2016-10-20 00:10:00', '2016-10-27 17:26:46', 59, 6, 1, 0),
(222, 'Nón Du Lịch 004', 'non-du-lich-004', 'products/NonDuLich/', 'NonDuLich004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Hồng đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:30:26', '2016-10-20 00:15:00', '2016-10-27 17:27:10', 59, 5, 1, 0),
(223, 'Nón Du Lịch 005', 'non-du-lich-005', 'products/NonDuLich/', 'NonDuLich005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:&nbsp;</strong>n&oacute;n kh&ocirc;ng n&oacute;c thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong> Đen<strong>&nbsp;</strong>( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:30:52', '2016-10-20 00:20:00', '2016-10-27 17:27:30', 59, 5, 1, 0),
(224, 'Nón Du Lịch 006', 'non-du-lich-006', 'products/NonDuLich/', 'NonDuLich006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;N&oacute;n kh&ocirc;ng n&oacute;c phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:31:19', '2016-10-20 00:25:00', '2016-10-27 17:27:45', 59, 6, 1, 0),
(225, 'Nón Du Lịch 007', 'non-du-lich-007', 'products/NonDuLich/', 'NonDuLich007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:&nbsp;</strong>N&oacute;n tai b&egrave;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:31:48', '2016-10-20 00:30:00', '2016-10-27 17:28:45', 59, 5, 1, 0),
(226, 'Nón Du Lịch 008', 'non-du-lich-008', 'products/NonDuLich/', 'NonDuLich008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;N&oacute;n tai b&egrave;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Xanh b&iacute;ch đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:32:26', '2016-10-20 00:35:00', '2016-10-27 17:29:03', 59, 6, 1, 0),
(227, 'Nón Du Lịch 009', 'non-du-lich-009', 'products/NonDuLich/', 'NonDuLich009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Trắng phối xanh&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:32:52', '2016-10-20 00:40:00', '2016-10-27 17:29:17', 59, 4, 1, 0),
(228, 'Nón Du Lịch 010', 'non-du-lich-010', 'products/NonDuLich/', 'NonDuLich010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;Cam đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:33:35', '2016-10-20 00:45:00', '2016-10-27 17:29:31', 59, 5, 1, 0),
(229, 'Nón Du Lịch 011', 'non-du-lich-011', 'products/NonDuLich/', 'NonDuLich011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong> N&oacute;n lưỡi trai phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung , gi&oacute;&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:37:05', '2016-10-20 00:50:00', '2016-10-27 17:29:48', 59, 4, 1, 0),
(230, 'Nón Du Lịch 012', 'non-du-lich-012', 'products/NonDuLich/', 'NonDuLich012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki Việt Nam</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>trắng phối hồng phấn&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:38:16', '2016-10-20 00:55:00', '2016-10-27 17:30:07', 59, 4, 1, 0),
(231, 'Nón Du Lịch 013', 'non-du-lich-013', 'products/NonDuLich/', 'NonDuLich013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>trắng phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:38:41', '2016-10-20 01:00:00', '2016-10-27 17:30:32', 59, 4, 1, 0),
(232, 'Nón Du Lịch 014', 'non-du-lich-014', 'products/NonDuLich/', 'NonDuLich014.JPG', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>trắng phối v&agrave;ng , n&uacute;t xanh&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:39:10', '2016-10-20 01:05:00', '2016-10-27 17:31:12', 59, 5, 1, 0),
(233, 'Nón Du Lịch 015', 'non-du-lich-015', 'products/NonDuLich/', 'NonDuLich015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki Việt Nam ,cotton , gi&oacute; ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối xanh biển&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:39:36', '2016-10-20 01:10:00', '2016-10-27 17:32:08', 59, 4, 1, 0),
(234, 'Nón Du Lịch 016', 'non-du-lich-016', 'products/NonDuLich/', 'NonDuLich016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao , th&ecirc;u 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch -&nbsp; đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:40:11', '2016-10-20 01:15:00', '2016-10-27 17:32:24', 59, 4, 1, 0),
(235, 'Nón Du Lịch 017', 'non-du-lich-017', 'products/NonDuLich/', 'NonDuLich017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki&nbsp;cotton 100%, samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao , th&ecirc;u 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen phối cam&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:40:37', '2016-10-20 01:20:00', '2016-10-27 17:32:40', 59, 4, 1, 0),
(236, 'Nón Du Lịch 018', 'non-du-lich-018', 'products/NonDuLich/', 'NonDuLich018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;v&agrave;ng tươi&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:41:02', '2016-10-20 01:25:00', '2016-10-27 17:32:53', 59, 5, 1, 0),
(237, 'Nón Du Lịch 019', 'non-du-lich-019', 'products/NonDuLich/', 'NonDuLich019.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; đậm phối&nbsp;trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:41:30', '2016-10-20 01:30:00', '2016-10-27 17:33:09', 59, 4, 1, 0),
(238, 'Nón Du Lịch 020', 'non-du-lich-020', 'products/NonDuLich/', 'NonDuLich020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute; đậm phối v&agrave;ng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:41:59', '2016-10-20 01:35:00', '2016-10-27 17:33:24', 59, 4, 1, 0),
(239, 'Nón Du Lịch 021', 'non-du-lich-021', 'products/NonDuLich/', 'NonDuLich021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc : </strong>đỏ cờ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:42:24', '2016-10-20 01:40:00', '2016-10-27 17:33:45', 59, 5, 1, 0),
(240, 'Nón Du Lịch 022', 'non-du-lich-022', 'products/NonDuLich/', 'NonDuLich022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:42:54', '2016-10-20 01:45:00', '2016-10-27 17:33:59', 59, 4, 1, 0),
(241, 'Nón Du Lịch 023', 'non-du-lich-023', 'products/NonDuLich/', 'NonDuLich023.JPG', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ đ&ocirc; phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:43:29', '2016-10-20 01:50:00', '2016-10-27 17:36:08', 59, 5, 1, 0),
(242, 'Nón Quảng Cáo 001', 'non-quang-cao-001', 'products/NonQuangCao/', 'NonQuangCao001.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;T&iacute;m&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:44:51', '2016-10-20 05:20:00', '2016-10-27 18:02:43', 59, 6, 1, 0),
(243, 'Nón Quảng Cáo 002', 'non-quang-cao-002', 'products/NonQuangCao/', 'NonQuangCao002.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;v&agrave;ng đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:45:39', '2016-10-20 05:10:00', '2016-10-27 18:02:28', 59, 6, 1, 0),
(244, 'Nón Quảng Cáo 003', 'non-quang-cao-003', 'products/NonQuangCao/', 'NonQuangCao003.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki nhung , cotton 100%</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ tươi ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:47:24', '2016-10-20 05:05:00', '2016-10-27 18:01:59', 59, 7, 1, 0),
(245, 'Nón Quảng Cáo 004', 'non-quang-cao-004', 'products/NonQuangCao/', 'NonQuangCao004.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:47:47', '2016-10-20 05:00:00', '2016-10-27 18:01:46', 59, 6, 1, 0),
(246, 'Nón Quảng Cáo 005', 'non-quang-cao-005', 'products/NonQuangCao/', 'NonQuangCao005.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki nhung tuyết&nbsp;</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh lam&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:48:13', '2016-10-20 04:55:00', '2016-10-27 18:01:21', 59, 6, 1, 0),
(247, 'Nón Quảng Cáo 006', 'non-quang-cao-006', 'products/NonQuangCao/', 'NonQuangCao006.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen c&oacute; nẹp xanh da trời&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:48:39', '2016-10-20 04:55:00', '2016-10-27 18:01:05', 59, 6, 1, 0),
(248, 'Nón Quảng Cáo 007', 'non-quang-cao-007', 'products/NonQuangCao/', 'NonQuangCao007.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen phối v&agrave;ng đậm&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:49:02', '2016-10-20 04:50:00', '2016-10-27 18:00:31', 59, 6, 1, 0),
(249, 'Nón Quảng Cáo 008', 'non-quang-cao-008', 'products/NonQuangCao/', 'NonQuangCao008.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki nhung 100% cotton.</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>cafe sữa phối trắng gạo</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:49:25', '2016-10-20 04:45:00', '2016-10-27 18:00:13', 59, 6, 1, 0),
(250, 'Nón Quảng Cáo 009', 'non-quang-cao-009', 'products/NonQuangCao/', 'NonQuangCao009.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>v&agrave;ng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:49:49', '2016-10-20 04:45:00', '2016-10-27 17:59:58', 59, 6, 1, 0),
(251, 'Nón Quảng Cáo 010', 'non-quang-cao-010', 'products/NonQuangCao/', 'NonQuangCao010.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:50:20', '2016-10-20 04:40:00', '2016-10-27 17:59:41', 59, 6, 1, 0),
(252, 'Nón Quảng Cáo 011', 'non-quang-cao-011', 'products/NonQuangCao/', 'NonQuangCao011.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải cotton 65/35</p>\n\n<p><strong>- Logo :&nbsp;</strong>In &nbsp;chuyển nhiệt cao cấp</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ tươi&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:52:09', '2016-10-20 04:35:00', '2016-10-27 17:59:28', 59, 7, 1, 0),
(253, 'Nón Quảng Cáo 012', 'non-quang-cao-012', 'products/NonQuangCao/', 'NonQuangCao012.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki samsung</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch phối viền trắng( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:52:43', '2016-10-20 04:35:00', '2016-10-27 17:59:13', 59, 6, 1, 0),
(254, 'Nón Quảng Cáo 013', 'non-quang-cao-013', 'products/NonQuangCao/', 'NonQuangCao013.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n kh&ocirc;ng n&oacute;c thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:53:43', '2016-10-20 04:30:00', '2016-10-27 17:58:54', 59, 7, 1, 0),
(255, 'Nón Quảng Cáo 014', 'non-quang-cao-014', 'products/NonQuangCao/', 'NonQuangCao014.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n kh&ocirc;ng n&oacute;c thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>kaki, cotton 100%, 65/35 , gi&oacute;&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh l&aacute;&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:54:16', '2016-10-20 04:25:00', '2016-10-27 17:58:35', 59, 6, 1, 0),
(256, 'Nón Quảng Cáo 015', 'non-quang-cao-015', 'products/NonQuangCao/', 'NonQuangCao015.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n kh&ocirc;ng n&oacute;c thời trang</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải&nbsp;kaki, cotton 100%, 65/35 , gi&oacute;&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ&nbsp;cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:55:20', '2016-10-20 04:25:00', '2016-10-27 17:58:20', 59, 6, 1, 0),
(257, 'Nón Quảng Cáo 016', 'non-quang-cao-016', 'products/NonQuangCao/', 'NonQuangCao016.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu : </strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;cam ( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:56:25', '2016-10-20 04:20:00', '2016-10-27 17:58:05', 59, 6, 1, 0),
(258, 'Nón Quảng Cáo 017', 'non-quang-cao-017', 'products/NonQuangCao/', 'NonQuangCao017.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:56:54', '2016-10-20 04:20:00', '2016-10-27 17:57:52', 59, 5, 1, 0),
(259, 'Nón Quảng Cáo 018', 'non-quang-cao-018', 'products/NonQuangCao/', 'NonQuangCao018.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen phối cam&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:57:39', '2016-10-20 04:15:00', '2016-10-27 17:57:31', 59, 4, 1, 0),
(260, 'Nón Quảng Cáo 019', 'non-quang-cao-019', 'products/NonQuangCao/', 'NonQuangCao019.JPG', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:58:23', '2016-10-20 04:10:00', '2016-10-27 17:57:19', 59, 4, 1, 0),
(261, 'Nón Quảng Cáo 020', 'non-quang-cao-020', 'products/NonQuangCao/', 'NonQuangCao020.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung phối lưới&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh chuối phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 22:59:05', '2016-10-20 04:10:00', '2016-10-27 17:56:55', 59, 4, 1, 0),
(262, 'Nón Quảng Cáo 021', 'non-quang-cao-021', 'products/NonQuangCao/', 'NonQuangCao021.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao&nbsp;</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen phối cam&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:00:06', '2016-10-20 04:05:00', '2016-10-27 17:56:35', 59, 4, 1, 0),
(263, 'Nón Quảng Cáo 022', 'non-quang-cao-022', 'products/NonQuangCao/', 'NonQuangCao022.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:00:53', '2016-10-20 04:05:00', '2016-10-27 17:56:17', 59, 4, 1, 0),
(264, 'Nón Quảng Cáo 023', 'non-quang-cao-023', 'products/NonQuangCao/', 'NonQuangCao023.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh koban&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:01:20', '2016-10-20 04:00:00', '2016-10-27 17:56:03', 59, 5, 1, 0),
(265, 'Nón Quảng Cáo 024', 'non-quang-cao-024', 'products/NonQuangCao/', 'NonQuangCao024.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong> V&agrave;ng đất&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:01:47', '2016-10-20 04:00:00', '2016-10-27 17:55:45', 59, 5, 1, 0),
(266, 'Nón Quảng Cáo 025', 'non-quang-cao-025', 'products/NonQuangCao/', 'NonQuangCao025.JPG', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;cam phối đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:02:23', '2016-10-20 03:55:00', '2016-10-27 17:55:28', 59, 4, 1, 0),
(267, 'Nón Quảng Cáo 026', 'non-quang-cao-026', 'products/NonQuangCao/', 'NonQuangCao026.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen tuyền&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:02:58', '2016-10-20 03:55:00', '2016-10-27 17:55:14', 59, 4, 1, 0),
(268, 'Nón Quảng Cáo 027', 'non-quang-cao-027', 'products/NonQuangCao/', 'NonQuangCao027.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch phối v&agrave;ng đậu&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:03:26', '2016-10-20 03:50:00', '2016-10-27 17:54:59', 59, 4, 1, 0);
INSERT INTO `post` (`pid`, `p_title`, `p_slug`, `p_ym`, `p_img`, `p_shorttext`, `p_content`, `p_meta`, `p_author`, `p_datetime`, `p_published`, `p_lastmodified`, `p_cid`, `p_views`, `p_stat`, `p_featured`) VALUES
(269, 'Nón Quảng Cáo 028', 'non-quang-cao-028', 'products/NonQuangCao/', 'NonQuangCao028.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh biển phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:04:15', '2016-10-20 03:50:00', '2016-10-27 17:54:44', 59, 4, 1, 0),
(270, 'Nón Quảng Cáo 029', 'non-quang-cao-029', 'products/NonQuangCao/', 'NonQuangCao029.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u logo 3D</p>\n\n<p><strong>- M&agrave;u sắc : </strong>đen tuyền&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:04:44', '2016-10-20 03:45:00', '2016-10-27 17:54:32', 59, 8, 1, 0),
(271, 'Nón Quảng Cáo 030', 'non-quang-cao-030', 'products/NonQuangCao/', 'NonQuangCao030.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu : </strong>kaki nhung</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u logo 3D</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>đỏ phối xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:06:15', '2016-10-20 03:45:00', '2016-10-27 17:54:18', 59, 5, 1, 0),
(272, 'Nón Quảng Cáo 031', 'non-quang-cao-031', 'products/NonQuangCao/', 'NonQuangCao031.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh lam&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:06:47', '2016-10-20 03:40:00', '2016-10-27 17:53:59', 59, 4, 1, 0),
(273, 'Nón Quảng Cáo 032', 'non-quang-cao-032', 'products/NonQuangCao/', 'NonQuangCao032.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh k&eacute;t&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:07:37', '2016-10-20 03:40:00', '2016-10-27 17:53:43', 59, 4, 1, 0),
(274, 'Nón Quảng Cáo 033', 'non-quang-cao-033', 'products/NonQuangCao/', 'NonQuangCao033.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:09:05', '2016-10-20 03:35:00', '2016-10-27 17:53:22', 59, 4, 1, 0),
(275, 'Nón Quảng Cáo 034', 'non-quang-cao-034', 'products/NonQuangCao/', 'NonQuangCao034.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh biển&nbsp;phối đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:11:41', '2016-10-20 03:30:00', '2016-10-27 17:53:06', 59, 4, 1, 0),
(276, 'Nón Quảng Cáo 035', 'non-quang-cao-035', 'products/NonQuangCao/', 'NonQuangCao035.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u logo nổi&nbsp;3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:12:08', '2016-10-20 03:30:00', '2016-10-27 17:52:51', 59, 6, 1, 0),
(277, 'Nón Quảng Cáo 036', 'non-quang-cao-036', 'products/NonQuangCao/', 'NonQuangCao036.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u logo nổi 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:12:47', '2016-10-20 03:25:00', '2016-10-27 17:52:16', 59, 5, 1, 0),
(278, 'Nón Quảng Cáo 037', 'non-quang-cao-037', 'products/NonQuangCao/', 'NonQuangCao037.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n lưỡi trai phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:13:19', '2016-10-20 03:25:00', '2016-10-27 17:52:02', 59, 4, 1, 0),
(279, 'Nón Quảng Cáo 038', 'non-quang-cao-038', 'products/NonQuangCao/', 'NonQuangCao038.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n lưỡi trai phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , gi&oacute;&nbsp; ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh koban&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:13:51', '2016-10-20 03:20:00', '2016-10-27 17:51:47', 59, 4, 1, 0),
(280, 'Nón Quảng Cáo 039', 'non-quang-cao-039', 'products/NonQuangCao/', 'NonQuangCao039.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>đỏ phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:14:43', '2016-10-20 03:20:00', '2016-10-27 17:51:31', 59, 4, 1, 0),
(281, 'Nón Quảng Cáo 040', 'non-quang-cao-040', 'products/NonQuangCao/', 'NonQuangCao040.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n kết phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>gi&oacute; , thun ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In chuyển nhiệt cao cấp</p>\n\n<p><strong>- M&agrave;u sắc : </strong>thời trang&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:15:15', '2016-10-20 03:15:00', '2016-10-27 17:51:13', 59, 5, 1, 0),
(282, 'Nón Quảng Cáo 041', 'non-quang-cao-041', 'products/NonQuangCao/', 'NonQuangCao041.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh ngọc&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:15:46', '2016-10-20 03:15:00', '2016-10-27 17:50:58', 59, 5, 1, 0),
(283, 'Nón Quảng Cáo 042', 'non-quang-cao-042', 'products/NonQuangCao/', 'NonQuangCao042.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:&nbsp;</strong>n&oacute;n snapback&nbsp;phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:16:13', '2016-10-20 03:10:00', '2016-10-27 17:50:43', 59, 6, 1, 0),
(284, 'Nón Quảng Cáo 043', 'non-quang-cao-043', 'products/NonQuangCao/', 'NonQuangCao043.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n kh&ocirc;ng n&oacute;c thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , vải gi&oacute;&nbsp; ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;v&agrave;ng&nbsp;&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:16:49', '2016-10-20 03:10:00', '2016-10-27 17:50:29', 59, 5, 1, 0),
(285, 'Nón Quảng Cáo 044', 'non-quang-cao-044', 'products/NonQuangCao/', 'NonQuangCao044.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n tai b&egrave;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 &nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :&nbsp;</strong>trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:17:13', '2016-10-20 03:05:00', '2016-10-27 17:50:11', 59, 4, 1, 0),
(286, 'Nón Quảng Cáo 045', 'non-quang-cao-045', 'products/NonQuangCao/', 'NonQuangCao045.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n tai b&egrave;o phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng gạo&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:17:42', '2016-10-20 03:05:00', '2016-10-27 17:49:56', 59, 5, 1, 0),
(287, 'Nón Quảng Cáo 046', 'non-quang-cao-046', 'products/NonQuangCao/', 'NonQuangCao046.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n tai b&egrave;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:18:13', '2016-10-20 03:00:00', '2016-10-27 17:48:21', 59, 8, 1, 0),
(288, 'Nón Quảng Cáo 047', 'non-quang-cao-047', 'products/NonQuangCao/', 'NonQuangCao047.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n tai b&egrave;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 &nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh E&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:18:43', '2016-10-20 03:00:00', '2016-10-27 17:48:04', 59, 5, 1, 0),
(289, 'Nón Quảng Cáo 048', 'non-quang-cao-048', 'products/NonQuangCao/', 'NonQuangCao048.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:&nbsp;</strong>n&oacute;n kh&ocirc;ng n&oacute;c thể thao</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35, vải gi&oacute;&nbsp;&nbsp;...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc : </strong>đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:19:11', '2016-10-20 02:55:00', '2016-10-27 17:47:42', 59, 6, 1, 0),
(290, 'Nón Quảng Cáo 049', 'non-quang-cao-049', 'products/NonQuangCao/', 'NonQuangCao049.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u nổi logo 3D</p>\n\n<p><strong>- M&agrave;u sắc : đỏ</strong>&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:19:41', '2016-10-20 02:50:00', '2016-10-27 17:47:04', 59, 6, 1, 0),
(291, 'Nón Quảng Cáo 050', 'non-quang-cao-050', 'products/NonQuangCao/', 'NonQuangCao050.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n lưỡi trai phối lưới</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch lợt&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:20:10', '2016-10-20 02:45:00', '2016-10-27 17:46:28', 59, 4, 1, 0),
(292, 'Nón Quảng Cáo 051', 'non-quang-cao-051', 'products/NonQuangCao/', 'NonQuangCao051.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u logo nổi 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:20:46', '2016-10-20 02:40:00', '2016-10-27 17:46:11', 59, 5, 1, 0),
(293, 'Nón Quảng Cáo 052', 'non-quang-cao-052', 'products/NonQuangCao/', 'NonQuangCao052.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;cam phối trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:21:31', '2016-10-20 02:35:00', '2016-10-27 17:45:41', 59, 6, 1, 0),
(294, 'Nón Quảng Cáo 053', 'non-quang-cao-053', 'products/NonQuangCao/', 'NonQuangCao053.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối nẹp v&agrave; s&ograve; xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:22:47', '2016-10-20 02:30:00', '2016-10-27 17:45:27', 59, 5, 1, 0),
(295, 'Nón Quảng Cáo 054', 'non-quang-cao-054', 'products/NonQuangCao/', 'NonQuangCao054.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;n&oacute;n quảng c&aacute;o</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>logo th&ecirc;u nổi 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;xanh b&iacute;ch&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:23:15', '2016-10-20 02:25:00', '2016-10-27 17:45:11', 59, 8, 1, 0),
(296, 'Nón Quảng Cáo 055', 'non-quang-cao-055', 'products/NonQuangCao/', 'NonQuangCao055.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;x&aacute;m ghi&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:23:45', '2016-10-20 02:20:00', '2016-10-27 17:44:53', 59, 7, 1, 0),
(297, 'Nón Quảng Cáo 056', 'non-quang-cao-056', 'products/NonQuangCao/', 'NonQuangCao056.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng phối nẹp đỏ&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:24:10', '2016-10-20 02:15:00', '2016-10-27 17:44:35', 59, 5, 1, 0),
(298, 'Nón Quảng Cáo 057', 'non-quang-cao-057', 'products/NonQuangCao/', 'NonQuangCao057.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>th&ecirc;u nổi logo 3D</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đen&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:24:43', '2016-10-20 02:10:00', '2016-10-27 17:44:11', 59, 7, 1, 0),
(299, 'Nón Quảng Cáo 058', 'non-quang-cao-058', 'products/NonQuangCao/', 'NonQuangCao058.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;trắng&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:25:24', '2016-10-20 02:05:00', '2016-10-27 17:43:57', 59, 9, 1, 0),
(300, 'Nón Quảng Cáo 059', 'non-quang-cao-059', 'products/NonQuangCao/', 'NonQuangCao059.jpg', 'THÔNG TIN SẢN PHẨM', '<p><strong>- Kiểu d&aacute;ng&nbsp;:</strong>&nbsp;thời trang phong c&aacute;ch</p>\n\n<p><strong>- Chất liệu :&nbsp;</strong>vải<strong>&nbsp;</strong>kaki, cotton 100%, 65/35 , samsung ...</p>\n\n<p><strong>- Logo :&nbsp;</strong>In - Th&ecirc;u c&ocirc;ng nghệ cao</p>\n\n<p><strong>- M&agrave;u sắc :</strong>&nbsp;đỏ đ&ocirc;&nbsp;( theo chuẩn m&agrave;u pantone )</p>\n\n<p><strong>- Li&ecirc;n hệ :<span style="font-size:18px"><span style="color:rgb(255, 0, 0)">&nbsp;08 888 369 53</span></span></strong></p>\n', '', 2, '2016-10-21 23:25:54', '2016-10-20 02:00:00', '2016-10-27 17:43:41', 59, 13, 1, 0),
(301, 'test', 'test', '0', '0', '', '', '', 2, '2016-10-29 17:35:48', '2016-10-29 17:35:00', '2016-10-29 21:35:48', 0, 0, 1, 0),
(302, 'Áo thun đồng phục và những kiến thức cần biết.', 'ao-thun-dong-phuc-va-nhung-kien-thuc-can-biet', '0', '0', 'Áo thun trở nên phổ biến vì tính dễ sử dụng. Vậy nên việc lựa chọn áo thun đồng sử dụng hết mọi tính năng cho mục đích doanh nghiệp là một bài toán.', '<p><span style="font-size:16px">K<span style="font-family:arial,helvetica,sans-serif">hi sử dụng áo thun bạn sẽ phải lưu ý những gì?</span></span></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif"><strong><span style="color:#0000CD">1. Kh&ocirc;̉ in r&ocirc;̣ng, màu sắc đa dạng chỉ có th&ecirc;̉ là áo thun đ&ocirc;̀ng phục.</span></strong></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Những người chọn áo thun làm đ&ocirc;̀ng phục vì có m&ocirc;̣t khoảng r&ocirc;̣ng kh&ocirc;ng bị c&ocirc;́ định ở ph&acirc;̀n phía trước bởi dãy khuy áo khi&ecirc;́n có th&ecirc;̉ nh&acirc;́t quán logo phía trước. Ngoài ra hình in m&acirc;̃u mã của áo thun r&acirc;́t đa dạng, phù hợp với chủ đ&ecirc;̀ mà các doanh nghi&ecirc;̣p mu&ocirc;́n đem lại. Chủ đ&ecirc;̀ v&ecirc;̀ màu sắc, chủ đ&ecirc;̀ v&ecirc;̀ logo và hình in mặt trước sau. N&ecirc;́u mu&ocirc;́n chọn lựa đ&ocirc;̀ng phục hãy chọn lựa đ&ocirc;̀ng phục bằng áo thun.</span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif"><strong><span style="color:#0000CD">2. Ch&acirc;́t li&ecirc;̣u vải phải phù hơp với nhu c&acirc;̀u của áo thun đ&ocirc;̀ng phục.</span></strong></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Tùy theo cách thức in mà bạn phải chọn lựa những m&acirc;̃u vải cho phù hợp. Với ch&acirc;́t li&ecirc;̣u cotton 100% bạn sẽ kh&ocirc;ng th&ecirc;̉ nào sở hữu m&ocirc;̣t chi&ecirc;́c áo in chuy&ecirc;̉n nhi&ecirc;̣t đẹp. Nhưng với các loại áo cotton pha 65/35 &nbsp;thì có th&ecirc;̉ ngăn sự th&acirc;́m hút của mực mà có th&ecirc;̉ in chuy&ecirc;̉n nhi&ecirc;̣t tu&ocirc;̉i thọ cao màu sắc đẹp. Nhưng những người thích áo cotton 100% vì những tính năng của nó như mát mẻ d&ecirc;̃ chịu, như v&acirc;̣y y&ecirc;u c&acirc;̀u hình in phải thu&ocirc;̣c loại d&ecirc;̃ bong hơn sau khi sử dụng. Ngoài ra những ki&ecirc;̉u in 3D, in n&ocirc;̉i,&hellip; đ&ecirc;̀u c&acirc;̀n những loại ch&acirc;́t li&ecirc;̣u ri&ecirc;ng. Và hơn h&ecirc;́t vi&ecirc;̣c sử dụng đúng ch&acirc;́t li&ecirc;̣u vải với m&ocirc;̃i đ&ocirc;́i tượng chính là chìa khóa đ&ecirc;̉ đi tới thành c&ocirc;ng.</span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif"><strong><span style="color:#0000CD">3. Áo thun đ&ocirc;̀ng phục gắn bó với người dùng. D&ecirc;̃ mặc nhưng kh&ocirc;ng d&ecirc;̃ lãng qu&ecirc;n.</span></strong></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Những b&ocirc;̣ đ&ocirc;̀ thun ti&ecirc;̣n lợi màu sắc hài hòa, có th&ecirc;̉ các bạn thích chọn lựa những b&ocirc;̣ đ&ocirc;̀ phù hợp hơn với bản th&acirc;n. Chi&ecirc;́c áo thun sẽ là thứ gắn bó r&acirc;́t l&acirc;u n&ecirc;́u như được đ&acirc;̀u tư kĩ lưỡng. Cũng chính vì th&ecirc;́ n&ecirc;n vi&ecirc;̣c đ&acirc;̀u tư những b&ocirc;̣ áo thun đ&ocirc;̀ng phục trở n&ecirc;n r&acirc;́t ph&ocirc;̉ bi&ecirc;́n. Sử dụng ở những m&ocirc;i trường năng đ&ocirc;̣ng. M&ocirc;̃i ngày sẽ có hàng ngàn người sẽ nhìn th&acirc;́y những bi&ecirc;̉u tượng đó. Và trong đ&acirc;̀u họ bắt đ&acirc;̀u có sự tò mò. Và những khách hàng ti&ecirc;̀m năng kh&ocirc;ng ngừng gia tăng vì những cón s&ocirc;́ đáng &acirc;́n&nbsp; tượng.</span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif"><strong><span style="color:#0000CD">4. Nhu c&acirc;̀u đa dạng đ&ocirc;́i với từng loại áo thun đ&ocirc;̀ng phục:</span></strong></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Áo thun đ&ocirc;̀ng phục có nhi&ecirc;̀u dạng với nhi&ecirc;̀u nhu c&acirc;̀u. Nhưng phải chọn lựa phù hợp với từng đ&ocirc;́i tượng sử dụng áo thun. Ví dụ người giao hàng, ngươi khu&acirc;n vác, k&ecirc;́ toán,&hellip; M&ocirc;̃i m&ocirc;̣t y&ecirc;́u t&ocirc;́ đặc thù c&ocirc;ng vi&ecirc;̣c đ&ecirc;̀u phải sử dụng từng loaị áo thun đ&ocirc;̀ng phục khác nhau.</span></span></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">K&ecirc;́t:</span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px">Vi&ecirc;̣c sử dụng áo thun đ&ocirc;̀ng phục trở n&ecirc;n ph&ocirc;̉ bi&ecirc;́n, nhưng kh&ocirc;ng phải vì th&ecirc;́ mà ta xem thường và bỏ qua chúng. Tìm được mục đích cũng như nhu c&acirc;̀u phù hợp kh&ocirc;ng chỉ đ&acirc;̉y mạnh vi&ecirc;̣c y&ecirc;u thích đ&ocirc;́i với thị hi&ecirc;́u làm tăng ch&acirc;́t lượng marketing, mà còn đ&ecirc;̉ khẳng định thương hi&ecirc;̣u của mình với t&acirc;́t cả mọi người. Chả ai mu&ocirc;́n hình ảnh của mình trở thành m&ocirc;̣t thứ x&acirc;́u xí kh&ocirc;ng b&ecirc;̀n chặt nhỉ?</span></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', NULL, 2, '2016-11-01 22:34:55', '2016-11-01 22:29:00', '2016-11-03 21:33:27', 8, 31, 1, 0),
(303, 'May đồng phục Doanh nghiệp, liệu các bạn đã hiểu đúng?', 'may-dong-phuc-doanh-nghiep-lieu-cac-ban-da-hieu-dung', 'news/', 'xay-dung-van-hoa-tu-dong-phuc-cong-so.jpg', 'Nếu như những người trong doanh nghiệp là máu thịt thì đồng phục trong doanh nghiệp lại như linh hồn vậy. May đồng phục  công ty làm sao để có thể  khiến công ty thể hiện được sự gắn bó cũng như thương hiệu của doanh nghiệp nghe dễ mà thực chất lại rất khó.', '<p><span style="color:#FF0000"><span style="font-size:16px"><strong><em>May đ&ocirc;̀ng phục&nbsp;doanh nghi&ecirc;̣p và những quan ni&ecirc;̣m sai l&acirc;̀m:</em></strong></span></span></p>\n\n<p><span style="font-size:16px">Nhi&ecirc;̀u người có băn khoăn v&ecirc;̀ <strong>may đ&ocirc;̀ng phục doanh nghi&ecirc;̣p</strong>, như đã nói những c&ocirc;ng nh&acirc;n là máu thịt dù b&ocirc;̣ máy c&ocirc;ng ty có hoạt đ&ocirc;̣ng t&ocirc;́t nhưng chưa chắc đã đem lại hi&ecirc;̣u quả vì thi&ecirc;́u đi ph&acirc;̀n h&ocirc;̀n của c&ocirc;ng ty. Mỹ quan, thương hi&ecirc;̣u đ&ecirc;̉ nhi&ecirc;̀u người bi&ecirc;́t tới. V&acirc;̣y m&ocirc;̣t doanh nghi&ecirc;̣p phải có những gì đ&ecirc;̉ có th&ecirc;̉ đem lại hi&ecirc;̣u quả tích cực? Đó là sự c&ocirc;̣ng hưởng của nhi&ecirc;̀u y&ecirc;́u t&ocirc;́ như : Ti&ecirc;́p thị, ch&acirc;́t lượng,&nbsp; sự đa dạng, tính nh&acirc;́t quán,&hellip;</span></p>\n\n<p><span style="font-size:16px">V&acirc;̣y đ&ecirc;̉ th&ecirc;̉ hi&ecirc;̣n những đi&ecirc;̀u đó thì phải có m&ocirc;̣t thứ gì đó đ&ecirc;̉ nh&acirc;́n mạnh? Kh&ocirc;ng gì khác ngoài đ&ocirc;̀ng phục của doanh nghi&ecirc;̣p<strong>. May đ&ocirc;̀ng phục cho doanh nghi&ecirc;̣p</strong> phải làm n&ocirc;̉i b&acirc;̣t được những gì doanh nghi&ecirc;̣p đó hướng tới. M&ocirc;̣t sự nh&acirc;́t quán, ti&ecirc;́p thị cho c&ocirc;ng ty và tr&ecirc;n h&ecirc;́t g&acirc;y được thi&ecirc;̣n cảm với những người khách hàng .</span></p>\n\n<p><span style="font-size:16px">Nhi&ecirc;̀u người v&acirc;̃n lu&ocirc;n suy nghĩ những chi&ecirc;́n lược kinh doanh mà qu&ecirc;n đi m&acirc;́t những đi&ecirc;̀u quan trọng của đ&ocirc;̀ng phục là sự nh&acirc;́t quán, thoải mái và đảm bảo v&ecirc;̀ ch&acirc;́t lượng. Chính vì th&ecirc;́ n&ecirc;n vi&ecirc;̣c may đ&ocirc;̀ng phục trong m&ocirc;̣t c&ocirc;ng ty đ&ecirc;̀u trở thành m&ocirc;̣t v&acirc;́n đ&ecirc;̀ kh&ocirc;ng h&ecirc;̀ đơn r\\giản và cũng kh&ocirc;ng phải của ri&ecirc;ng ai.</span></p>\n\n<p><span style="font-size:16px">Với ti&ecirc;u chí <strong>CHẤT LƯỢNG TỐT - DỊCH VỤ TỐT - GI&Aacute; TH&Agrave;NH TỐT</strong> thì những v&acirc;́n đ&ecirc;̀ v&ecirc;̀ may đ&ocirc;̀ng phục kh&ocirc;ng phải là v&acirc;́n đ&ecirc;̀ mà là sự lựa chọn của các bạn với sự đảm bảo của chúng t&ocirc;i.</span></p>\n\n<p>&nbsp;</p>\n\n<p><img alt="Việc may đồng phục kéo theo hai yếu tố đúng và sai cho doanh nghiệp" src="http://dongphuchoanmy.com/asset/data/news/medium/bigstock-Choice-121713.jpg" style="margin-left:250px; margin-right:250px" /></p>\n\n<p style="text-align: center;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;​Vi&ecirc;̣c may đ&ocirc;̀ng phục kéo theo hai y&ecirc;́u t&ocirc;́ đúng và sai cho doanh nghi&ecirc;̣p</p>\n\n<p style="text-align: center;">&nbsp;</p>\n\n<p><span style="color:#FF0000"><span style="font-size:16px"><em><strong>May đ&ocirc;̀ng phục doanh nghi&ecirc;̣p ch&acirc;́t lượng:</strong></em></span></span></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px">Vi&ecirc;̣c <strong>may đ&ocirc;̀ng phục</strong> kh&ocirc;ng phải chỉ là vi&ecirc;̣c đưa hình của doanh nghi&ecirc;̣p vào m&ocirc;̣t chi&ecirc;́c áo ph&ocirc;ng rẻ ti&ecirc;̀n kh&ocirc;ng có đi&ecirc;̉m nh&acirc;́n. Đi&ecirc;̀u đó làm sai l&ecirc;̣ch hoàn toàn giá trị mà các doanh nghi&ecirc;̣p nhắm tới. Ngoài ra may đ&ocirc;̀ng phục ch&acirc;́t lượng kém cũng kh&ocirc;ng th&ecirc;̉ đảm bảo thời gian sử dụng. Chưa k&ecirc;̉ g&acirc;y m&acirc;́t mĩ quan sau m&ocirc;̣t thời gian ngắn sử dụng như bong tróc hình in, sờn vải, rách, thủng do giặt,&hellip;</span></p>\n\n<p><span style="font-size:16px">V&acirc;̣y tại sao phải lựa chọn đ&ocirc;̀ng phục ch&acirc;́t lượng kém đ&ecirc;̉ tự hạ th&acirc;́p những gì doanh nghi&ecirc;̣p đang g&acirc;y dựng l&ecirc;n mà kh&ocirc;ng đ&ecirc;́n với May đ&ocirc;̀ng phục Hoàn Mỹ&nbsp;của chúng t&ocirc;i đ&ecirc;̉ có th&ecirc;̉ sở hữu những b&ocirc;̣ đ&ocirc;̀ng phục ch&acirc;́t lượng t&ocirc;́t.</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="color:#FF0000"><span style="font-size:16px"><em><strong>May đ&ocirc;̀ng phục doanh nghi&ecirc;̣p kèm dịch vụ ch&acirc;́t lượng?</strong></em></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px">Đau đ&acirc;̀u với những đơn hàng kéo dài &ldquo;cả th&acirc;̣p kỉ&rdquo;? Đúng là n&ecirc;́u như càng ch&acirc;̣m tr&ecirc;̃ hay kh&ocirc;ng giao đủ s&ocirc;́ lượng trong thời gian ngắn nó gi&ocirc;́ng như vi&ecirc;̣c kéo dài cả th&acirc;̣p kỉ v&acirc;̣y. Ví dụ doanh nghi&ecirc;̣p có k&ecirc;́ hoạch may hàng ngàn chi&ecirc;́c áo đ&ocirc;̀ng phục trong thời gian ngắn đ&ecirc;̉ hoàn thành complete của c&ocirc;ng ty nhưng đi&ecirc;̀u đó là b&acirc;́t khả thi với những ch&ocirc;̃ may đ&ocirc;̀ng phục nhỏ lẻ. Hay th&acirc;̣m chí m&acirc;̃u mã có m&ocirc;̣t chút sai khác và kh&ocirc;ng th&ecirc;̉ chỉnh sửa trong thời gian dự ki&ecirc;́n ư? May hoàn mĩ của chúng t&ocirc;i hoàn toàn có th&ecirc;̉ giải quy&ecirc;́t được những v&acirc;́n đ&ecirc;̀ như v&acirc;̣y.</span></p>\n\n<p><span style="font-size:16px">Bạn sẽ kh&ocirc;ng còn phải đợi đợi và đợi,&nbsp;thời gian để&nbsp;may m&ocirc;̣t b&ocirc;̣ đ&ocirc;̀ hay hàng ngàn b&ocirc;̣ đ&ocirc;̀ đ&ocirc;̀ng phục đ&ocirc;́i với chúng t&ocirc;i đ&ecirc;̀u kèm m&ocirc;̣t ti&ecirc;u chí : nhanh nh&acirc;́t với chất lượng tốt nhất ! Đồng Phục Ho&agrave;n Mỹ lu&ocirc;n t&acirc;m niệm uy t&iacute;n,&nbsp;chất lượng l&agrave; thước đo gi&aacute; trị của doanh nghiệp.</span></p>\n\n<p><span style="font-size:16px">Ngoài ra dịch vụ chăm sóc khách hàng của chúng t&ocirc;i cũng r&acirc;́t nhi&ecirc;̣t tình chu đáo. Hotline hoạt đ&ocirc;̣ng 24/7. Đảm bảo ti&ecirc;́n đ&ocirc;̣ của bạn hay của cả t&acirc;̣p th&ecirc;̉ doanh nghi&ecirc;̣p. Gọi cho chúng t&ocirc;i để hiểu th&ecirc;m về chất lượng dịch vụ cũng như để được giải đ&aacute;p mọi thắc mắc của&nbsp;kh&aacute;ch h&agrave;ng .</span></p>\n\n<p style="text-align: center;">&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><span style="color:#FF0000"><span style="font-size:16px"><em><strong>May đ&ocirc;̀ng phục cho doanh nghi&ecirc;̣p ch&acirc;́t lượng, tưởng kh&ocirc;ng rẻ mà rẻ kh&ocirc;ng tưởng...</strong></em></span></span></p>\n\n<p><span style="font-size:16px">Hãy đ&ecirc;́n với chúng t&ocirc;i đ&ecirc;̉ trải nghi&ecirc;̣m m&ocirc;̣t trong những sản ph&acirc;̉m ch&acirc;́t lượng nh&acirc;́t và cũng với giá thành đủ &ldquo;ch&acirc;́t &rdquo; và &ldquo;lượng&rdquo; khi&ecirc;́n vi&ecirc;̣c <strong>may đ&ocirc;̀ng phục doanh nghi&ecirc;̣p</strong> của bạn kh&ocirc;ng còn là gánh nặng nữa. Hãy hình thành vi&ecirc;̣c ti&ecirc;u ti&ecirc;̀n đúng cách và đúng ch&ocirc;̃ đừng đ&ecirc;̉ người khác đánh lừa bạn. Nhi&ecirc;̀u nơi đưa ra mức giá tr&ecirc;n trời v&ecirc;̀ đ&ocirc;̀ng phục ch&acirc;́t lượng th&acirc;́p. Chả nhẽ bạn chọn những b&ocirc;̣ đ&ocirc;̀ng phục như v&acirc;̣y đ&ecirc;̉ làm giảm danh ti&ecirc;́ng c&ocirc;ng ty? Hay những b&ocirc;̣ đ&ocirc;̀ng phục với giá thành đắt đỏ nhưng lại kh&ocirc;ng rõ v&ecirc;̀ ch&acirc;́t lượng của chúng? Dựa vào kinh nghi&ecirc;̣m hơn 10 năm trong lĩnh vực may mặc. Chúng t&ocirc;i đảm bảo những sản ph&acirc;̉m của chúng t&ocirc;i hoàn toàn hợp lí. Với chữ Tín chúng t&ocirc;i dám chắc các bạn kh&ocirc;ng còn thắc mắc nào nữa? N&ecirc;́u còn hãy li&ecirc;n h&ecirc;̣ ngay với chúng t&ocirc;i. &nbsp;Dịch vụ của chúng t&ocirc;i sẽ làm hài lòng các bạn.</span></p>\n\n<p>&nbsp;</p>\n\n<p><span style="font-size:16px">Hãy là người ti&ecirc;u dùng đúng đắn và tránh những quan ni&ecirc;̣m v&ecirc;̀ may đ&ocirc;̀ng phục cho doanh nghi&ecirc;̣p như trước đ&acirc;y.</span></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', NULL, 2, '2016-11-01 22:36:50', '2016-11-01 22:34:00', '2016-11-03 21:09:28', 8, 46, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_trans`
--

CREATE TABLE IF NOT EXISTS `post_trans` (
  `pid` int(11) NOT NULL,
  `p_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `p_slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `p_shorttext` text COLLATE utf8_unicode_ci NOT NULL,
  `p_content` text COLLATE utf8_unicode_ci NOT NULL,
  `p_ref` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_trans`
--

INSERT INTO `post_trans` (`pid`, `p_title`, `p_slug`, `p_shorttext`, `p_content`, `p_ref`) VALUES
(7, 'Xưởng may áo khoác dù, áo đồng phục', 'xuong-may-ao-khoac-du-ao-dong-phuc', '', '<p style="text-align:justify">- &Aacute;o gi&oacute; chống thấm,&aacute;o kho&aacute;c chống thấm,may &aacute;o kho&aacute;c,may &aacute;o gi&oacute; sinh vi&ecirc;n học sinh vải dầu 2 da chống thấm<br />\n- &Aacute;o gi&oacute;,&aacute;o kho&aacute;c vải su&yacute;t or vải micro 96k l&oacute;t lưới hoặc dầu<br />\n- &Aacute;O GI&Oacute; &aacute;o kho&aacute;c ĐỒNG PHỤC HỌC SINH, trường học<br />\n- &Aacute;o gi&oacute; &aacute;o kho&aacute;c đồng phục c&ocirc;ng ty, x&iacute; nghiệp,&aacute;o kho&aacute;c t&igrave;nh nguyện,&aacute;o thun t&igrave;nh nguyện<br />\n- &Aacute;o gi&oacute; &aacute;o kho&aacute;c đồng phục c&ocirc;ng nh&acirc;n,&aacute;o sơ mi c&ocirc;ng nh&acirc;n ,&aacute;o sơ mi c&ocirc;ng sở gi&aacute; rẻ<br />\n- &Aacute;o gi&oacute; &aacute;o kho&aacute;c thể thao,&aacute;o jacket sự kiện<br />\n- &Aacute;O GI&Oacute; &Aacute;O KHO&Aacute;C tổ chức sự kiện,&aacute;o thun,&aacute;o jacket sự kiện<br />\n- &Aacute;o gi&oacute; &aacute;o kho&aacute;c quảng c&aacute;o,&aacute;o thun quảng c&aacute;o,&aacute;o thun nh&acirc;n vi&ecirc;n<br />\n- &Aacute;o gi&oacute; &aacute;o kho&aacute;c qu&agrave; tặng khuyến m&atilde;i,&aacute;o thun khuyến m&atilde;i<br />\nNHẤC M&Aacute;Y GỌI NGAY CHO CH&Uacute;NG T&Ocirc;I NH&Eacute;! 0935 818 711</p>\n', 7),
(9, 'Áo Khoác 007', 'ao-khoac-007', '', '', 9),
(10, 'Áo Khoác 006', 'ao-khoac-006', '', '', 10),
(11, 'Áo Khoác 002', 'ao-khoac-002', '', '', 11),
(12, 'Áo Khoác 005', 'ao-khoac-005', '', '', 12),
(13, 'Áo Khoác 004', 'ao-khoac-004', '', '', 13),
(14, 'Áo Khoác 001', 'ao-khoac-001', '', '', 14),
(17, 'May áo khoác dù', 'may-ao-khoac-du', '', '<p>Xưởng may &aacute;o gi&oacute; &aacute;o kho&aacute;c đồng phục TP HCM chuy&ecirc;n thiết kế v&agrave; may &aacute;o gi&oacute; đồng phục cho c&aacute;c c&ocirc;ng ty, x&iacute; nghiệp, nh&agrave; m&aacute;y, cửa h&agrave;ng, kh&aacute;ch sạn, spa tr&ecirc;n to&agrave;n Quốc. Nhằm phục vụ kh&aacute;ch h&agrave;ng tốt nhất, &aacute;o gi&oacute; đồng phục chuy&ecirc;n nhận tư vấn tận nơi, sở hữu đội ngũ nh&acirc;n vi&ecirc;n thiết kế giỏi, chuy&ecirc;n nghiệp. Ch&uacute;ng t&ocirc;i lu&ocirc;n nỗ lực đem đến cho kh&aacute;ch h&agrave;ng những sản phẩm với kiểu d&aacute;ng thời trang, chất liệu phong ph&uacute;, gi&aacute; cả hợp l&yacute;, ph&ugrave; hợp với y&ecirc;u cầu của kh&aacute;ch h&agrave;ng.</p>\n\n<p>- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c vải micro<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c vải d&ugrave;, su&yacute;t<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c vải nỉ, nỉ c&agrave;o<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c vải da c&aacute;<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c vải nike<br />\n- &Aacute;o gi&oacute;, &aacute;o kho&aacute;c đồng phục<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c sự kiện<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c qu&agrave; tặng<br />\n- &Aacute;o gi&oacute;, &aacute;o gi&oacute; đồng phục, &aacute;o kho&aacute;c thời trang</p>\n', 17),
(18, 'Áo Thun đồng phục', 'ao-thun-dong-phuc', '', '<p>Cơ sở sản xuất Ho&agrave;n Mỹ chuy&ecirc;n may &aacute;o thun như:<br />\n&ndash; &Aacute;o thun l&agrave;m đồng phục c&ocirc;ng ty, nh&agrave; h&agrave;ng, qu&aacute;n ăn.<br />\n&ndash; &Aacute;o nh&oacute;m, &aacute;o lớp với c&aacute;c chất liệu vải như:<br />\n+ Vải c&aacute; sấu (100% cotton; 65/35; PE)<br />\n+ Vải thun Cotton (100% cotton; 65/35; PE)&hellip;<br />\nSản phẩm được thiết kế, sản xuất theo y&ecirc;u cầu của kh&aacute;ch h&agrave;ng.<br />\nGi&aacute; cả cạnh tranh, giao h&agrave;ng tận nơi trong Tp.HCM v&agrave; c&aacute;c tỉnh th&agrave;nh.<br />\nHi vọng sẽ c&oacute; cơ hội được phục vụ Qu&yacute; kh&aacute;ch!</p>\n', 18),
(19, 'Nón du lịch', 'non-du-lich', '', '<p style="text-align: justify;">&nbsp;</p>\n\n<p>C&ocirc;ng ty TNHH TMSX &amp; DV Ho&agrave;n Mỹ xin giới thiệu đến qu&yacute; kh&aacute;ch h&agrave;ng giải ph&aacute;p quảng b&aacute; thương hiệu mới th&ocirc;ng qua những chiếc n&oacute;n tai b&egrave;o. Doanh nghiệp bạn c&oacute; thắc mắc l&agrave; chiếc n&oacute;n tai b&egrave;o th&igrave; l&agrave;m sao quảng b&aacute; được thương hiệu cho m&igrave;nh? Những chiếc n&oacute;n c&oacute; in logo, slogan của doanh nghiệp sẽ mang thương hiệu đến với cộng đồng xung quanh.<br />\nTự h&agrave;o l&agrave; đơn vị may mặc với nhiều năm kinh nghiệm th&igrave; Ho&agrave;n Mỹ lu&ocirc;n lu&ocirc;n cho ra đời những sản phẩm tốt nhất v&agrave; gi&aacute; th&agrave;nh cạnh tranh nhất nhằm đ&aacute;p ứng nhu cầu của c&aacute;c doanh nghiệp, c&ocirc;ng ty.<br />\nC&aacute;c sản phẩm của c&ocirc;ng ty:<br />\n- N&oacute;n quảng c&aacute;o<br />\n- N&oacute;n sự kiện<br />\n- N&oacute;n du lịch</p>\n\n<p>Đến với ch&uacute;ng t&ocirc;i, bạn sẽ được hỗ trợ từ kh&acirc;u thiết kế, l&ecirc;n mẫu cho đến l&uacute;c sản phẩm được kiểm duyệt v&agrave; xuất xưởng. Sử dụng c&ocirc;ng nghệ d&acirc;y chuyền ti&ecirc;n tiến lu&ocirc;n đảm bảo được độ ch&iacute;nh x&aacute;c cũng như ti&ecirc;u chuẩn đảm bảo của sản phẩm<br />\nH&atilde;y li&ecirc;n hệ ngay với ch&uacute;ng t&ocirc;i để c&oacute; được những chiếc n&oacute;n tai b&egrave;o đẹp nhất v&agrave; rẻ nhất.</p>\n', 19),
(20, 'Balo, Túi xách', 'balo-tui-xach', '', '', 20),
(21, 'Balo - Túi Xách', 'balo-tui-xach', '', '<p style="text-align:justify">Balo t&uacute;i x&aacute;ch kh&ocirc;ng chỉ đơn thuần để đựng vật dụng thiết yếu khi ra ngo&agrave;i, đi học, đi du lịch,&hellip; m&agrave; n&oacute; c&ograve;n t&ocirc; điểm th&ecirc;m cho trang phục của bạn, hay mặt kh&aacute;c n&oacute; c&ograve;n gi&uacute;p đem thương hiệu của bạn đi đến khắp những nơi m&agrave; bạn đ&atilde; đặt ch&acirc;n qua.<br />\nC&ocirc;ng ty TNHH TMDV May GIA PH&Uacute;với đội ngũ c&ocirc;ng nh&acirc;n vi&ecirc;n c&oacute; kinh nghiệm cao trong lĩnh vực may mặc, ch&uacute;ng t&ocirc;i tự h&agrave;o về chất lượng sản phẩm m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; cung cấp tr&ecirc;n thị trường tr&ecirc;n phương diện hợp t&aacute;c với c&aacute;c thương hiệu lớn như: Adidas, Eastak, Lammer, Bauer, Adidas, Nike, Redbook,&hellip;<br />\nNgo&agrave;i ra ch&uacute;ng t&ocirc;i cũng đưa sản phẩm của m&igrave;nh đến gần hơn với người ti&ecirc;u d&ugrave;ng trong những chiếc cặp xinh xắn c&aacute;c b&eacute; mần non mang theo b&ecirc;n m&igrave;nh mỗi ng&agrave;y, những chiếc cặp đưa thương hiệu của c&aacute;c trường đại học đi khắp c&aacute;c trường anh ngữ: Ila, Việt Mỹ,&hellip; những thương hiệu nổi tiếng như: Honda, Dai-ichi-life&hellip;<br />\nHy vọng trong thời gian sắp tới c&oacute; cơ hội hợp t&aacute;c.</p>\n', 21),
(22, 'Đồng phục công sở sang trọng', 'dong-phuc-cong-so-sang-trong', '', '', 22),
(23, 'Đồng Phục Học Sinh', 'dong-phuc-hoc-sinh', '', '', 23),
(24, 'Áo Khoác 003', 'ao-khoac-003', '', '', 24),
(25, 'Áo Thun Đồng Phục 001', 'ao-thun-dong-phuc-001', '', '', 25),
(26, 'Áo Khoác 008', 'ao-khoac-008', '', '', 26),
(27, 'Áo Khoác 002', 'ao-khoac-002', '', '', 27),
(28, 'Áo Khoác 003', 'ao-khoac-003', '', '', 28),
(29, 'Áo Khoác 008', 'ao-khoac-008', '', '', 29),
(30, 'Áo Khoác 003', 'ao-khoac-003', '', '', 30),
(31, 'Áo Khoác 008', 'ao-khoac-008', '', '', 31),
(32, 'Áo Khoác 009', 'ao-khoac-009', '', '', 32),
(33, 'Áo Khoác 010', 'ao-khoac-010', '', '', 33),
(34, 'Áo Khoác 011', 'ao-khoac-011', '', '', 34),
(35, 'Áo Khoác 012', 'ao-khoac-012', '', '', 35),
(36, 'Áo Khoác 013', 'ao-khoac-013', '', '', 36),
(37, 'Áo Khoác 014', 'ao-khoac-014', '', '', 37),
(38, 'Áo Khoác 015', 'ao-khoac-015', '', '', 38),
(39, 'Áo Khoác 016', 'ao-khoac-016', '', '', 39),
(40, 'Áo Khoác 017', 'ao-khoac-017', '', '', 40),
(41, 'Áo Khoác 018', 'ao-khoac-018', '', '', 41),
(42, 'Áo Khoác 019', 'ao-khoac-019', '', '', 42),
(43, 'Áo Khoác 020', 'ao-khoac-020', '', '', 43),
(44, 'Áo Khoác 021', 'ao-khoac-021', '', '', 44),
(45, 'Áo Khoác 022', 'ao-khoac-022', '', '', 45),
(46, 'Áo Khoác 023', 'ao-khoac-023', '', '', 46),
(47, 'Áo Khoác 024', 'ao-khoac-024', '', '', 47),
(48, 'Áo Khoác 025', 'ao-khoac-025', '', '', 48),
(49, 'Áo Khoác 026', 'ao-khoac-026', '', '', 49),
(50, 'Áo Khoác 027', 'ao-khoac-027', '', '', 50),
(51, 'Áo Khoác 028', 'ao-khoac-028', '', '', 51),
(52, 'Áo Khoác 029', 'ao-khoac-029', '', '', 52),
(53, 'Áo Khoác 030', 'ao-khoac-030', '', '', 53),
(54, 'Áo Khoác 031', 'ao-khoac-031', '', '', 54),
(55, 'Áo Khoác 032', 'ao-khoac-032', '', '', 55),
(56, 'Áo Khoác 033', 'ao-khoac-033', '', '', 56),
(57, 'Áo Khoác 034', 'ao-khoac-034', '', '', 57),
(58, 'Áo Khoác 035', 'ao-khoac-035', '', '', 58),
(59, 'Áo Khoác 036', 'ao-khoac-036', '', '', 59),
(60, 'Áo Thun Đồng Phục 002', 'ao-thun-dong-phuc-002', '', '', 60),
(61, 'Áo Thun Đồng Phục 003', 'ao-thun-dong-phuc-003', '', '', 61),
(62, 'Áo Thun Đồng Phục 004', 'ao-thun-dong-phuc-004', '', '', 62),
(63, 'Áo Thun Đồng Phục 005', 'ao-thun-dong-phuc-005', '', '', 63),
(64, 'Áo Thun Đồng Phục 006', 'ao-thun-dong-phuc-006', '', '', 64),
(65, 'Áo Thun Đồng Phục 007', 'ao-thun-dong-phuc-007', '', '', 65),
(66, 'Áo Thun Đồng Phục 008', 'ao-thun-dong-phuc-008', '', '', 66),
(67, 'Áo Thun Đồng Phục 009', 'ao-thun-dong-phuc-009', '', '', 67),
(68, 'Áo Thun Đồng Phục 010', 'ao-thun-dong-phuc-010', '', '', 68),
(69, 'Áo Thun Đồng Phục 011', 'ao-thun-dong-phuc-011', '', '', 69),
(70, 'Áo Thun Đồng Phục 012', 'ao-thun-dong-phuc-012', '', '', 70),
(71, 'Áo Thun Đồng Phục 013', 'ao-thun-dong-phuc-013', '', '', 71),
(72, 'Áo Thun Đồng Phục 014', 'ao-thun-dong-phuc-014', '', '', 72),
(73, 'Áo Thun Đồng Phục 015', 'ao-thun-dong-phuc-015', '', '', 73),
(74, 'Áo Thun Đồng Phục 016', 'ao-thun-dong-phuc-016', '', '', 74),
(75, 'Áo Thun Đồng Phục 017', 'ao-thun-dong-phuc-017', '', '', 75),
(76, 'Áo Thun Đồng Phục 018', 'ao-thun-dong-phuc-018', '', '', 76),
(77, 'Áo Thun Đồng Phục 019', 'ao-thun-dong-phuc-019', '', '', 77),
(78, 'Áo Thun Đồng Phục 020', 'ao-thun-dong-phuc-020', '', '', 78),
(79, 'Áo Thun Đồng Phục 021', 'ao-thun-dong-phuc-021', '', '', 79),
(80, 'Áo Thun Đồng Phục 022', 'ao-thun-dong-phuc-022', '', '', 80),
(81, 'Áo Thun Đồng Phục 023', 'ao-thun-dong-phuc-023', '', '', 81),
(82, 'Áo Thun Đồng Phục 024', 'ao-thun-dong-phuc-024', '', '', 82),
(83, 'Áo Thun Đồng Phục 025', 'ao-thun-dong-phuc-025', '', '', 83),
(84, 'Áo Thun Đồng Phục 026', 'ao-thun-dong-phuc-026', '', '', 84),
(85, 'Áo Thun Đồng Phục 027', 'ao-thun-dong-phuc-027', '', '', 85),
(86, 'Áo Thun Đồng Phục 028', 'ao-thun-dong-phuc-028', '', '', 86),
(87, 'Áo Thun Đồng Phục 029', 'ao-thun-dong-phuc-029', '', '', 87),
(88, 'Áo Thun Đồng Phục 030', 'ao-thun-dong-phuc-030', '', '', 88),
(89, 'Áo Thun Đồng Phục 031', 'ao-thun-dong-phuc-031', '', '', 89),
(90, 'Áo Thun Đồng Phục 032', 'ao-thun-dong-phuc-032', '', '', 90),
(91, 'Áo Thun Đồng Phục 033', 'ao-thun-dong-phuc-033', '', '', 91),
(92, 'Áo Thun Đồng Phục 034', 'ao-thun-dong-phuc-034', '', '', 92),
(93, 'Áo Thun Đồng Phục 035', 'ao-thun-dong-phuc-035', '', '', 93),
(94, 'Áo Thun Đồng Phục 036', 'ao-thun-dong-phuc-036', '', '', 94),
(95, 'Áo Thun Đồng Phục 037', 'ao-thun-dong-phuc-037', '', '', 95),
(96, 'Áo Thun Đồng Phục 038', 'ao-thun-dong-phuc-038', '', '', 96),
(97, 'Áo Thun Đồng Phục 039', 'ao-thun-dong-phuc-039', '', '', 97),
(98, 'Áo Thun Đồng Phục 040', 'ao-thun-dong-phuc-040', '', '', 98),
(99, 'Áo Thun Đồng Phục 041', 'ao-thun-dong-phuc-041', '', '', 99),
(100, 'Áo Thun Đồng Phục 042', 'ao-thun-dong-phuc-042', '', '', 100),
(101, 'Áo Thun Đồng Phục 043', 'ao-thun-dong-phuc-043', '', '', 101),
(102, 'Áo Thun Đồng Phục 044', 'ao-thun-dong-phuc-044', '', '', 102),
(103, 'Áo Thun Đồng Phục 045', 'ao-thun-dong-phuc-045', '', '', 103),
(104, 'Áo Thun Đồng Phục 046', 'ao-thun-dong-phuc-046', '', '', 104),
(105, 'Áo Thun Đồng Phục 047', 'ao-thun-dong-phuc-047', '', '', 105),
(106, 'Áo Thun Đồng Phục 048', 'ao-thun-dong-phuc-048', '', '', 106),
(107, 'Áo Thun Quảng Cáo 001', 'ao-thun-quang-cao-001', '', '', 107),
(108, 'Áo Thun Quảng Cáo 002', 'ao-thun-quang-cao-002', '', '', 108),
(109, 'Áo Thun Quảng Cáo 003', 'ao-thun-quang-cao-003', '', '', 109),
(110, 'Áo Thun Quảng Cáo 004', 'ao-thun-quang-cao-004', '', '', 110),
(111, 'Áo Thun Quảng Cáo 005', 'ao-thun-quang-cao-005', '', '', 111),
(112, 'Áo Thun Quảng Cáo 006', 'ao-thun-quang-cao-006', '', '', 112),
(113, 'Áo Thun Quảng Cáo 007', 'ao-thun-quang-cao-007', '', '', 113),
(114, 'Áo Thun Quảng Cáo 008', 'ao-thun-quang-cao-008', '', '', 114),
(115, 'Áo Thun Quảng Cáo 009', 'ao-thun-quang-cao-009', '', '', 115),
(116, 'Áo Thun Quảng Cáo 010', 'ao-thun-quang-cao-010', '', '', 116),
(117, 'Áo Thun Quảng Cáo 011', 'ao-thun-quang-cao-011', '', '', 117),
(118, 'Áo Thun Quảng Cáo 012', 'ao-thun-quang-cao-012', '', '', 118),
(119, 'Áo Thun Quảng Cáo 013', 'ao-thun-quang-cao-013', '', '', 119),
(120, 'Áo Thun Quảng Cáo 014', 'ao-thun-quang-cao-014', '', '', 120),
(121, 'Áo Thun Quảng Cáo 015', 'ao-thun-quang-cao-015', '', '', 121),
(122, 'Áo Thun Quảng Cáo 016', 'ao-thun-quang-cao-016', '', '', 122),
(123, 'Áo Thun Quảng Cáo 017', 'ao-thun-quang-cao-017', '', '', 123),
(124, 'Áo Thun Quảng Cáo 018', 'ao-thun-quang-cao-018', '', '', 124),
(125, 'Áo Thun Quảng Cáo 019', 'ao-thun-quang-cao-019', '', '', 125),
(126, 'Áo Thun Quảng Cáo 020', 'ao-thun-quang-cao-020', '', '', 126),
(127, 'Áo Thun Quảng Cáo 021', 'ao-thun-quang-cao-021', '', '', 127),
(128, 'Áo Thun Quảng Cáo 022', 'ao-thun-quang-cao-022', '', '', 128),
(129, 'Áo Thun Quảng Cáo 023', 'ao-thun-quang-cao-023', '', '', 129),
(130, 'Áo Thun Quảng Cáo 024', 'ao-thun-quang-cao-024', '', '', 130),
(131, 'Áo Thun Quảng Cáo 025', 'ao-thun-quang-cao-025', '', '', 131),
(132, 'Áo Thun Quảng Cáo 026', 'ao-thun-quang-cao-026', '', '', 132),
(133, 'Balo Quảng Cáo 001', 'balo-quang-cao-001', '', '', 133),
(134, 'Balo Quảng Cáo 001', 'balo-quang-cao-001', '', '', 134),
(135, 'Balo Quảng Cáo 002', 'balo-quang-cao-002', '', '', 135),
(136, 'Balo Quảng Cáo 003', 'balo-quang-cao-003', '', '', 136),
(137, 'Balo Quảng Cáo 004', 'balo-quang-cao-004', '', '', 137),
(138, 'Balo Quảng Cáo 005', 'balo-quang-cao-005', '', '', 138),
(139, 'Balo Quảng Cáo 006', 'balo-quang-cao-006', '', '', 139),
(140, 'Balo Quảng Cáo 007', 'balo-quang-cao-007', '', '', 140),
(141, 'Balo Quảng Cáo 008', 'balo-quang-cao-008', '', '', 141),
(142, 'Balo Quảng Cáo 009', 'balo-quang-cao-009', '', '', 142),
(143, 'Balo Quảng Cáo 010', 'balo-quang-cao-010', '', '', 143),
(144, 'Balo Quảng Cáo 011', 'balo-quang-cao-011', '', '', 144),
(145, 'Balo Quảng Cáo 012', 'balo-quang-cao-012', '', '', 145),
(146, 'Balo Quảng Cáo 013', 'balo-quang-cao-013', '', '', 146),
(147, 'Balo Quảng Cáo 014', 'balo-quang-cao-014', '', '', 147),
(148, 'Balo Quảng Cáo 015', 'balo-quang-cao-015', '', '', 148),
(149, 'Balo Quảng Cáo 016', 'balo-quang-cao-016', '', '', 149),
(150, 'Balo Quảng Cáo 017', 'balo-quang-cao-017', '', '', 150),
(151, 'Balo Quảng Cáo 018', 'balo-quang-cao-018', '', '', 151),
(152, 'Balo Quảng Cáo 019', 'balo-quang-cao-019', '', '', 152),
(153, 'Balo Quảng Cáo 020', 'balo-quang-cao-020', '', '', 153),
(154, 'Balo Quảng Cáo 021', 'balo-quang-cao-021', '', '', 154),
(155, 'Balo Quảng Cáo 022', 'balo-quang-cao-022', '', '', 155),
(156, 'Balo Quảng Cáo 023', 'balo-quang-cao-023', '', '', 156),
(157, 'Balo Quảng Cáo 024', 'balo-quang-cao-024', '', '', 157),
(158, 'Balo Quảng Cáo 025', 'balo-quang-cao-025', '', '', 158),
(159, 'Balo Quảng Cáo 026', 'balo-quang-cao-026', '', '', 159),
(160, 'Balo Quảng Cáo 027', 'balo-quang-cao-027', '', '', 160),
(161, 'Balo Quảng Cáo 028', 'balo-quang-cao-028', '', '', 161),
(162, 'Balo Quảng Cáo 029', 'balo-quang-cao-029', '', '', 162),
(163, 'Balo Quảng Cáo 030', 'balo-quang-cao-030', '', '', 163),
(164, 'Balo Quảng Cáo 031', 'balo-quang-cao-031', '', '', 164),
(165, 'Balo Quảng Cáo 032', 'balo-quang-cao-032', '', '', 165),
(166, 'Balo Quảng Cáo 033', 'balo-quang-cao-033', '', '', 166),
(167, 'Balo Quảng Cáo 034', 'balo-quang-cao-034', '', '', 167),
(168, 'Balo Quảng Cáo 035', 'balo-quang-cao-035', '', '', 168),
(169, 'Balo Quảng Cáo 036', 'balo-quang-cao-036', '', '', 169),
(170, 'Balo Quảng Cáo 037', 'balo-quang-cao-037', '', '', 170),
(171, 'Balo Quảng Cáo 038', 'balo-quang-cao-038', '', '', 171),
(172, 'Túi Xách 001', 'tui-xach-001', '', '', 172),
(173, 'Túi Xách 002', 'tui-xach-002', '', '', 173),
(174, 'Túi Xách 003', 'tui-xach-003', '', '', 174),
(175, 'Túi Xách 004', 'tui-xach-004', '', '', 175),
(176, 'Túi Xách 005', 'tui-xach-005', '', '', 176),
(177, 'Túi Xách 006', 'tui-xach-006', '', '', 177),
(178, 'Túi Xách 007', 'tui-xach-007', '', '', 178),
(179, 'Túi Xách 008', 'tui-xach-008', '', '', 179),
(180, 'Túi Xách 009', 'tui-xach-009', '', '', 180),
(181, 'Túi Xách 010', 'tui-xach-010', '', '', 181),
(182, 'Túi Xách 011', 'tui-xach-011', '', '', 182),
(183, 'Túi Xách 012', 'tui-xach-012', '', '', 183),
(184, 'Đồng Phục Công Sở 001', 'dong-phuc-cong-so-001', '', '', 184),
(185, 'Đồng Phục Công Sở 002', 'dong-phuc-cong-so-002', '', '', 185),
(186, 'Đồng Phục Công Sở 003', 'dong-phuc-cong-so-003', '', '', 186),
(187, 'Đồng Phục Công Sở 004', 'dong-phuc-cong-so-004', '', '', 187),
(188, 'Đồng Phục Công Sở 005', 'dong-phuc-cong-so-005', '', '', 188),
(189, 'Đồng Phục Công Sở 006', 'dong-phuc-cong-so-006', '', '', 189),
(190, 'Đồng Phục Công Sở 007', 'dong-phuc-cong-so-007', '', '', 190),
(191, 'Đồng Phục Công Sở 008', 'dong-phuc-cong-so-008', '', '', 191),
(192, 'Đồng Phục Công Sở 009', 'dong-phuc-cong-so-009', '', '', 192),
(193, 'Đồng Phục Công Sở 010', 'dong-phuc-cong-so-010', '', '', 193),
(194, 'Đồng Phục Công Sở 011', 'dong-phuc-cong-so-011', '', '', 194),
(195, 'Đồng Phục Công Sở 012', 'dong-phuc-cong-so-012', '', '', 195),
(196, 'Đồng Phục Công Sở 013', 'dong-phuc-cong-so-013', '', '', 196),
(197, 'Đồng Phục Công Sở 014', 'dong-phuc-cong-so-014', '', '', 197),
(198, 'Đồng Phục Công Sở 015', 'dong-phuc-cong-so-015', '', '', 198),
(199, 'Đồng Phục Công Sở 016', 'dong-phuc-cong-so-016', '', '', 199),
(200, 'Đồng Phục Công Sở 017', 'dong-phuc-cong-so-017', '', '', 200),
(201, 'Đồng Phục Công Sở 018', 'dong-phuc-cong-so-018', '', '', 201),
(202, 'Đồng Phục Công Sở 019', 'dong-phuc-cong-so-019', '', '', 202),
(203, 'Đồng Phục Công Sở 020', 'dong-phuc-cong-so-020', '', '', 203),
(204, 'Đồng Phục Công Sở 021', 'dong-phuc-cong-so-021', '', '', 204),
(205, 'Đồng Phục Công Sở 022', 'dong-phuc-cong-so-022', '', '', 205),
(206, 'Đồng Phục Công Sở 023', 'dong-phuc-cong-so-023', '', '', 206),
(207, 'Đồng Phục Công Sở 024', 'dong-phuc-cong-so-024', '', '', 207),
(208, 'Đồng Phục Công Sở 025', 'dong-phuc-cong-so-025', '', '', 208),
(209, 'Đồng Phục Công Sở 026', 'dong-phuc-cong-so-026', '', '', 209),
(210, 'Đồng Phục Công Sở 027', 'dong-phuc-cong-so-027', '', '', 210),
(211, 'Đồng Phục Công Sở 028', 'dong-phuc-cong-so-028', '', '', 211),
(212, 'Đồng Phục Công Sở 029', 'dong-phuc-cong-so-029', '', '', 212),
(213, 'Đồng Phục Công Sở 030', 'dong-phuc-cong-so-030', '', '', 213),
(214, 'Đồng Phục Công Sở 031', 'dong-phuc-cong-so-031', '', '', 214),
(215, 'Đồng Phục Công Sở 032', 'dong-phuc-cong-so-032', '', '', 215),
(216, 'Đồng Phục Công Sở 033', 'dong-phuc-cong-so-033', '', '', 216),
(217, 'Đồng Phục Công Sở 034', 'dong-phuc-cong-so-034', '', '', 217),
(218, 'Đồng Phục Công Sở 035', 'dong-phuc-cong-so-035', '', '', 218),
(219, 'Nón Du Lịch 001', 'non-du-lich-001', '', '', 219),
(220, 'Nón Du Lịch 002', 'non-du-lich-002', '', '', 220),
(221, 'Nón Du Lịch 003', 'non-du-lich-003', '', '', 221),
(222, 'Nón Du Lịch 004', 'non-du-lich-004', '', '', 222),
(223, 'Nón Du Lịch 005', 'non-du-lich-005', '', '', 223),
(224, 'Nón Du Lịch 006', 'non-du-lich-006', '', '', 224),
(225, 'Nón Du Lịch 007', 'non-du-lich-007', '', '', 225),
(226, 'Nón Du Lịch 008', 'non-du-lich-008', '', '', 226),
(227, 'Nón Du Lịch 009', 'non-du-lich-009', '', '', 227),
(228, 'Nón Du Lịch 010', 'non-du-lich-010', '', '', 228),
(229, 'Nón Du Lịch 011', 'non-du-lich-011', '', '', 229),
(230, 'Nón Du Lịch 012', 'non-du-lich-012', '', '', 230),
(231, 'Nón Du Lịch 013', 'non-du-lich-013', '', '', 231),
(232, 'Nón Du Lịch 014', 'non-du-lich-014', '', '', 232),
(233, 'Nón Du Lịch 015', 'non-du-lich-015', '', '', 233),
(234, 'Nón Du Lịch 016', 'non-du-lich-016', '', '', 234),
(235, 'Nón Du Lịch 017', 'non-du-lich-017', '', '', 235),
(236, 'Nón Du Lịch 018', 'non-du-lich-018', '', '', 236),
(237, 'Nón Du Lịch 019', 'non-du-lich-019', '', '', 237),
(238, 'Nón Du Lịch 020', 'non-du-lich-020', '', '', 238),
(239, 'Nón Du Lịch 021', 'non-du-lich-021', '', '', 239),
(240, 'Nón Du Lịch 022', 'non-du-lich-022', '', '', 240),
(241, 'Nón Du Lịch 023', 'non-du-lich-023', '', '', 241),
(242, 'Nón Quảng Cáo 001', 'non-quang-cao-001', '', '', 242),
(243, 'Nón Quảng Cáo 002', 'non-quang-cao-002', '', '', 243),
(244, 'Nón Quảng Cáo 003', 'non-quang-cao-003', '', '', 244),
(245, 'Nón Quảng Cáo 004', 'non-quang-cao-004', '', '', 245),
(246, 'Nón Quảng Cáo 005', 'non-quang-cao-005', '', '', 246),
(247, 'Nón Quảng Cáo 006', 'non-quang-cao-006', '', '', 247),
(248, 'Nón Quảng Cáo 007', 'non-quang-cao-007', '', '', 248),
(249, 'Nón Quảng Cáo 008', 'non-quang-cao-008', '', '', 249),
(250, 'Nón Quảng Cáo 009', 'non-quang-cao-009', '', '', 250),
(251, 'Nón Quảng Cáo 010', 'non-quang-cao-010', '', '', 251),
(252, 'Nón Quảng Cáo 011', 'non-quang-cao-011', '', '', 252),
(253, 'Nón Quảng Cáo 012', 'non-quang-cao-012', '', '', 253),
(254, 'Nón Quảng Cáo 013', 'non-quang-cao-013', '', '', 254),
(255, 'Nón Quảng Cáo 014', 'non-quang-cao-014', '', '', 255),
(256, 'Nón Quảng Cáo 015', 'non-quang-cao-015', '', '', 256),
(257, 'Nón Quảng Cáo 016', 'non-quang-cao-016', '', '', 257),
(258, 'Nón Quảng Cáo 017', 'non-quang-cao-017', '', '', 258),
(259, 'Nón Quảng Cáo 018', 'non-quang-cao-018', '', '', 259),
(260, 'Nón Quảng Cáo 019', 'non-quang-cao-019', '', '', 260),
(261, 'Nón Quảng Cáo 020', 'non-quang-cao-020', '', '', 261),
(262, 'Nón Quảng Cáo 021', 'non-quang-cao-021', '', '', 262),
(263, 'Nón Quảng Cáo 022', 'non-quang-cao-022', '', '', 263),
(264, 'Nón Quảng Cáo 023', 'non-quang-cao-023', '', '', 264),
(265, 'Nón Quảng Cáo 024', 'non-quang-cao-024', '', '', 265),
(266, 'Nón Quảng Cáo 025', 'non-quang-cao-025', '', '', 266),
(267, 'Nón Quảng Cáo 026', 'non-quang-cao-026', '', '', 267),
(268, 'Nón Quảng Cáo 027', 'non-quang-cao-027', '', '', 268),
(269, 'Nón Quảng Cáo 028', 'non-quang-cao-028', '', '', 269),
(270, 'Nón Quảng Cáo 029', 'non-quang-cao-029', '', '', 270),
(271, 'Nón Quảng Cáo 030', 'non-quang-cao-030', '', '', 271),
(272, 'Nón Quảng Cáo 031', 'non-quang-cao-031', '', '', 272),
(273, 'Nón Quảng Cáo 032', 'non-quang-cao-032', '', '', 273),
(274, 'Nón Quảng Cáo 033', 'non-quang-cao-033', '', '', 274),
(275, 'Nón Quảng Cáo 034', 'non-quang-cao-034', '', '', 275),
(276, 'Nón Quảng Cáo 035', 'non-quang-cao-035', '', '', 276),
(277, 'Nón Quảng Cáo 036', 'non-quang-cao-036', '', '', 277),
(278, 'Nón Quảng Cáo 037', 'non-quang-cao-037', '', '', 278),
(279, 'Nón Quảng Cáo 038', 'non-quang-cao-038', '', '', 279),
(280, 'Nón Quảng Cáo 039', 'non-quang-cao-039', '', '', 280),
(281, 'Nón Quảng Cáo 040', 'non-quang-cao-040', '', '', 281),
(282, 'Nón Quảng Cáo 041', 'non-quang-cao-041', '', '', 282),
(283, 'Nón Quảng Cáo 042', 'non-quang-cao-042', '', '', 283),
(284, 'Nón Quảng Cáo 043', 'non-quang-cao-043', '', '', 284),
(285, 'Nón Quảng Cáo 044', 'non-quang-cao-044', '', '', 285),
(286, 'Nón Quảng Cáo 045', 'non-quang-cao-045', '', '', 286),
(287, 'Nón Quảng Cáo 046', 'non-quang-cao-046', '', '', 287),
(288, 'Nón Quảng Cáo 047', 'non-quang-cao-047', '', '', 288),
(289, 'Nón Quảng Cáo 048', 'non-quang-cao-048', '', '', 289),
(290, 'Nón Quảng Cáo 049', 'non-quang-cao-049', '', '', 290),
(291, 'Nón Quảng Cáo 050', 'non-quang-cao-050', '', '', 291),
(292, 'Nón Quảng Cáo 051', 'non-quang-cao-051', '', '', 292),
(293, 'Nón Quảng Cáo 052', 'non-quang-cao-052', '', '', 293),
(294, 'Nón Quảng Cáo 053', 'non-quang-cao-053', '', '', 294),
(295, 'Nón Quảng Cáo 054', 'non-quang-cao-054', '', '', 295),
(296, 'Nón Quảng Cáo 055', 'non-quang-cao-055', '', '', 296),
(297, 'Nón Quảng Cáo 056', 'non-quang-cao-056', '', '', 297),
(298, 'Nón Quảng Cáo 057', 'non-quang-cao-057', '', '', 298),
(299, 'Nón Quảng Cáo 058', 'non-quang-cao-058', '', '', 299),
(300, 'Nón Quảng Cáo 059', 'non-quang-cao-059', '', '', 300),
(301, 'test', 'test', '', '', 301),
(302, 'Áo thun đồng phục và những kiến thức cần biết.', 'ao-thun-dong-phuc-va-nhung-kien-thuc-can-biet', '', '', 302),
(303, 'May đồng phục Doanh nghiệp, liệu các bạn đã hiểu đúng?', 'may-dong-phuc-doanh-nghiep-lieu-cac-ban-da-hieu-dung', '', '', 303);

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE IF NOT EXISTS `submission` (
  `sid` int(11) NOT NULL,
  `s_title` varchar(50) NOT NULL,
  `s_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `s_mobi` int(15) DEFAULT NULL,
  `s_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `s_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `s_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_stat` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`sid`, `s_title`, `s_name`, `s_mobi`, `s_email`, `s_content`, `s_datetime`, `s_stat`) VALUES
(3, 'dsgdfg', 'khoa', 1233263003, 'xhtkhoa@gmail.com', 'dfcgdfgfd\r\nh\r\ndfh\r\nbdfnf\r\ng\r\ndgdfhgf', '2015-12-10 01:22:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tid` int(11) NOT NULL,
  `t_unique` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `t_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `t_slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `t_lang` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tid`, `t_unique`, `t_name`, `t_slug`, `t_lang`) VALUES
(20, '2-GrainPro', 'GrainPro', 'grainpro', 2),
(21, '1-GrainPro', 'GrainPro', 'grainpro', 1),
(23, '1-BHL AgroSmart', 'BHL AgroSmart', 'bhl-agrosmart', 1),
(24, '1-công nghệ siêu kín khí', 'công nghệ siêu kín khí', 'cong-nghe-sieu-kin-khi', 1),
(25, '2-BHL AgroSmart', 'BHL AgroSmart', 'bhl-agrosmart', 2),
(26, '2-GrainPro Philippines', 'GrainPro Philippines', 'grainpro-philippines', 2),
(27, '2-Ultra Hermetic technology', 'Ultra Hermetic technology', 'ultra-hermetic-technology', 2),
(28, '1-tập đoàn Kanematsu', 'tập đoàn Kanematsu', 'tap-doan-kanematsu', 1),
(29, '1-túi bảo quản TranSafeliner G-HF', 'túi bảo quản TranSafeliner G-HF', 'tui-bao-quan-transafeliner-g-hf', 1),
(30, '1-bảo quản gạo chất lượng cao', 'bảo quản gạo chất lượng cao', 'bao-quan-gao-chat-luong-cao', 1),
(31, '2-Kanematsu Vietnam', 'Kanematsu Vietnam', 'kanematsu-vietnam', 2),
(32, '2-high quality rice preservation', 'high quality rice preservation', 'high-quality-rice-preservation', 2),
(33, '2-GrainPro''s TranSafeliner G-HF', 'GrainPro''s TranSafeliner G-HF', 'grainpros-transafeliner-g-hf', 2),
(34, '1-GrainSafe', 'GrainSafe', 'grainsafe', 1),
(35, '2-GrainSafe', 'GrainSafe', 'grainsafe', 2),
(36, '1-tag tiếng Việt', 'tag tiếng Việt', 'tag-tieng-viet', 1),
(37, '2-tag in English', 'tag in English', 'tag-in-english', 2),
(38, '1-iodslfgd', 'iodslfgd', 'iodslfgd', 1),
(39, '2-new tag', 'new tag', 'new-tag', 2),
(40, '1-tag 1', 'tag 1', 'tag-1', 1),
(41, '1-test', 'test', 'test', 1),
(42, '1-non quang cao', 'non quang cao', 'non-quang-cao', 1),
(44, '1-non du lich', 'non du lich', 'non-du-lich', 1),
(91, '1- non du lich', ' non du lich', 'non-du-lich', 1),
(92, '1-xuong may ao khoac', 'xuong may ao khoac', 'xuong-may-ao-khoac', 1),
(94, '1-may ao khoac dong phuc', 'may ao khoac dong phuc', 'may-ao-khoac-dong-phuc', 1),
(95, '1-may áo khoác đồng phục', 'may áo khoác đồng phục', 'may-ao-khoac-dong-phuc', 1),
(202, '1-dong phuc cong ty', 'dong phuc cong ty', 'dong-phuc-cong-ty', 1),
(203, '1-đồng phục công ty', 'đồng phục công ty', 'dong-phuc-cong-ty', 1),
(204, '1-dong phuc doanh nghiep', 'dong phuc doanh nghiep', 'dong-phuc-doanh-nghiep', 1),
(205, '1-đồng phục doanh nghiệp', 'đồng phục doanh nghiệp', 'dong-phuc-doanh-nghiep', 1),
(342, '1-xuong may balo tui xach', 'xuong may balo tui xach', 'xuong-may-balo-tui-xach', 1),
(344, '1-may balo quang cao', 'may balo quang cao', 'may-balo-quang-cao', 1),
(346, '1-may balo qua tang', 'may balo qua tang', 'may-balo-qua-tang', 1),
(490, '1-ao thun dong phuc', 'ao thun dong phuc', 'ao-thun-dong-phuc', 1),
(491, '1-áo thun đồng phục', 'áo thun đồng phục', 'ao-thun-dong-phuc', 1),
(585, '1-ao thun quang cao', 'ao thun quang cao', 'ao-thun-quang-cao', 1),
(601, '1-ao thun qua tang', 'ao thun qua tang', 'ao-thun-qua-tang', 1),
(626, '1-áo lớp', 'áo lớp', 'ao-lop', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag_ref`
--

CREATE TABLE IF NOT EXISTS `tag_ref` (
  `trid` int(11) NOT NULL,
  `tr_pid` int(11) NOT NULL,
  `tr_tid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag_ref`
--

INSERT INTO `tag_ref` (`trid`, `tr_pid`, `tr_tid`) VALUES
(1, 3, 1),
(2, 3, 3),
(3, 3, 4),
(4, 3, 5),
(6, 3, 7),
(15, 4, 1),
(18, 4, 1),
(19, 4, 1),
(25, 3, 23),
(26, 3, 24),
(27, 3, 25),
(28, 3, 26),
(29, 3, 27),
(30, 5, 28),
(31, 5, 29),
(32, 5, 30),
(33, 5, 31),
(34, 5, 32),
(35, 5, 33),
(36, 4, 34),
(37, 4, 35),
(38, 8, 36),
(39, 8, 37),
(44, 219, 42),
(45, 219, 42),
(46, 219, 44),
(47, 219, 44),
(48, 220, 42),
(49, 220, 42),
(50, 220, 44),
(51, 220, 44),
(52, 220, 42),
(53, 220, 44),
(54, 221, 42),
(55, 221, 44),
(56, 222, 42),
(57, 222, 44),
(58, 223, 42),
(59, 223, 44),
(60, 224, 42),
(61, 224, 44),
(62, 225, 42),
(63, 225, 44),
(64, 226, 42),
(65, 226, 44),
(66, 227, 42),
(67, 227, 44),
(68, 228, 42),
(69, 228, 44),
(70, 229, 42),
(71, 229, 44),
(72, 230, 42),
(73, 230, 44),
(74, 231, 42),
(75, 231, 44),
(76, 232, 42),
(77, 232, 44),
(78, 233, 42),
(79, 233, 44),
(80, 234, 42),
(81, 234, 44),
(82, 235, 42),
(83, 235, 44),
(84, 236, 42),
(85, 236, 44),
(86, 237, 42),
(87, 237, 44),
(88, 238, 42),
(89, 238, 44),
(90, 239, 42),
(91, 239, 44),
(92, 240, 42),
(93, 240, 91),
(94, 241, 42),
(95, 241, 91),
(96, 242, 42),
(97, 242, 91),
(98, 243, 42),
(99, 243, 44),
(100, 244, 42),
(101, 244, 44),
(102, 245, 42),
(103, 245, 44),
(104, 246, 42),
(105, 246, 44),
(106, 247, 42),
(107, 247, 44),
(108, 248, 42),
(109, 248, 44),
(110, 249, 42),
(111, 249, 44),
(112, 250, 42),
(113, 250, 44),
(114, 251, 42),
(115, 251, 44),
(116, 252, 42),
(117, 252, 44),
(118, 253, 42),
(119, 253, 44),
(120, 254, 42),
(121, 254, 44),
(122, 255, 42),
(123, 255, 44),
(124, 256, 42),
(125, 256, 44),
(126, 257, 42),
(127, 257, 44),
(128, 258, 42),
(129, 258, 44),
(130, 259, 42),
(131, 259, 44),
(132, 260, 42),
(133, 260, 44),
(134, 261, 42),
(135, 261, 44),
(136, 262, 42),
(137, 262, 44),
(138, 263, 42),
(139, 263, 44),
(140, 264, 42),
(141, 264, 44),
(142, 265, 42),
(143, 265, 44),
(144, 266, 42),
(145, 266, 44),
(146, 267, 42),
(147, 267, 44),
(148, 268, 42),
(149, 268, 44),
(150, 269, 42),
(151, 269, 44),
(152, 270, 42),
(153, 270, 44),
(154, 271, 42),
(155, 271, 44),
(156, 272, 42),
(157, 272, 44),
(158, 273, 42),
(159, 273, 44),
(160, 274, 42),
(161, 274, 44),
(162, 275, 42),
(163, 275, 44),
(164, 276, 42),
(165, 276, 44),
(166, 277, 42),
(167, 277, 44),
(168, 278, 42),
(169, 278, 44),
(170, 279, 42),
(171, 279, 44),
(172, 280, 42),
(173, 280, 44),
(174, 281, 42),
(175, 281, 44),
(176, 282, 42),
(177, 282, 44),
(178, 283, 42),
(179, 283, 44),
(180, 284, 42),
(181, 284, 44),
(182, 285, 42),
(183, 285, 44),
(184, 286, 42),
(185, 286, 44),
(186, 287, 42),
(187, 287, 44),
(188, 288, 42),
(189, 288, 44),
(190, 289, 42),
(191, 289, 44),
(192, 290, 42),
(193, 290, 44),
(194, 291, 42),
(195, 291, 44),
(196, 292, 42),
(197, 292, 44),
(198, 293, 42),
(199, 293, 44),
(200, 294, 42),
(201, 294, 44),
(202, 295, 42),
(203, 295, 44),
(204, 296, 42),
(205, 296, 44),
(206, 297, 42),
(207, 297, 44),
(208, 298, 42),
(209, 298, 44),
(210, 299, 42),
(211, 299, 44),
(212, 300, 42),
(213, 300, 44),
(214, 14, 92),
(215, 14, 92),
(216, 14, 94),
(217, 14, 95),
(218, 27, 92),
(219, 27, 92),
(220, 27, 94),
(221, 27, 95),
(222, 30, 92),
(223, 30, 92),
(224, 30, 94),
(225, 30, 95),
(226, 13, 92),
(227, 13, 92),
(228, 13, 94),
(229, 13, 95),
(230, 12, 92),
(231, 12, 94),
(232, 12, 95),
(233, 10, 92),
(234, 10, 94),
(235, 10, 95),
(236, 9, 92),
(237, 9, 94),
(238, 9, 95),
(239, 31, 92),
(240, 31, 94),
(241, 31, 95),
(242, 32, 92),
(243, 32, 94),
(244, 32, 95),
(245, 33, 92),
(246, 33, 94),
(247, 33, 95),
(248, 34, 92),
(249, 34, 94),
(250, 34, 95),
(251, 35, 92),
(252, 35, 94),
(253, 35, 95),
(254, 36, 92),
(255, 36, 94),
(256, 37, 92),
(257, 37, 94),
(258, 38, 92),
(259, 38, 94),
(260, 38, 95),
(261, 39, 92),
(262, 39, 94),
(263, 39, 95),
(264, 40, 92),
(265, 40, 94),
(266, 40, 95),
(267, 41, 92),
(268, 41, 94),
(269, 41, 95),
(270, 42, 92),
(271, 42, 94),
(272, 42, 95),
(273, 43, 92),
(274, 43, 94),
(275, 43, 95),
(276, 44, 92),
(277, 44, 94),
(278, 44, 95),
(279, 45, 92),
(280, 45, 94),
(281, 45, 95),
(282, 46, 92),
(283, 46, 94),
(284, 46, 95),
(285, 47, 92),
(286, 47, 94),
(287, 47, 95),
(288, 48, 92),
(289, 48, 94),
(290, 48, 95),
(291, 49, 92),
(292, 49, 94),
(293, 49, 95),
(294, 50, 92),
(295, 50, 94),
(296, 50, 95),
(297, 51, 92),
(298, 51, 94),
(299, 51, 95),
(300, 52, 92),
(301, 52, 94),
(302, 52, 95),
(303, 53, 92),
(304, 53, 94),
(305, 53, 95),
(306, 54, 92),
(307, 54, 94),
(308, 54, 95),
(309, 55, 92),
(310, 55, 94),
(311, 55, 95),
(312, 56, 92),
(313, 56, 94),
(314, 56, 95),
(315, 57, 92),
(316, 57, 94),
(317, 57, 95),
(318, 58, 92),
(319, 58, 94),
(320, 58, 95),
(321, 59, 92),
(322, 59, 94),
(323, 59, 95),
(324, 184, 202),
(325, 184, 203),
(326, 184, 204),
(327, 184, 205),
(328, 185, 202),
(329, 185, 203),
(330, 185, 204),
(331, 185, 205),
(332, 186, 202),
(333, 186, 203),
(334, 186, 204),
(335, 186, 205),
(336, 187, 202),
(337, 187, 203),
(338, 187, 204),
(339, 187, 205),
(340, 188, 202),
(341, 188, 203),
(342, 188, 204),
(343, 188, 205),
(344, 189, 202),
(345, 189, 203),
(346, 189, 204),
(347, 189, 205),
(348, 190, 202),
(349, 190, 203),
(350, 190, 204),
(351, 190, 205),
(352, 191, 202),
(353, 191, 203),
(354, 191, 204),
(355, 191, 205),
(356, 192, 202),
(357, 192, 203),
(358, 192, 204),
(359, 192, 205),
(360, 193, 202),
(361, 193, 203),
(362, 193, 204),
(363, 193, 205),
(364, 194, 202),
(365, 194, 203),
(366, 194, 204),
(367, 194, 205),
(368, 195, 202),
(369, 195, 203),
(370, 195, 204),
(371, 195, 205),
(372, 196, 202),
(373, 196, 203),
(374, 196, 204),
(375, 196, 205),
(376, 197, 202),
(377, 197, 203),
(378, 197, 204),
(379, 197, 205),
(380, 198, 202),
(381, 198, 203),
(382, 198, 204),
(383, 198, 205),
(384, 199, 202),
(385, 199, 203),
(386, 199, 204),
(387, 199, 205),
(388, 200, 202),
(389, 200, 203),
(390, 200, 204),
(391, 200, 205),
(392, 201, 202),
(393, 201, 203),
(394, 201, 204),
(395, 201, 205),
(396, 202, 202),
(397, 202, 203),
(398, 202, 204),
(399, 202, 205),
(400, 203, 202),
(401, 203, 203),
(402, 203, 204),
(403, 203, 205),
(404, 204, 202),
(405, 204, 203),
(406, 204, 204),
(407, 204, 205),
(408, 205, 202),
(409, 205, 203),
(410, 205, 204),
(411, 205, 205),
(412, 206, 202),
(413, 206, 203),
(414, 206, 204),
(415, 206, 205),
(416, 207, 202),
(417, 207, 203),
(418, 207, 204),
(419, 207, 205),
(420, 208, 202),
(421, 208, 203),
(422, 208, 204),
(423, 208, 205),
(424, 209, 202),
(425, 209, 203),
(426, 209, 204),
(427, 209, 205),
(428, 210, 202),
(429, 210, 203),
(430, 210, 204),
(431, 210, 205),
(432, 211, 202),
(433, 211, 203),
(434, 211, 204),
(435, 211, 205),
(436, 212, 202),
(437, 212, 203),
(438, 212, 204),
(439, 212, 205),
(440, 213, 202),
(441, 213, 203),
(442, 213, 204),
(443, 213, 205),
(444, 214, 202),
(445, 214, 203),
(446, 214, 204),
(447, 214, 205),
(448, 215, 202),
(449, 215, 203),
(450, 215, 204),
(451, 215, 205),
(452, 216, 202),
(453, 216, 203),
(454, 216, 204),
(455, 216, 205),
(456, 217, 202),
(457, 217, 203),
(458, 217, 204),
(459, 217, 205),
(460, 218, 202),
(461, 218, 203),
(462, 218, 204),
(463, 218, 205),
(464, 172, 342),
(465, 172, 342),
(466, 172, 344),
(467, 172, 344),
(468, 172, 346),
(469, 172, 346),
(470, 173, 342),
(471, 173, 342),
(472, 173, 344),
(473, 173, 344),
(474, 173, 346),
(475, 173, 346),
(476, 174, 342),
(477, 174, 342),
(478, 174, 344),
(479, 174, 344),
(480, 174, 346),
(481, 174, 346),
(482, 175, 342),
(483, 175, 344),
(484, 175, 346),
(485, 176, 342),
(486, 176, 344),
(487, 176, 346),
(488, 177, 342),
(489, 177, 344),
(490, 177, 346),
(491, 178, 342),
(492, 178, 344),
(493, 178, 346),
(494, 179, 342),
(495, 179, 344),
(496, 179, 346),
(497, 180, 342),
(498, 180, 344),
(499, 180, 346),
(500, 181, 342),
(501, 181, 344),
(502, 181, 346),
(503, 182, 342),
(504, 182, 344),
(505, 182, 346),
(506, 134, 342),
(507, 134, 344),
(508, 134, 346),
(509, 135, 342),
(510, 135, 344),
(511, 135, 346),
(512, 136, 342),
(513, 136, 344),
(514, 136, 346),
(515, 137, 342),
(516, 137, 344),
(517, 137, 346),
(518, 138, 342),
(519, 138, 344),
(520, 138, 346),
(521, 139, 342),
(522, 139, 344),
(523, 139, 346),
(524, 141, 342),
(525, 141, 344),
(526, 141, 346),
(527, 142, 342),
(528, 142, 344),
(529, 142, 346),
(530, 143, 342),
(531, 143, 344),
(532, 143, 346),
(533, 144, 342),
(534, 144, 344),
(535, 144, 346),
(536, 145, 342),
(537, 145, 344),
(538, 145, 346),
(539, 146, 342),
(540, 146, 344),
(541, 146, 346),
(542, 147, 342),
(543, 147, 344),
(544, 147, 346),
(545, 148, 342),
(546, 148, 344),
(547, 148, 346),
(548, 149, 342),
(549, 149, 344),
(550, 149, 346),
(551, 151, 342),
(552, 151, 344),
(553, 151, 346),
(554, 152, 342),
(555, 152, 344),
(556, 152, 346),
(557, 153, 342),
(558, 153, 344),
(559, 153, 346),
(560, 154, 342),
(561, 154, 344),
(562, 154, 346),
(563, 155, 342),
(564, 155, 344),
(565, 155, 346),
(566, 156, 342),
(567, 156, 344),
(568, 156, 346),
(569, 157, 342),
(570, 157, 344),
(571, 157, 346),
(572, 158, 342),
(573, 159, 342),
(574, 159, 344),
(575, 159, 346),
(576, 160, 342),
(577, 160, 344),
(578, 160, 346),
(579, 161, 342),
(580, 161, 344),
(581, 161, 346),
(582, 162, 342),
(583, 162, 344),
(584, 162, 346),
(585, 163, 342),
(586, 163, 344),
(587, 163, 346),
(588, 164, 342),
(589, 164, 344),
(590, 164, 346),
(591, 165, 342),
(592, 165, 344),
(593, 165, 346),
(594, 166, 342),
(595, 166, 344),
(596, 166, 346),
(597, 167, 342),
(598, 167, 344),
(599, 167, 346),
(600, 168, 342),
(601, 168, 344),
(602, 168, 346),
(603, 169, 342),
(604, 169, 344),
(605, 169, 346),
(606, 170, 342),
(607, 170, 344),
(608, 170, 346),
(609, 171, 342),
(610, 171, 344),
(611, 171, 346),
(612, 25, 490),
(613, 25, 491),
(614, 60, 490),
(615, 60, 491),
(616, 61, 490),
(617, 61, 491),
(618, 62, 490),
(619, 62, 491),
(620, 63, 490),
(621, 63, 491),
(622, 64, 490),
(623, 64, 491),
(624, 65, 490),
(625, 65, 491),
(626, 66, 490),
(627, 66, 491),
(628, 67, 490),
(629, 67, 491),
(630, 68, 490),
(631, 68, 491),
(632, 69, 490),
(633, 69, 491),
(634, 70, 490),
(635, 70, 491),
(636, 71, 490),
(637, 71, 491),
(638, 72, 490),
(639, 72, 491),
(640, 73, 490),
(641, 73, 491),
(642, 74, 490),
(643, 74, 491),
(644, 75, 490),
(645, 75, 491),
(646, 76, 490),
(647, 76, 491),
(648, 77, 490),
(649, 77, 491),
(650, 78, 490),
(651, 78, 491),
(652, 79, 490),
(653, 79, 491),
(654, 80, 490),
(655, 80, 491),
(656, 81, 490),
(657, 81, 491),
(658, 82, 490),
(659, 82, 491),
(660, 83, 490),
(661, 83, 491),
(662, 84, 490),
(663, 84, 491),
(664, 85, 490),
(665, 85, 491),
(666, 86, 490),
(667, 86, 491),
(668, 87, 490),
(669, 87, 491),
(670, 88, 490),
(671, 88, 491),
(672, 89, 490),
(673, 89, 491),
(674, 90, 490),
(675, 90, 491),
(676, 91, 490),
(677, 91, 491),
(678, 92, 490),
(679, 92, 491),
(680, 93, 490),
(681, 93, 491),
(682, 94, 490),
(683, 94, 491),
(684, 95, 490),
(685, 95, 491),
(686, 96, 490),
(687, 96, 491),
(688, 97, 490),
(689, 97, 491),
(690, 98, 490),
(691, 98, 491),
(692, 99, 490),
(693, 99, 491),
(694, 100, 490),
(695, 100, 491),
(696, 101, 490),
(697, 101, 491),
(698, 102, 490),
(699, 102, 491),
(700, 103, 490),
(701, 103, 491),
(702, 104, 490),
(703, 104, 491),
(704, 105, 490),
(705, 105, 491),
(706, 107, 490),
(707, 107, 585),
(708, 108, 490),
(709, 108, 585),
(710, 109, 490),
(711, 109, 585),
(712, 110, 490),
(713, 110, 585),
(714, 111, 490),
(715, 111, 585),
(716, 112, 490),
(717, 112, 491),
(718, 112, 585),
(719, 113, 490),
(720, 113, 585),
(721, 114, 490),
(722, 114, 585),
(723, 115, 601),
(724, 115, 585),
(725, 116, 585),
(726, 116, 490),
(727, 117, 601),
(728, 117, 585),
(729, 117, 490),
(730, 118, 490),
(731, 118, 585),
(732, 118, 491),
(733, 119, 585),
(734, 119, 601),
(735, 119, 490),
(736, 120, 601),
(737, 120, 585),
(738, 120, 490),
(739, 121, 490),
(740, 121, 491),
(741, 122, 490),
(742, 122, 491),
(743, 123, 601),
(744, 123, 585),
(745, 123, 490),
(746, 124, 490),
(747, 124, 491),
(748, 124, 626),
(749, 125, 490),
(750, 125, 491),
(751, 125, 585),
(752, 126, 490),
(753, 126, 491),
(754, 127, 490),
(755, 127, 491),
(756, 128, 490),
(757, 128, 491),
(758, 129, 585),
(759, 129, 490),
(760, 130, 585),
(761, 130, 490),
(762, 130, 491),
(763, 131, 585),
(764, 131, 601),
(765, 132, 490),
(766, 132, 491);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL,
  `u_uname` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_pass` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_add` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_mobi` int(15) DEFAULT NULL,
  `u_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_stat` int(1) NOT NULL DEFAULT '1',
  `u_ugid` int(1) NOT NULL DEFAULT '2',
  `u_lastaccess` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `u_uname`, `u_pass`, `u_pic`, `u_name`, `u_slug`, `u_add`, `u_mobi`, `u_email`, `u_stat`, `u_ugid`, `u_lastaccess`) VALUES
(1, 'husol', 'Ejm41ey0qz1ZpiisRAArJ6IatE/0R24rzGIsh9bzQ1c=', 'pic_140061384673v1400613846up1965.jpg', 'Husol', 'Husol', '', 0, 'enquiry@husol.org', 1, 1, '0000-00-00 00:00:00'),
(2, 'admin', 'WS4PZxVkaidcgcq0aHJO4VadFAIOQzIeMqt0zPLg7JQ=', '', 'Admin User', '', '', NULL, 'khoa@husol.org', 1, 2, '2016-06-03 14:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `ugid` int(11) NOT NULL,
  `ug_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ug_auth` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`ugid`, `ug_name`, `ug_auth`) VALUES
(1, 'Husol', 1),
(2, 'Admin', 2),
(3, 'Normal User', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `category_trans`
--
ALTER TABLE `category_trans`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `c_ref` (`c_ref`),
  ADD KEY `c_ref_2` (`c_ref`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`cfid`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`mnid`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `module_category`
--
ALTER TABLE `module_category`
  ADD PRIMARY KEY (`mcid`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`ptid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `post_trans`
--
ALTER TABLE `post_trans`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `p_ref` (`p_ref`),
  ADD KEY `p_ref_2` (`p_ref`),
  ADD KEY `p_ref_3` (`p_ref`),
  ADD KEY `p_ref_4` (`p_ref`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `t_unique` (`t_unique`),
  ADD KEY `t_name` (`t_name`);

--
-- Indexes for table `tag_ref`
--
ALTER TABLE `tag_ref`
  ADD PRIMARY KEY (`trid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `a_uname` (`u_uname`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`ugid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `category_trans`
--
ALTER TABLE `category_trans`
  MODIFY `cid` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `mnid` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `mid` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `module_category`
--
ALTER TABLE `module_category`
  MODIFY `mcid` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `ptid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=304;
--
-- AUTO_INCREMENT for table `post_trans`
--
ALTER TABLE `post_trans`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=304;
--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=627;
--
-- AUTO_INCREMENT for table `tag_ref`
--
ALTER TABLE `tag_ref`
  MODIFY `trid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=767;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `ugid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;