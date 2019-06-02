-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2019 lúc 12:48 PM
-- Phiên bản máy phục vụ: 10.1.40-MariaDB
-- Phiên bản PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `viralstory`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `id_project` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `url`, `status`, `id_project`, `created_at`, `updated_at`) VALUES
(1, 'Chính trị', '/chinh-tri-1559413741234', 0, 1, NULL, NULL),
(2, 'Giao thông', NULL, 0, 1, NULL, NULL),
(3, 'Đô thị', NULL, 0, 1, NULL, NULL),
(4, 'Pháp đình', NULL, 0, 2, NULL, NULL),
(5, 'Vụ án', NULL, 0, 2, NULL, NULL),
(6, 'Quân sự', NULL, 0, 3, NULL, NULL),
(7, 'Tư liệu', NULL, 0, 3, NULL, NULL),
(8, 'Phân tích', NULL, 0, 3, NULL, NULL),
(9, 'Người Việt bốn phương', NULL, 0, 3, NULL, NULL),
(10, 'Bất động sản', NULL, 0, 4, NULL, NULL),
(11, 'Hàng không', NULL, 0, 4, NULL, NULL),
(12, 'Tài chính', NULL, 0, 4, NULL, NULL),
(13, 'Tiêu dùng', NULL, 0, 4, NULL, NULL),
(14, 'Doanh nhân', NULL, 0, 4, NULL, NULL),
(15, 'Mobile', NULL, 0, 5, NULL, NULL),
(16, 'AI', NULL, 0, 5, NULL, NULL),
(17, 'Smart home', NULL, 0, 5, NULL, NULL),
(18, 'Startup', NULL, 0, 5, NULL, NULL),
(19, 'Thể thao Việt Nam', NULL, 0, 6, NULL, NULL),
(20, 'Cúp châu Âu', NULL, 0, 6, NULL, NULL),
(21, 'Thể thao thế giới', NULL, 0, 6, NULL, NULL),
(22, 'Bóng đá Anh', NULL, 0, 6, NULL, NULL),
(23, 'Bóng đá Việt Nam', NULL, 0, 6, NULL, NULL),
(24, 'Hậu trường thể thao', NULL, 0, 6, NULL, NULL),
(25, 'Sao Việt', NULL, 0, 7, NULL, NULL),
(26, 'Sao châu Á', NULL, 0, 7, NULL, NULL),
(27, 'Sao Hollywood', NULL, 0, 7, NULL, NULL),
(28, 'Quize Article', NULL, 0, 7, NULL, NULL),
(29, 'Contact', NULL, 0, 7, NULL, NULL),
(30, 'Gương mặt trẻ', NULL, 0, 8, NULL, NULL),
(31, 'Cộng đồng mạng', NULL, 0, 8, NULL, NULL),
(32, 'Sự kiện', NULL, 0, 8, NULL, NULL),
(33, 'Mua xe', NULL, 0, 9, NULL, NULL),
(34, 'Lái xe', NULL, 0, 9, NULL, NULL),
(35, 'Nhạc Việt', NULL, 0, 10, NULL, NULL),
(36, 'Nhạc Hàn', NULL, 0, 10, NULL, NULL),
(37, 'Nhạc Âu Mỹ', NULL, 0, 10, NULL, NULL),
(38, 'Phim chiếu rạp', NULL, 0, 11, NULL, NULL),
(39, 'Phim truyền hình', NULL, 0, 11, NULL, NULL),
(40, 'Game show', NULL, 0, 11, NULL, NULL),
(41, 'Thời trang sao', NULL, 0, 12, NULL, NULL),
(42, 'Mặc đẹp', NULL, 0, 12, NULL, NULL),
(43, 'Làm đẹp', NULL, 0, 12, NULL, NULL),
(44, 'Tin tức xuất bản', NULL, 0, 13, NULL, NULL),
(45, 'Sách hay', NULL, 0, 13, NULL, NULL),
(46, 'Tác giả', NULL, 0, 13, NULL, NULL),
(47, 'Tuyển sinh', NULL, 0, 14, NULL, NULL),
(48, 'Tư vấn', NULL, 0, 14, NULL, NULL),
(49, 'Du học', NULL, 0, 14, NULL, NULL),
(50, 'Học tiếng Anh', NULL, 0, 14, NULL, NULL),
(51, 'Khỏe đẹp', NULL, 0, 15, NULL, NULL),
(52, 'Dinh dưỡng ', NULL, 0, 15, NULL, NULL),
(53, 'Mẹ và bé', NULL, 0, 15, NULL, NULL),
(54, 'Bệnh thường gặp', NULL, 0, 15, NULL, NULL),
(55, 'Địa điểm du lịch', NULL, 0, 16, NULL, NULL),
(56, 'Kinh nghiệm du lịch', NULL, 0, 16, NULL, NULL),
(57, 'Địa điểm ăn uống', NULL, 0, 17, NULL, NULL),
(58, 'Món ngon', NULL, 0, 17, NULL, NULL),
(59, 'TTDN', NULL, 0, 18, NULL, NULL),
(60, 'Cười', '/cuoi-1559413617392', 0, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_comment` int(11) DEFAULT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2019_05_27_125720_create_projects_table', 1),
(9, '2019_05_27_125948_create_categories_table', 1),
(10, '2019_05_27_130208_create_posts_table', 1),
(11, '2019_05_27_130549_create_users_table', 1),
(12, '2019_05_27_130857_create_roles_table', 1),
(13, '2019_05_27_130958_create_permissions_table', 1),
(14, '2019_05_27_131054_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `id_category` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `url_thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abstract` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `views` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `url`, `status`, `id_category`, `id_user`, `url_thumbnail`, `title`, `abstract`, `content`, `views`, `tag`, `posted_at`, `created_at`, `updated_at`) VALUES
(1, '/nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi-1559468125561', 1, 38, NULL, 'https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/BTP9020_v1401055.jpg', 'Những câu hỏi lớn \'Avengers: Endgame\' phải trả lời', 'Bom tấn \'Avengers: Endgame\' sẽ công phá các rạp chiếu từ ngày 26/4. Các siêu anh hùng sẽ làm gì để đảo ngược cú búng tay định mệnh của Thanos và giải cứu mọi người?', 'https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/BTP9020_v1401055.jpg', NULL, '123', '2019-06-02 00:00', NULL, NULL),
(3, '/cong-phuong-cham-dut-hop-dong-voi-incheon-sang-phap-thu-viec-1559472197530', 0, 23, NULL, 'https://znews-photo.zadn.vn/w960/Uploaded/mdf_usoddd/2019_06_02/1d920da5b130546e0d21.jpg', 'Công Phượng chấm dứt hợp đồng với Incheon, sang Pháp thử việc', 'Trong thông báo mới nhất, CLB Incheon United tuyên bố đã để Công Phượng rời đội bóng để tìm thử thách mới.', 'Trang chủ của đội bóng Hàn Quốc viết: \"Nguyễn Công Phượng (24 tuổi), cầu thủ từng chơi cho Incheon United ở vị trí tiền đạo, đã rời đội bóng để tìm thử thách mới\".\r\n\r\nĐội bóng Hàn Quốc nói thêm: \"Công Phượng gia nhập Incheon theo bản hợp đồng cho mượn có thời hạn 1 năm. Anh đã chơi 8 trận nhưng không ghi bàn thắng nào\".\r\n\r\nTheo thông báo này, Công Phượng gần đây cho hay anh muốn tìm kiếm những thử thách mới, cụ thể là thử việc ở Pháp trong vòng một tháng từ 15/6 đến 15/7.\r\n\r\n\"Sau khi cân nhắc, Incheon United đã chấp nhận nguyện vọng của Công Phượng. Quyết định chấm dứt hợp đồng đã được đưa ra vào ngày 1/6 một cách nhanh chóng để anh có thể lấy visa ở Pháp\", phía Incheon FC thông báo.\r\n\r\nTrả lời Zing.vn, ông Nguyễn Tấn Anh - GĐĐH CLB HAGL xác nhận thông tin trên và cho biết Công Phượng sẽ thử việc ở đội hạng Hai của Pháp.\r\n\r\nTrong ngày chia tay Incheon, Công Phượng cho hay: \"Tôi muốn chơi tốt tại Incheon nhưng bản thân cảm thấy tiếc vì đã không thể làm được. Tôi muốn trở thành một cầu thủ nước ngoài tốt hơn. Tôi sẽ không quên những kỷ niệm quý giá tại Incheon United và dù chơi ở đâu, tôi sẽ luôn cố gắng làm tốt nhất có thể\".\r\n\r\nSau khi chấm dứt hợp đồng, Công Phượng đã có buổi tập cuối cùng với các cầu thủ tại Incheon và nói lời chia tay các đồng đội cùng ban huấn luyện hôm 1/6. Ngày 2/6, Công Phượng sẽ bay sang Thái Lan để cùng ĐT Việt Nam dự King\'s Cup.\r\n\r\nTrước đó, HLV của CLB Incheon United là ông Yoo Sang-chul cũng có phát biểu với ý rằng Công Phượng đã không cố gắng thích nghi với đội bóng Hàn Quốc: \"Công Phượng hướng nội. Đáng lẽ cầu thủ nước ngoài phải cố gắng thích ứng nhiều hơn\".', NULL, '', '2019-06-02 00:00', NULL, NULL),
(4, '/nu-cdv-gay-gian-doan-chung-ket-champions-league-la-ai-1559472336234', 0, 24, NULL, 'https://znews-photo.zadn.vn/w660/Uploaded/natmzz/2019_06_02/1_7.jpg', 'Nữ CĐV gây gián đoạn chung kết Champions League là ai?', 'Danh tính nữ CĐV gây náo loạn trong trận đấu giữa Tottenham và Liverpool đã được tìm ra. Hành động chạy vào sân của cô gái này nhiều khả năng nhằm mục đích quảng cáo.', 'Trận chung kết Champions League 2018/19 khép lại với chức vô địch thuộc về Liverpool. Ngoài 2 bàn thắng, điểm nhấn trong trận đấu tại sân Wanda Metropolitano là một nữ CĐV tóc vàng chạy vào sân khiến trận đấu bị gián đoạn. \r\n\r\nDanh tính của nữ CĐV trong trang phục kiệm vải nhanh chóng được tìm ra. Cô gái có tên Kinsey Wolanski - một người mẫu không chuyên. Cô từng tham gia quảng cáo cho các tạp chí như Sports Illustrated, FHM, Maxim nhưng không để lại nhiều dấu ấn.\r\n\r\nKinsey chỉ thực sự nổi tiếng nhờ những bức hình, đoạn video khoe thân hoặc với nội dung kỳ quặc trên mạng xã hội.\r\n\r\nVới trò phá rối của mình, Kinsey Wolanski đã tăng lượng người theo dõi trên trang cá nhân từ 230.000 lên hơn 1 triệu chỉ trong vòng một đêm.\r\n\r\nViệc chạy vào sân phá rối trận chung kết Champions League của cô nàng tóc vàng không phải là do ý thích mà hoàn toàn có mục đích. Trên bộ trang phục của Kinsey có in dòng chữ của trang web có nội dung người lớn đang được điều hành bởi chính bạn trai cô là Vitaly Zdorovetskiy.\r\n\r\nZdorovetskiy là YouTuber khá nổi tiếng với 9,9 triệu người theo dõi, lượt xem đạt đến 1,56 tỷ tính đến tháng 5/2019.\r\n\r\nTrên trang cá nhân, Kinsey Wolanski đăng bức hình chụp khi bị nhân viên bảo vệ giữ lại vì hành vi quấy rối cùng dòng chia sẻ: \"Có vẻ tôi đã gây rối quá nhiều hay không?\".\r\n\r\nĐể đáp lại, Zdorovetskiy cũng ca ngợi bạn gái với vẻ đầy tự hào: \"Đó mới là cô gái của tôi\".', NULL, '', '2019-06-02 00:00', NULL, NULL),
(5, '/chua-ra-mat-iphone-11-va-note-10-da-doi-dien-tuong-lai-am-dam-1559472453324', 0, 15, NULL, 'https://znews-photo.zadn.vn/w480/Uploaded/pqmcbzwv/2019_06_02/AppleSamsungwillbenefitthemostfromHuaweisdownfallKuo.jpg', 'Chưa ra mắt, iPhone 11 và Note 10 đã đối diện tương lai ảm đạm', 'Theo các nghiên cứu mới của Tập đoàn dữ liệu quốc tế (IDC), iPhone 11 và Galaxy Note 10 sẽ đối diện thử thách khi thị trường điện thoại đang có dấu hiệu “bão hòa”.', 'Theo IDC, mặc cho một loạt tên tuổi lớn dự kiến sẽ ra mắt vào nửa cuối năm, thị trường điện thoại thông minh toàn cầu sẽ giảm 1,9% trong năm 2019.\r\n\r\nSự sụt giảm này được đánh giá một phần do tình hình tăng trưởng doanh số điện thoại thông minh chững lại ở các nền kinh tế đang phát triển trong 3 năm qua.\r\n\r\nTheo IDC, các dòng điện thoại “lai” vẫn được ưa chuộng ở hầu hết thị trường đang phát triển. Đây là phân khúc những thiết bị vừa có những tính năng cơ bản của một chiếc điện thoại để liên lạc và bổ sung những công cụ tiện ích như nghe nhạc, trình duyệt web. Kèm theo những sản phẩm này là mức giá rẻ hơn rất nhiều so với dòng điện thoại thông minh đầy đủ tính năng.\r\n\r\n“Nhu cầu của người tiêu dùng về chức năng điện thoại thông minh tiếp tục tăng cao trong khi những dịch vụ của các sản phẩm phân khúc cao cấp đang có dấu hiệu đi lùi”, phân tích viên Sangeetika Srivastava nói.\r\n\r\nĐiều này có nghĩa mọi người không muốn chi 1.000 USD cho điện thoại thông minh nữa. Các nhà sản xuất sẽ cần tập trung vào việc giới thiệu các sản phẩm phân khúc tầm trung nhiều hơn bên cạnh các sản phẩm cao cấp nếu muốn vượt qua sự sụt giảm doanh số điện thoại thông minh đang diễn ra.\r\n\r\nTranh chấp giữa Mỹ và Trung Quốc cũng đã gây thiệt hại cho doanh số điện thoại thông minh với sự bất ổn trên thị trường sau hành động của Tổng thống Donald Trump chống lại người khổng lồ của viễn thông Trung Quốc, Huawei. Phản ứng dữ dội xuất phát từ lệnh của người đứng đầu Nhà Trắng khi ông buộc các công ty chủ chốt, bao gồm Google, phải cắt đứt quan hệ với Huawei hồi giữa tháng 5.\r\n\r\nTuy nhiên, Phó chủ tịch IDC Ryan Reith cũng cho rằng sự tăng trưởng sẽ nhanh chóng quay trở lại dù Trung Quốc sẽ chịu sự suy giảm 5% trong giai đoạn này trước khi có thể trở lại mức tăng trưởng trong nửa đầu năm 2020.\r\n\r\nĐiểm mấu chốt của sự phục hồi nhanh chóng của Trung Quốc dự kiến sẽ nhờ vào sự bùng nổ của công nghệ 5G. Viện nghiên cứu do chính phủ Trung Quốc tài trợ ước tính rằng 5G sẽ tạo thêm 8 triệu việc làm trong nước đến năm 2030. Họ cho rằng các ngành công nghiệp lớn, trong đó có y tế, năng lượng sẽ chi tổng cộng hàng tỷ USD cho thiết bị 5G và dịch vụ không dây.', NULL, '', '2019-06-02 00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `projects`
--

INSERT INTO `projects` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Thời sự', 0, NULL, NULL),
(2, 'Pháp luật', 0, NULL, NULL),
(3, 'Thế giới', 0, NULL, NULL),
(4, 'Kinh doanh', 0, NULL, NULL),
(5, 'Công nghệ', 0, NULL, NULL),
(6, 'Thể thao', 0, NULL, NULL),
(7, 'Giải trí', 0, NULL, NULL),
(8, 'Số trẻ', 0, NULL, NULL),
(9, 'Xe 360', 0, NULL, NULL),
(10, 'Âm nhạc', 0, NULL, NULL),
(11, 'Phim ảnh', 0, NULL, NULL),
(12, 'Thời trang', 0, NULL, NULL),
(13, 'Xuất bản', 0, NULL, NULL),
(14, 'Giáo dục', 0, NULL, NULL),
(15, 'Sức khỏe', 0, NULL, NULL),
(16, 'Du lịch', 0, NULL, NULL),
(17, 'Ẩm thực', 0, NULL, NULL),
(18, 'Nhịp sống', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `premium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
