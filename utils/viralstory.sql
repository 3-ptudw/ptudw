-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2019 lúc 07:01 PM
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
(1, 'Chính trị', 'chinh-tri-1559494563894', 1, 1, NULL, NULL),
(2, 'Giao thông', 'giao-thong-1559494552305', 0, 1, NULL, NULL),
(3, 'Đô thị', 'do-thi-1559494571124', 0, 1, NULL, NULL),
(4, 'Pháp đình', 'phap-dinh-1559494583957', 0, 2, NULL, NULL),
(5, 'Vụ án', 'vu-an-1559494605158', 0, 2, NULL, NULL),
(6, 'Quân sự', 'quan-su-1559494612573', 0, 3, NULL, NULL),
(7, 'Tư liệu', 'tu-lieu-1559494618827', 0, 3, NULL, NULL),
(8, 'Phân tích', 'phan-tich-1559494636941', 0, 3, NULL, NULL),
(9, 'Người Việt bốn phương', 'nguoi-viet-bon-phuong-1559494641560', 0, 3, NULL, NULL),
(10, 'Bất động sản', 'bat-dong-san-1559494646544', 0, 4, NULL, NULL),
(11, 'Hàng không', 'hang-khong-1559494651741', 0, 4, NULL, NULL),
(12, 'Tài chính', 'tai-chinh-1559494657897', 0, 4, NULL, NULL),
(13, 'Tiêu dùng', 'tieu-dung-1559494666368', 0, 4, NULL, NULL),
(14, 'Doanh nhân', 'doanh-nhan-1559494738264', 0, 4, NULL, NULL),
(15, 'Mobile', 'mobile-1559494741965', 0, 5, NULL, NULL),
(16, 'AI', 'ai-1559494745278', 0, 5, NULL, NULL),
(17, 'Smart home', 'smart-home-1559494748786', 0, 5, NULL, NULL),
(18, 'Startup', 'startup-1559494752221', 0, 5, NULL, NULL),
(19, 'Thể thao Việt Nam', 'the-thao-viet-nam-1559494755777', 0, 6, NULL, NULL),
(20, 'Cúp châu Âu', 'cup-chau-au-1559494758593', 0, 6, NULL, NULL),
(21, 'Thể thao thế giới', 'the-thao-the-gioi-1559494761359', 0, 6, NULL, NULL),
(22, 'Bóng đá Anh', 'bong-da-anh-1559494764575', 0, 6, NULL, NULL),
(23, 'Bóng đá Việt Nam', 'bong-da-viet-nam-1559494767773', 0, 6, NULL, NULL),
(24, 'Hậu trường thể thao', 'hau-truong-the-thao-1559494770945', 0, 6, NULL, NULL),
(25, 'Sao Việt', 'sao-viet-1559494773773', 0, 7, NULL, NULL),
(26, 'Sao châu Á', 'sao-chau-a-1559494778162', 0, 7, NULL, NULL),
(27, 'Sao Hollywood', 'sao-hollywood-1559494780939', 0, 7, NULL, NULL),
(28, 'Quize Article', 'quize-article-1559494784272', 0, 7, NULL, NULL),
(29, 'Contact', 'contact-1559494786701', 0, 7, NULL, NULL),
(30, 'Gương mặt trẻ', 'guong-mat-tre-1559494788965', 0, 8, NULL, NULL),
(31, 'Cộng đồng mạng', 'cong-dong-mang-1559494791233', 0, 8, NULL, NULL),
(32, 'Sự kiện', 'su-kien-1559494793278', 0, 8, NULL, NULL),
(33, 'Mua xe', 'mua-xe-1559494795285', 0, 9, NULL, NULL),
(34, 'Lái xe', 'lai-xe-1559494797261', 0, 9, NULL, NULL),
(35, 'Nhạc Việt', 'nhac-viet-1559494799591', 0, 10, NULL, NULL),
(36, 'Nhạc Hàn', 'nhac-han-1559494801712', 0, 10, NULL, NULL),
(37, 'Nhạc Âu Mỹ', 'nhac-au-my-1559494803717', 0, 10, NULL, NULL),
(38, 'Phim chiếu rạp', 'phim-chieu-rap-1559494805579', 0, 11, NULL, NULL),
(39, 'Phim truyền hình', 'phim-truyen-hinh-1559494808212', 0, 11, NULL, NULL),
(40, 'Game show', 'game-show-1559494810428', 0, 11, NULL, NULL),
(41, 'Thời trang sao', 'thoi-trang-sao-1559494812458', 0, 12, NULL, NULL),
(42, 'Mặc đẹp', 'mac-dep-1559494814727', 0, 12, NULL, NULL),
(43, 'Làm đẹp', 'lam-dep-1559494816707', 0, 12, NULL, NULL),
(44, 'Tin tức xuất bản', 'tin-tuc-xuat-ban-1559494818695', 0, 13, NULL, NULL),
(45, 'Sách hay', 'sach-hay-1559494820508', 0, 13, NULL, NULL),
(46, 'Tác giả', 'tac-gia-1559494822391', 0, 13, NULL, NULL),
(47, 'Tuyển sinh', 'tuyen-sinh-1559494824290', 0, 14, NULL, NULL),
(48, 'Tư vấn', 'tu-van-1559494826148', 0, 14, NULL, NULL),
(49, 'Du học', 'du-hoc-1559494828027', 0, 14, NULL, NULL),
(50, 'Học tiếng Anh', 'hoc-tieng-anh-1559494829873', 0, 14, NULL, NULL),
(51, 'Khỏe đẹp', 'khoe-dep-1559494831772', 0, 15, NULL, NULL),
(52, 'Dinh dưỡng ', 'dinh-duong--1559494833574', 0, 15, NULL, NULL),
(53, 'Mẹ và bé', 'me-va-be-1559494835387', 0, 15, NULL, NULL),
(54, 'Bệnh thường gặp', 'benh-thuong-gap-1559494837201', 0, 15, NULL, NULL),
(55, 'Địa điểm du lịch', 'dia-diem-du-lich-1559494839028', 0, 16, NULL, NULL),
(56, 'Kinh nghiệm du lịch', 'kinh-nghiem-du-lich-1559494840861', 0, 16, NULL, NULL),
(57, 'Địa điểm ăn uống', 'dia-diem-an-uong-1559494842695', 0, 17, NULL, NULL),
(58, 'Món ngon', 'mon-ngon-1559494844558', 0, 17, NULL, NULL),
(59, 'TTDN', 'ttdn-1559494846646', 0, 18, NULL, NULL),
(60, 'Cười', 'cuoi-1559494849165', 0, 18, NULL, NULL);

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
(1, 'nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi-1559468125561', 1, 38, NULL, 'https://znews-photo.zadn.vn/w480/Uploaded/bpivpjbp/2018_10_29/endgame5.jpg', 'Những câu hỏi lớn \'Avengers: Endgame\' phải trả lời', 'Bom tấn \'Avengers: Endgame\' sẽ công phá các rạp chiếu từ ngày 26/4. Các siêu anh hùng sẽ làm gì để đảo ngược cú búng tay định mệnh của Thanos và giải cứu mọi người?', '<p>Bom tấn \"Avengers: Endgame\" sẽ công phá các rạp chiếu từ ngày 26/4. Các siêu anh hùng sẽ làm gì để đảo ngược cú búng tay định mệnh của Thanos và giải cứu mọi người?</p>\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/BTP9020_v1401055.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>Các thành viên Avengers sẽ du hành thời gian? Giới chuyên môn và fan MCU đều đoán các thành viên sống sót của biệt đội siêu anh hùng Avengers sẽ đi về quá khứ - có thể là thông qua Lượng tử giới (Quantum Realm)\r\n                                            - để đảo ngược cú búng tay xóa sổ 50% sinh linh vũ trụ của Thanos.</p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/pe.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p><strong>Nhóm Avengers có tìm hiểu dự án Pegasus? </strong>Trong<em> Captain Marvel</em>, nhà khoa học Mar-Vell đã tận dụng dự án Pegasus để nghiên cứu Đá Không gian nhằm tạo ra động cơ tốc độ ánh sáng. Ở <em>The Avengers, </em>Giám\r\n                                            đốc SHIELD Nick Fury, chuyên gia Erik Selvig và Hawkeye đề tham gia vào dự án này. Cha của Tony Stark cũng đóng một vai trò lớn ở đó. Rất có thể Pegasus sẽ là chìa khóa để các thành viên Avengers trở về quá\r\n                                            khứ.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/LST3480_v013_TRL1088.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p><strong>Iron Man và Nebula trở về Trái đất như thế nào? </strong>Trailer mới của <em>Avengers: Endgame</em> cho thấy Iron Man và Nebula đều trở về Trái đất an toàn. Nhưng họ làm được điều đó thế nào khi động cơ\r\n                                            phi thuyền bị hỏng, thức ăn và dưỡng khí đều cạn kiệt? Tony Stark là một thiên tài và khi bị giam trong hang đá, anh đã chế tạo ra bộ giáp Iron Man. Rất có thể anh và Nebula cùng hợp tác để tìm thấy đường sống.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/LVA9080_v0151058.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Ant-Man thoát khỏi Lượng tử giới như thế nào? </strong><em>Cuối Ant-Man and the Wasp</em>, Người Kiến mắc kẹt trong Lượng tử giới (Quantum Realm). Chúng ta đều biết rõ Scott Lang sẽ thoát khỏi thế giới\r\n                                            vô cùng nhỏ đó, bởi anh xuất hiện trong trailer <em>Endgame</em>. Anh làm được điều đó như thế nào khi không có bất kỳ ai hỗ trợ?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/EBA3000_v002_TRL1275.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Gia đình Hawkeye đều thiệt mạng sau cú búng tay của Thanos? </strong>Trailer <em>Endgame </em>cho thấy Hawkeye sầu khổ trở thành Ronin, tiêu diệt mafia tại Nhật trước khi gặp Black Widow. Nếu cả gia\r\n                                            đình Clint Barton thiệt mạng sau cú búng tay của Thanos, rất có thể anh sẽ phát điên và rơi vào vòng xoáy bạo lực, trở thành Ronin trước khi quay lại với nhóm Avengers.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/civil.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Captain America và Iron Man sẽ tái ngộ như thế nào? </strong>Lần cuối chạm mặt nhau ở <em>Captain Americal: Civil War</em>, Captain America và Iron Man giao chiến dữ dội. Kể từ đó, họ không còn liên\r\n                                            lạc. Thậm chí khi binh đoàn của Thanos tấn công Trái đất, Tony Stark vẫn ngần ngại, không muốn gọi điện cho Steve Rogers. Cuộc tái ngộ của họ sẽ là điều khán giả rất mong chờ.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/thanosdi.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Thanos đi đâu sau <em>Avengers: Infinity War</em>? </strong>Đạo diễn <em>Infinity War</em> Joe Russo xác nhận Thanos không xâm nhập vào Thế giới Linh hồn do Đá Linh hồn tạo ra. Thay vào đó, gã Titan\r\n                                            điên đến nghỉ ngơi tại một hành tinh xa xôi.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/broken.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Găng tay Vô cực đã hỏng hay còn sử dụng được? </strong>Sau khi Thanos búng tay tiêu diệt 50% sinh linh trong vũ trụ, Găng tay Vô cực chứa 6 viên Đá Vô cực bị cháy xém. Khi đó, Thanos vẫn có thể dùng\r\n                                            Đá Không gian để chạy trốn. Liệu hắn sẽ còn tiếp tục sử dụng Găng tay Vô cực?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/hulkban.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Bruce Banner và Hulk giải quyết mâu thuẫn như thế nào? </strong>Trong <em>Infinity War</em>, Người Khồng Lồ Xanh không chịu xuất hiện bất chấp sự nài nỉ của Bruce Banner. Đạo diễn Joe Russo cho biết\r\n                                            Hulk đã quá mệt mỏi vì cứ phải cứu Banner. Mối quan hệ của cả hai trở nên phức tạp và cần được giải quyết.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/vission.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Nhóm Avengers có cứu được Vision? </strong>Vision thiệt mạng sau khi Thanos kéo Đá Tâm trí ra khỏi trán anh. Nhưng có thể Tony Stark sẽ sửa chữa Vision khi anh trở về Trái đất. Iron Man từng sửa được\r\n                                            Jarvis sau khi trí tuệ nhân tạo này bị Ultron phá hủy. Và hi vọng Shuri lưu lại dữ liệu của Vision trước khi tan biến thành tro bụi.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/val2.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Valkyrie, Korg và những người Asgard sống sót ở đâu? </strong>Đạo diễn Joe Russo cho biết Valkyrie sống sót sau khi Thanos tấn công tàu không gian của người Asgard. Cô và những người Asgard còn lại,\r\n                                            cùng Korg và Miek đã trốn đi đâu?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/stan1.jpeg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Vai khách mời cuối cùng Stan Lee sẽ như thế nào? </strong>Đạo diễn Joe Russo xác nhận Stan Lee thực hiện vai diễn khách mời (cameo) cuối cùng của đời ông trong <em>Endgame</em>. \"Khi Stan đến phim trường,\r\n                                            mọi diễn viên ngôi sao đều trở thành những đứa trẻ hâm mộ\", ông Russo mô tả.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/sharon.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Captain America có gặp lại Sharon Carter không? </strong>Trong <em>Civil War</em>, Captain America và Sharon Carter đã thể hiện tình cảm bằng một nụ hôn. Tuy nhiên, cháu gái của Peggy Carter không có\r\n                                            mặt trong <em>Infinity War</em>. Nếu Sharon còn sống, liệu Captain có gặp lại cô và nối lại tình cảm hay không?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/tonpep.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Tony Stark và Pepper Potts có làm đám cưới? </strong>Tony Stark và Pepper Potts đã đính hôn, nhưng họ bị chia cắt khi binh đoàn của Thanos tấn công Trái đất. Sau khi Iron Man trở về, liệu họ có làm đám\r\n                                            cưới? Và pháp sư Wong có tham dự hôn lễ của họ không?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/strange.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Viễn cảnh mà Doctor Strange thấy là gì? </strong>Trên hành tinh Titan, Doctor Strange dùng Đá Thời gian và quan sát hơn 14 triệu kết quả trong cuộc chiến chống Thanos. Và chỉ có một là nhóm Avengers\r\n                                            chiến thắng. Viễn cảnh đó thực sự là như thế nào?\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/avengersposters.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Những siêu anh hùng nào sẽ thiệt mạng? </strong>Chắc chắn tất cả các siêu anh hùng sẽ không thể sống sót trong cuộc chiến chống Thanos. Giới chuyên môn và khán giả dự đoán Captain America và Iron Man\r\n                                            sẽ hi sinh.\r\n                                        </p>\r\n\r\n                                        <div class=\"post-thumb\">\r\n                                            <img src=\"https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_10_29/thanosem.jpg\" alt=\"\">\r\n                                        </div>\r\n                                        <p>\r\n                                            <strong>Thế còn số phận của Thanos sẽ ra sao? </strong>Trong lần tái ngộ, Thor chắc chắn sẽ nhắm vào đầu của Thanos. Và Nebula rất muốn trả thù người cha nuôi tàn độc của cô. Nhưng điều đó liệu có quá dễ dàng?\r\n                                            Không ít siêu ác nhân trong MCU bị đánh bại nhưng vẫn sống sót. Rất có thể Thanos cũng sẽ chung số phận đó.\r\n                                        </p>            ', '1', 'Avengers', '2019-06-02 00:00', NULL, NULL),
(3, 'cong-phuong-cham-dut-hop-dong-voi-incheon-sang-phap-thu-viec-1559492630947', 1, 23, NULL, 'https://znews-photo.zadn.vn/w960/Uploaded/mdf_usoddd/2019_06_02/1d920da5b130546e0d21.jpg', 'Công Phượng chấm dứt hợp đồng với Incheon, sang Pháp thử việc', 'Trong thông báo mới nhất, CLB Incheon United tuyên bố đã để Công Phượng rời đội bóng để tìm thử thách mới.', '            <p class=\"the-article-summary\">Trong thông báo mới nhất, CLB Incheon United tuyên bố đã để Công Phượng rời đội bóng để tìm thử thách mới.</p>\r\n            <div class=\"the-article-body\">\r\n    <p>Trang chủ của đội bóng Hàn Quốc viết: \"Nguyễn <a href=\"https://news.zing.vn/tieu-diem/cau-thu-cong-phuong.html\" title=\"Tin tức Công Phượng\" class=\"topic person autolink\" topic-id=\"3751\">Công Phượng</a> (24 tuổi), cầu thủ từng chơi cho Incheon United ở vị trí tiền đạo, đã rời đội bóng để tìm thử thách mới\".</p>\r\n<p>Đội bóng Hàn Quốc nói thêm: \"Công Phượng gia nhập Incheon theo bản hợp đồng cho mượn có thời hạn 1 năm. Anh đã chơi 8 trận nhưng không ghi bàn thắng nào\".</p>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img  alt=\"Cong Phuong cham dut hop dong voi Incheon, sang Phap thu viec hinh anh 1 \" src=\"https://znews-photo.zadn.vn/w660/Uploaded/mdf_usoddd/2019_06_02/1d920da5b130546e0d21.jpg\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Công Phượng dừng chân khá nhanh sau thử thách ở Hàn Quốc.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>Theo thông báo này, Công Phượng gần đây cho hay anh muốn tìm kiếm những thử thách mới, cụ thể là thử việc ở Pháp trong vòng một tháng từ 15/6 đến 15/7.</p>\r\n<p>\"Sau khi cân nhắc, Incheon United đã chấp nhận nguyện vọng của Công Phượng. Quyết định chấm dứt hợp đồng đã được đưa ra vào ngày 1/6 một cách nhanh chóng để anh có thể lấy visa ở Pháp\", phía Incheon FC thông báo.</p>\r\n<p>Trả lời <em>Zing.vn</em>, ông Nguyễn Tấn Anh - GĐĐH CLB HAGL xác nhận thông tin trên và cho biết Công Phượng sẽ thử việc ở đội hạng Hai của Pháp.</p>\r\n<p>\r\nTrong ngày chia tay Incheon, Công Phượng cho hay: \"Tôi muốn chơi tốt tại Incheon nhưng bản thân cảm thấy tiếc vì đã không thể làm được. Tôi muốn trở thành một cầu thủ nước ngoài tốt hơn. Tôi sẽ không quên những kỷ niệm quý giá tại Incheon United và dù chơi ở đâu, tôi sẽ luôn cố gắng làm tốt nhất có thể\".</p>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Cong Phuong cham dut hop dong voi Incheon, sang Phap thu viec hinh anh 2 \" src=\"https://znews-photo.zadn.vn/w660/Uploaded/mdf_usoddd/2019_06_02/61484825_2512117352364599_3694955949522419712_n.jpg\" width=\"960\" height=\"960\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">CLB Incheon gửi lời cảm ơn những đóng góp của Công Phượng thời gian qua.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>\r\nSau khi chấm dứt hợp đồng, Công Phượng đã có buổi tập cuối cùng với các cầu thủ tại Incheon và nói lời chia tay các đồng đội cùng ban huấn luyện hôm 1/6. Ngày 2/6, Công Phượng sẽ bay sang Thái Lan để cùng ĐT Việt Nam dự King\'s Cup.</p>\r\n<p>Trước đó, HLV của CLB Incheon United là ông Yoo Sang-chul cũng có phát biểu với ý rằng Công Phượng đã không cố gắng thích nghi với đội bóng Hàn Quốc: \"Công Phượng hướng nội. Đáng lẽ cầu thủ nước ngoài phải cố gắng thích ứng nhiều hơn\".</p>\r\n', '2', 'Công Phượng', '2019-06-02 00:00', NULL, NULL),
(4, 'tuyen-thu-viet-nam-boi-roi-voi-do-cong-nghe-cao-o-thai-lan-1559492647070', 0, 23, NULL, 'https://znews-photo.zadn.vn/w660/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam.jpg', 'Tuyển thủ Việt Nam bối rối với đồ công nghệ cao ở Thái Lan', 'Lần đầu sử dụng bộ thiết bị hỗ trợ công nghệ cao, nhiều tuyển thủ Việt Nam chưa thạo cách dùng trong buổi tập trên đất Thái Lan trước thềm King’s Cup.', ' <p class=\"the-article-summary\">Lần đầu sử dụng bộ thiết bị hỗ trợ công nghệ cao, nhiều tuyển thủ Việt Nam chưa thạo cách dùng trong buổi tập trên đất Thái Lan trước thềm King’s Cup.</p>\r\n            <div class=\"the-article-body\">\r\nBuổi tập rộn tiếng cười của tuyển Việt Nam trên đất Thái</a></strong> Dưới sự hướng dẫn của HLV thể lực Hàn Quốc Park Sung-gyun chiều 2/6, tuyển Việt Nam có buổi tập thoải mái với các trò chơi nâng cao sức mạnh cơ thể, nhanh nhẹn và nhiều tiếng cười.</figcaption></figure>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 1 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_1_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_1_zing.jpg\" width=\"2000\" height=\"1335\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Trước buổi tập chiều 2/6, HLV thể lực Park Sung-gyun tới sân sớm khoảng 15 phút để sắp xếp dụng cụ tập luyện. Bộ thiết bị công nghệ OptimEye X4 lần đầu tiên được tuyển Việt Nam sử dụng ở đợt tập trung này.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 2 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_2_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_2_zing.jpg\" width=\"2000\" height=\"1335\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Đây là sản phẩm công nghệ nhằm theo dõi chỉ số tập luyện, thi đấu của các cầu thủ. Nhiều tuyển thủ Việt Nam lần đầu tiếp xúc với bộ sản phẩm này.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 3 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_3_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_3_zing.jpg\" width=\"1333\" height=\"2000\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Trung vệ <a href=\"https://news.zing.vn/tieu-diem/que-ngoc-hai.html\" title=\"Tin tức Quế Ngọc Hải\" class=\"topic person autolink\" topic-id=\"5001\">Quế Ngọc Hải</a> chăm chú nhìn con chip điều khiển của bộ đồ. Mỗi con chip này kết nối với máy tính chủ cho phép ban huấn luyện theo dõi chỉ số cầu thủ ngay tại buổi tập.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 4 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_4_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_4_zing.jpg\" width=\"2000\" height=\"1332\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Duy Mạnh mặc bộ đồ công nghệ cho <a href=\"https://news.zing.vn/tieu-diem/doan-van-hau.html\" title=\"Tin tức Đoàn Văn Hậu\" class=\"topic person autolink\" topic-id=\"5000\">Đoàn Văn Hậu</a>. Trước đó, tuyển Việt Nam đối đầu nhiều đội dùng thiết bị công nghệ cao như Iran, Nhật Bản, Jordan ở Asian Cup 2019.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 5 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_5_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_5_zing.jpg\" width=\"2000\" height=\"1334\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">HLV Park Hang-seo cho các tân binh tự giới thiệu với đội bóng. Khi em út Nguyễn Văn Toản đứng lên, nhiều đàn anh đã trêu Toản: “Hát đi, hát đi”.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 6 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_6_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_6_zing.jpg\" width=\"2000\" height=\"1332\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Lão tướng Anh Đức trở lại đội sau nhiều lần tuyên bố giải nghệ. Cuộc khủng hoảng hàng công khiến HLV Park Hang-seo phải mời cựu binh giàu kinh nghiệm này.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 7 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_7_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_7_zing.jpg\" width=\"2000\" height=\"1332\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Xuân Trường (phải) mới hội quân cùng đội tuyển chiều 2/6. Anh là tuyển thủ Việt Nam cuối cùng hội quân.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 8 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_8_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_8_zing.jpg\" width=\"2000\" height=\"1329\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">HLV Park Hang-seo được bác sĩ Choi Ju-young chăm sóc riêng. Ông có vẻ đang gặp chút vấn đề ở phần lưng.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 9 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_9_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_9_zing.jpg\" width=\"2000\" height=\"1333\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Tuyển Việt Nam có 3 ngày tập luyện tại Buriram trước thềm trận gặp Thái Lan hôm 5/6 tới trên sân Chang Arena.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 10 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_10_zing.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Tuyen_Viet_Nam_10_zing.jpg\" width=\"2000\" height=\"1336\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Thủ thành Nguyễn Văn Toản (phải) và Đoàn Văn Hậu là 2 tuyển thủ trẻ nhất trong đợt tập trung này khi cùng sinh năm 1999.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Tuyen thu Viet Nam boi roi voi do cong nghe cao o Thai Lan hinh anh 11 \" src=\"https://znews-photo.zadn.vn/w480/Uploaded/jopluat/2019_06_02/Kings_Cup_zing_3.jpg\" data-src=\"https://znews-photo.zadn.vn/Uploaded/jopluat/2019_06_02/Kings_Cup_zing_3.jpg\" width=\"1620\" height=\"1080\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"pCaption caption\">Lịch thi đấu vòng mở màn King’s Cup 2019. Đồ họa: <em>Minh Phúc.</em></td>\r\n        </tr>\r\n', '3', 'Việt Nam', '2019-06-02 00:00', NULL, NULL),
(5, 'chua-ra-mat-iphone-11-va-note-10-da-doi-dien-tuong-lai-am-dam-1559492667266', 1, 15, NULL, 'https://znews-photo.zadn.vn/w480/Uploaded/pqmcbzwv/2019_06_02/AppleSamsungwillbenefitthemostfromHuaweisdownfallKuo.jpg', 'Chưa ra mắt, iPhone 11 và Note 10 đã đối diện tương lai ảm đạm', 'Theo các nghiên cứu mới của Tập đoàn dữ liệu quốc tế (IDC), iPhone 11 và Galaxy Note 10 sẽ đối diện thử thách khi thị trường điện thoại đang có dấu hiệu “bão hòa”.', '<p class=\"the-article-summary\">Theo các nghiên cứu mới của Tập đoàn dữ liệu quốc tế (IDC), iPhone 11 và Galaxy Note 10 sẽ đối diện thử thách khi thị trường điện thoại đang có dấu hiệu “bão hòa”.</p>\r\n            <div class=\"the-article-body\">\r\n    <p dir=\"ltr\">Theo <em>IDC</em>, mặc cho một loạt tên tuổi lớn dự kiến sẽ ra mắt vào nửa cuối năm, thị trường điện thoại thông minh toàn cầu sẽ giảm 1,9% trong năm 2019.</p>\r\n<p dir=\"ltr\">Sự sụt giảm này được đánh giá một phần do tình hình tăng trưởng doanh số điện thoại thông minh chững lại ở các nền kinh tế đang phát triển trong 3 năm qua.</p>\r\n<table class=\"picture\" align=\"center\">\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"pic\"><img   alt=\"Chua ra mat, iPhone 11 va Note 10 da doi dien tuong lai am dam hinh anh 1 \" src=\"https://znews-photo.zadn.vn/w660/Uploaded/pqmcbzwv/2019_06_02/AppleSamsungwillbenefitthemostfromHuaweisdownfallKuo.jpg\" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"caption\">Thị trường smartphone được dự đoán giảm nhẹ trong năm 2019.&nbsp;</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p dir=\"ltr\">Theo <em>IDC</em>, các dòng điện thoại “lai” vẫn được ưa chuộng ở hầu hết thị trường đang phát triển. Đây là phân khúc những thiết bị vừa có những tính năng cơ bản của một chiếc điện thoại để liên lạc và bổ sung những công cụ tiện ích như nghe nhạc, trình duyệt web. Kèm theo những sản phẩm này là mức giá rẻ hơn rất nhiều so với dòng điện thoại thông minh đầy đủ tính năng.</p>\r\n<p dir=\"ltr\">“Nhu cầu của người tiêu dùng về chức năng điện thoại thông minh tiếp tục tăng cao trong khi những dịch vụ của các sản phẩm phân khúc cao cấp đang có dấu hiệu đi lùi”, phân tích viên Sangeetika Srivastava nói.</p>\r\n<p dir=\"ltr\">Điều này có nghĩa mọi người không muốn chi <abbr class=\"rate-usd\">1.000 USD</abbr> cho điện thoại thông minh nữa. Các nhà sản xuất sẽ cần tập trung vào việc giới thiệu các sản phẩm phân khúc tầm trung nhiều hơn bên cạnh các sản phẩm cao cấp nếu muốn vượt qua sự sụt giảm doanh số điện thoại thông minh đang diễn ra.</p>\r\n<p dir=\"ltr\">Tranh chấp giữa Mỹ và Trung Quốc cũng đã gây thiệt hại cho doanh số điện thoại thông minh với sự bất ổn trên thị trường sau hành động của Tổng thống <a href=\"https://news.zing.vn/tieu-diem/tong-thong-my-donald-trump.html\" title=\"Tin tức Donald Trump\" class=\"topic person autolink\" topic-id=\"3712\">Donald Trump</a> chống lại người khổng lồ của viễn thông Trung Quốc, Huawei. Phản ứng dữ dội xuất phát từ lệnh của người đứng đầu Nhà Trắng khi ông buộc các công ty chủ chốt, bao gồm Google, phải cắt đứt quan hệ với Huawei hồi giữa tháng 5.</p>\r\n<p dir=\"ltr\">Tuy nhiên, Phó chủ tịch <em>IDC </em>Ryan Reith cũng cho rằng sự tăng trưởng sẽ nhanh chóng quay trở lại dù Trung Quốc sẽ chịu sự suy giảm 5% trong giai đoạn này trước khi có thể trở lại mức tăng trưởng trong nửa đầu năm 2020.</p>\r\n<p dir=\"ltr\">Điểm mấu chốt của sự phục hồi nhanh chóng của Trung Quốc dự kiến sẽ nhờ vào sự bùng nổ của công nghệ 5G. Viện nghiên cứu do chính phủ Trung Quốc tài trợ ước tính rằng 5G sẽ tạo thêm 8 triệu việc làm trong nước đến năm 2030. Họ cho rằng các ngành công nghiệp lớn, trong đó có y tế, năng lượng sẽ chi tổng cộng hàng tỷ USD cho thiết bị 5G và dịch vụ không dây.</p>', '4', 'iPhone ', '2019-06-02 00:00', NULL, NULL);

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
