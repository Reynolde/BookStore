-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 24, 2025 lúc 01:49 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlda`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` int NOT NULL,
  `product_quantity` int NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(20, 'Manga', 'default-product.jpg', 1),
(21, 'Tiểu Thuyết', 'default-product.jpg', 1),
(22, 'Truyện ngắn', 'default-product.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ẩn 1 hiện',
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(108, 57, 50, 1, 111000),
(109, 58, 50, 1, 111000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(57, 17, '2025-04-23 20:12:09', 111000, 'ada', '0354758037', '', 1),
(58, 17, '2025-04-24 07:41:15', 111000, 'ada', '0354758037', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `sale_price` int NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(43, 20, 'Attack On Titan', 'nxbtre_full_09272025_092704.webp', 50, 50000, 45600, '2025-04-23 19:20:30', 1, '', '<p>Sau nhiều năm sống yên ổn sau những bức tường thành cao lừng lững, loài người đã bắt đầu cảm nhận được nguy cơ diệt vong đến từ một giống loài khổng lồ mang tên Titan. Dù muốn dù không, họ buộc phải đứng lên, và đã đứng lên một cách đầy quyết tâm, mạnh mẽ để chống lại những kẻ thù hùng mạnh nhất.</p>', 1),
(44, 20, 'Hồ Sơ Mật - The Top Secret', 'nxbtre_full_04492025_034959.webp', 20, 60000, 52250, '2025-04-23 19:21:42', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8934974208297</td></tr><tr><th>Độ Tuổi</th><td>18+</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT\">NXB Trẻ</a></td></tr><tr><th>Tác giả</th><td>Reiko Shimizu</td></tr><tr><th>Người Dịch</th><td>Ukato Mai</td></tr><tr><th>NXB</th><td>Trẻ</td></tr><tr><th>Năm XB</th><td>2025</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>237</td></tr><tr><th>Kích Thước Bao Bì</th><td>19 x 13 x 1 cm</td></tr><tr><th>Số trang</th><td>200</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr><tr><th>Genres</th><td>Drama</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th>Sản phẩm bán chạy nhất</th><td><a href=\"https://www.fahasa.com/sach-trong-nuoc/manga-comic/manga/manga-khac.html?order=num_orders_month\">Top 100 sản phẩm Manga Khác bán chạy của tháng</a></td></tr></tbody></table></figure>', '<p>Trong thế kỷ mới, những công nghệ tiên tiến ra đời đã giúp các điều tra viên phá những vụ án tưởng chừng như đi vào ngõ cụt. Phòng nghiên cứu pháp y số 9 hay còn gọi là “Số 9” - một đội điều tra đặc biệt áp dụng điều tra bằng MRI – phương pháp tái hiện những điều bộ não nạn nhân hay hung thủ “thấy” khi còn sống để điều tra những vụ án không thể làm rõ bằng cách thức thông thường.</p>', 1),
(45, 20, 'Tình Yêu Nhân Vật Phụ', 'nxbtre_full_10592025_095931.jpg', 16, 50000, 42000, '2025-04-23 19:22:30', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8934974208631</td></tr><tr><th>Dự Kiến Có Hàng</th><td>25/04/2025</td></tr><tr><th>Ngày Dự Kiến Phát Hành</th><td>25/04/2025</td></tr><tr><th>Độ Tuổi</th><td>18+</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT\">NXB Trẻ</a></td></tr><tr><th>Tác giả</th><td>Akane Tamura</td></tr><tr><th>Người Dịch</th><td>Lục Thảo</td></tr><tr><th>NXB</th><td>Trẻ</td></tr><tr><th>Năm XB</th><td>2025</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>185</td></tr><tr><th>Kích Thước Bao Bì</th><td>19 x 13 x 0.7 cm</td></tr><tr><th>Số trang</th><td>156</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<p>Tanaka Nobuko là một cô sinh viên đã sống 20 năm cuộc đời mờ nhạt như “nhân vật phụ” trong một bộ phim. Trong thời gian học đại học, cô làm thêm tại siêu thị địa phương và phải lòng anh bạn cùng tuổi cũng làm thêm tại đây. Liệu cô gái “nhân vật phụ” nhút nhát này có thể thành công theo đuổi người mình thích không?</p>', 1),
(46, 20, 'Thiên Hà Cạnh Bên', 'nxbtre_full_24432024_044331_2.webp', 28, 57000, 47500, '2025-04-23 19:23:19', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8934974203841-khongqua</td></tr><tr><th>Độ Tuổi</th><td>16+</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT\">NXB Trẻ</a></td></tr><tr><th>Tác giả</th><td>Gido Amagakure</td></tr><tr><th>Người Dịch</th><td>Tsunami</td></tr><tr><th>NXB</th><td>Trẻ</td></tr><tr><th>Năm XB</th><td>2024</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>229</td></tr><tr><th>Kích Thước Bao Bì</th><td>19 x 13 x 0.9 cm</td></tr><tr><th>Số trang</th><td>192</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr><tr><th>Đếm ngược thời gian</th><td>2024-08-03 12:00:00</td></tr></tbody></table></figure>', '<p>Sau cái chết của cha mình, Kuga Ichirou, một hoạ sĩ truyện tranh thiếu nữ mới ra trường, phải một mình chăm sóc hai đứa em nhỏ của mình, Machi và Fumio. Gặp khó khăn trong việc chạy deadline khi các trợ lý trước của anh ra mắt manga, anh ấy đã thuê một trợ lý mới thông qua biên tập viên của mình. Tuy nhiên, cuộc đời của anh có một bước ngoặt lớn sau khi găp người trợ lý xinh đẹp và bí ẩn này.</p>', 1),
(47, 20, 'Sakamoto Days', 'nxbtre_full_10122024_081202.jpg', 30, 47000, 42000, '2025-04-23 19:26:22', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8934974206484</td></tr><tr><th>Độ Tuổi</th><td>18+</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT\">NXB Trẻ</a></td></tr><tr><th>Tác giả</th><td>Yuto Suzuki</td></tr><tr><th>Người Dịch</th><td>Anh Huỳnh</td></tr><tr><th>NXB</th><td>Trẻ</td></tr><tr><th>Năm XB</th><td>2024</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>184</td></tr><tr><th>Kích Thước Bao Bì</th><td>17.6 x 11.3 x 0.9 cm</td></tr><tr><th>Số trang</th><td>192</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<p>Sakamoto Taro là sát thủ huyền thoại, vừa là nỗi khiếp sợ của các băng đảng tội phạm, vừa là niềm ước ao của các tay sát thủ. Nhưng một ngày nọ anh đã yêu, kết hôn và rửa tay gác kiếm.</p><p>Từ một sát thủ khét tiếng, anh trở thành ông chú mũm mĩm, điều hành tiệm tạp hóa.</p><p>Một ngày nọ, có cậu thanh niên đến tìm anh và ngỏ lời muốn anh tái xuất giang hồ nhưng anh đã từ chối. Kể từ đó nhiều nguy hiểm ập đến với anh và gia đình. Liệu anh có thể bảo vệ bản thân và gia đình của mình?</p><p>Điểm nổi bật:</p><p>- Đến tháng 1 năm 2024, manga đã có hơn 4.3 triệu bản in. Được đề cử cho Best Print Manga tại Lễ trao giải Next Manga Awards năm 2021.</p><p>- Đứng thứ sáu trong danh sách những bộ truyện được nhân viên các nhà sách trên toàn quốc đề xuất nhiều nhất năm 2022.</p><p>- Được đề cử và đứng hạng 6 trên tổng số 50 manga trong Shogakukan Manga Award lần thứ 68 ở hạng mục shonen vào năm 2022.</p><p>- Thắng giåi U-Next Prize năm 2022.</p><p><br>&nbsp;</p>', 1),
(48, 21, 'Trường Ca Achilles', 'image_195509_1_41170.webp', 28, 156000, 124800, '2025-04-23 19:28:12', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8935244843545</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/kim-dong?fhs_campaign=ATTRIBUTE_PRODUCT\">Nhà Xuất Bản Kim Đồng</a></td></tr><tr><th>Tác giả</th><td>Madeline Miller</td></tr><tr><th>NXB</th><td>NXB Kim Đồng</td></tr><tr><th>Năm XB</th><td>2020</td></tr><tr><th>Trọng lượng (gr)</th><td>450</td></tr><tr><th>Kích Thước Bao Bì</th><td>22.5 x 14 cm</td></tr><tr><th>Số trang</th><td>444</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<h2><strong>TRƯỜNG CA ACHILLES - MỘT BẢN TÌNH CA BI TRÁNG DƯỚI ÁNH HOÀNG HÔN HY LẠP</strong></h2><p>Lấy cảm hứng từ sử thi Iliad, Madeline Miller đã tái hiện một câu chuyện tình yêu đầy say đắm nhưng cũng nhuốm màu bi kịch giữa hai người anh hùng Hy Lạp trong tác phẩm đầu tay của mình – Trường Ca Achilles</p>', 1),
(49, 21, 'Người Đàn Ông Mang Tên OVE (Tái Bản)', '8934974182375.webp', 24, 160000, 136000, '2025-04-23 19:29:23', 0, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8934974182375</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT\">NXB Trẻ</a></td></tr><tr><th>Tác giả</th><td>Fredrik Backman</td></tr><tr><th>Người Dịch</th><td>Hoàng Anh</td></tr><tr><th>NXB</th><td>Trẻ</td></tr><tr><th>Năm XB</th><td>2022</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>430</td></tr><tr><th>Kích Thước Bao Bì</th><td>20 x 13 cm</td></tr><tr><th>Số trang</th><td>452</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<h2><strong>NGƯỜI ĐÀN ÔNG MANG TÊN OVE - CUỐN SÁCH KHIẾN TRIỆU ĐỘC GIẢ CƯỜI RỒI KHÓC</strong></h2><p>Bạn có tin rằng một ông lão cộc cằn, khó tính lại có thể khiến bạn rơi nước mắt vì xúc động? Bạn đã bao giờ nghĩ rằng lòng nhân ái có thể đến từ những con người tưởng chừng khô khan nhất? Một ông lão cộc cằn, một con mèo hoang, vài người hàng xóm phiền phức - tất cả có thể tạo nên một câu chuyện khiến bạn bật khóc?</p><h2><strong>VỀ TÁC GIẢ:&nbsp;Fredrik Backman - Hành trình trở thành nhà Văn được yêu thích</strong></h2><ul><li>Fredrik Backman (sinh năm 1981) là nhà văn, blogger và nhà báo người Thụy Điển.</li><li>Trước khi trở thành tiểu thuyết gia, ông từng viết blog và làm phóng viên cho một tờ báo địa phương.</li><li>Năm 2012, ông xuất bản Người Đàn Ông Mang Tên Ove, tác phẩm nhanh chóng trở thành hiện tượng toàn cầu, lọt top bán chạy tại nhiều quốc gia.</li><li>Ông nổi tiếng với lối viết hài hước, cảm động và đầy tính nhân văn, đưa những câu chuyện đời thường trở nên sâu sắc và đáng nhớ.</li></ul><h2><strong>VỀ DỊCH GIẢ: Hoàng Anh - Người thổi hồn vào tác phẩm</strong></h2><p>Hoàng Anh là dịch giả tận tâm, mang văn học thế giới đến gần hơn với độc giả Việt. Với lối dịch trôi chảy, giàu cảm xúc, anh đã giúp những câu chuyện nước ngoài trở nên gần gũi và chân thực hơn.</p><p><strong>Một số tác phẩm dịch tiêu biểu:</strong></p><ul><li>Người Đàn Ông Mang Tên Ove - Fredrik Backman</li><li>Britt-Marie Đã Ở Đây - Fredrik Backman</li><li>Lời Hứa Lúc Bình Minh - Romain Gary</li></ul><h3>TÓM TẮT NỘI DUNG SÁCH</h3><p>Ove là một người đàn ông 59 tuổi, sống một cuộc đời nghiêm túc, theo nguyên tắc và không thích thay đổi. Ông cộc cằn, khó gần, thậm chí có vẻ đáng ghét. Nhưng sâu bên trong, Ove là một người đàn ông mang nhiều nỗi đau, đặc biệt là sau khi mất đi người vợ yêu dấu.</p><p>Cuộc sống của Ove đảo lộn khi một gia đình trẻ chuyển đến bên cạnh nhà ông và sự xuất hiện của con mèo hoang. Họ vô tình “xâm nhập” vào cuộc sống đơn độc của ông, kéo theo những tình huống dở khóc dở cười. Dần dần,&nbsp;tấm lòng nhân hậu của Ove được hé lộ, chứng minh rằng ngay cả những người khép kín nhất cũng có thể mở lòng khi gặp đúng người.</p><p>Cuốn sách này cũng đã được chuyển thể thành bộ phim đình đám với sự tham gia của&nbsp;Tom Hanks,&nbsp;đã được đề cử ở hạng mục phim nói tiếng nước ngoài hay nhất tại Oscar 2017.</p><p><strong>Quyển sách mang đến cho độc giả:</strong></p><ul><li>Chạm đến cảm xúc – Hài hước, cảm động và đầy nhân văn.</li><li>Nhìn cuộc sống theo cách khác – Đằng sau vẻ ngoài cộc cằn là một trái tim ấm áp.</li><li>Tình người giản dị nhưng sâu sắc – Những kết nối nhỏ bé có thể thay đổi cả một đời người.&nbsp;</li><li>Chữa lành và truyền cảm hứng – Dành cho những ai từng cô đơn, lạc lõng</li></ul><p><strong>Tại sao độc giả nên đọc?&nbsp;</strong></p><ul><li>Cuốn sách mang chất trào lộng duyên dáng kiểu Bắc Âu nhưng cũng tràn đầy tính nhân văn, đã trở thành hiện tượng toàn cầu với gần 3 triệu bản in bán ra.</li><li>Sách xuất bản bằng tiếng Anh vào năm 2013 và lọt vào danh sách Sách bán chạy nhất của New York Times 18 tháng sau khi xuất bản và ở trong danh sách thứ 42 tuần.</li></ul><p>Độc giả đã sẵn sàng bước vào thế giới của Ove. Chốt đơn tại Fahasa ngay nào</p>', 1),
(50, 21, 'Hồ Điệp Và Kình Ngư', 'bia-2d_ho-diep-va-kinh-ngu_17307.webp', 78, 155000, 111000, '2025-04-23 19:31:36', 2, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8935212370189</td></tr><tr><th>Tên Nhà Cung Cấp</th><td><a href=\"https://www.fahasa.com/dinh-ti?fhs_campaign=ATTRIBUTE_PRODUCT\">Đinh Tị</a></td></tr><tr><th>Tác giả</th><td>Tuế Kiến</td></tr><tr><th>Người Dịch</th><td>Diệp Châu</td></tr><tr><th>NXB</th><td>Văn Học</td></tr><tr><th>Năm XB</th><td>2024</td></tr><tr><th>Trọng lượng (gr)</th><td>500</td></tr><tr><th>Kích Thước Bao Bì</th><td>20.5 x 14.5 x 1.3 cm</td></tr><tr><th>Số trang</th><td>272</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<p>Một câu chuyện cuốn hút ngay từ những trang đầu tiên - Khi tình yêu trở thành sợi dây mong manh giữa sinh tử, phản bội và hy vọng. Khi một nàng hồ điệp nhỏ bé chạm trán với kình ngư mạnh mẽ, liệu đó là định mệnh hay chỉ là một giấc mộng chóng tàn?</p>', 1),
(51, 22, 'Nếu Biết Trăm Năm Là Hữu Hạn', '8932000134749_1.webp', 16, 159000, 130000, '2025-04-23 19:33:29', 2, '<figure class=\"table\"><table><tbody><tr><th>Mã hàng</th><td>8932000134749</td></tr><tr><th>Tên Nhà Cung Cấp</th><td>Cty Bán Lẻ Phương Nam</td></tr><tr><th>Tác giả</th><td>Phạm Lữ Ân</td></tr><tr><th>NXB</th><td>Thế Giới</td></tr><tr><th>Năm XB</th><td>2024</td></tr><tr><th>Ngôn Ngữ</th><td>Tiếng Việt</td></tr><tr><th>Trọng lượng (gr)</th><td>279</td></tr><tr><th>Kích Thước Bao Bì</th><td>20.5 x 13 x 1.2 cm</td></tr><tr><th>Số trang</th><td>263</td></tr><tr><th>Hình thức</th><td>Bìa Mềm</td></tr></tbody></table></figure>', '<p>Bạn đã bao giờ tự hỏi: Nếu biết trước cuộc đời là hữu hạn, bạn sẽ sống khác đi chứ?&nbsp;</p><p>Chúng ta luôn nghĩ mình có nhiều thời gian, nhưng thực tế, mọi khoảnh khắc đều đang trôi qua mãi mãi.</p><h2><strong>VỀ TÁC GIẢ: PHẠM LỮ ÂN</strong></h2><p>Là bút danh của đôi vợ chồng nhà báo chuyên viết cho giới trẻ, là Đặng Nguyễn Đông Vy và Nguyễn Hoàng Mai, hai nhà văn nổi bật trong dòng sách truyền cảm hứng.</p><p>Những tác phẩm của họ không chỉ là lời kể, mà là những triết lý sống sâu sắc, giúp độc giả nhìn lại chính mình.</p><p>Nếu Biết Trăm Năm Là Hữu Hạn là một trong những cuốn sách được yêu thích nhất, giúp hàng ngàn người trẻ tìm lại ý nghĩa của cuộc sống.</p><h2><strong>TÓM TẮT NỘI DUNG SÁCH</strong></h2><p>Nếu Biết Trăm Năm Là Hữu Hạn là tập hợp 40 bài viết nhẹ nhàng nhưng sâu sắc, giàu cảm xúc từ chuyên mục Cảm thức của Bán nguyệt san Sinh Viên Việt Nam. Cuốn sách dẫn dắt người đọc đi sâu vào những cảm nhận về cuộc đời, tình yêu, tình bạn và sự thành bại, đặt ra những câu hỏi mà ai cũng từng nghĩ đến nhưng ít ai dám đối diện:</p><p>Chúng ta đang sống hay chỉ đang tồn tại?</p><p>Hạnh phúc thực sự nằm ở đâu?</p><p>Điều gì sẽ khiến chúng ta không hối tiếc khi nhìn lại?</p><p>Với giọng văn dung dị, thân mật, tác giả dễ dàng chạm đến trái tim người đọc, khiến ta như đang lắng nghe một người bạn tâm sự. Những câu chuyện giản dị nhưng chứa nhiều tầng cảm xúc: hoài niệm, sâu sắc, chân thành - gợi mở những suy ngẫm mới mẻ về giá trị của từng khoảnh khắc trong cuộc đời.</p><p>Cuốn sách không chỉ là một tác phẩm văn học mà còn là một lời nhắc nhở nhẹ nhàng: Thời gian là hữu hạn, hãy sống sao cho xứng đáng!</p><h3><strong>Vì sao bạn không nên bỏ lỡ cuốn sách này?</strong></h3><p>Nếu bạn từng trì hoãn hạnh phúc của mình cho một ngày \"đủ đầy\" trong tương lai.</p><p>Nếu bạn từng loay hoay giữa những lựa chọn, sợ hãi mình sẽ hối tiếc.</p><p>Nếu bạn muốn sống một cuộc đời mà không phải quay đầu nhìn lại với tiếc nuối.</p><h3><strong>Cuốn sách giúp bạn nhận ra điều gì?</strong></h3><p>Nếu Biết Trăm Năm Là Hữu Hạn là một lời nhắc nhở nhẹ nhàng nhưng đầy ám ảnh, giúp bạn nhận ra:</p><ul><li>Hạnh phúc không nằm ở tương lai xa vời mà ngay trong hiện tại.</li><li>Cuộc sống hữu hạn, đừng chờ đến khi quá muộn mới nhận ra điều gì đáng giá.</li><li>Những gì nhỏ bé hôm nay có thể trở thành những kỷ niệm lớn nhất mai sau.&nbsp;</li></ul><p>&nbsp;</p><p><strong>Nếu biết trăm năm là hữu hạn, liệu bạn có sống khác đi? =&gt; MUA NGAY</strong></p><p>&nbsp;</p><p><br>&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(1, 'admin', '123456789', 'Admin', 'noimage.png', 'admin@gmail.com', '0354758031', 'Group 9', 1, 1),
(15, 'Thanh Tung', '$2y$10$FoXlgmBH4WjBXyAUD9Qi/upUQ/aC4AEhr3YAXINCVr6CFvRN4iokq', 'Nguyen Tung', 'anh.jpeg', 'tungngoc0112@gmail.com', '0865804569', 'Hà Nội', 1, 1),
(16, 'baothong', '$2y$10$8DlntrU44nBNZxGAL9Mni.iFPuQFCjKynIOStHchfCRngRlAvQ/Ky', 'Thông Lô Bảo', 'user-default.png', 'phbaothong@gmail.com', '0354758039', 'số 81 lk 23 vân canh hoài đức', 0, 1),
(17, 'baothong123', '$2y$12$.nlU83jxf7czjhTpe5W77edGaq3vwnrw9dtUwC6Rtp1JogxNzVO.S', 'Lô Bảo Thông', 'user-default.png', 'baothong1038@gmail.com', '0354758037', 'ada', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
