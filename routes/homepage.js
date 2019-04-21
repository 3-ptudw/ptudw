var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('homepage/index', { page: 'Home', menuId: 'Home' });
});

/* GET homepage phim ảnh page. */
router.get('/phim-anh', function(req, res, next) {
    res.render('homepage/phim-anh', { page: 'Phim ảnh', menuId: 'Phim ảnh' });
});

/* GET homepage công nghệ page. */
router.get('/cong-nghe', function(req, res, next) {
    res.render('homepage/cong-nghe', { page: 'Công nghệ', menuId: 'Công nghệ' });
});

/* GET homepage Xuất bản' page. */
router.get('/xuat-ban', function(req, res, next) {
    res.render('homepage/xuat-ban', { page: 'Xuất bản', menuId: 'Xuất bản' });
});

/* GET page những câu hỏi lớn Avengers Endgame phải trả lời. */
router.get('/nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi', function(req, res, next) {
    res.render('homepage/nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi', { page: 'Những câu hỏi lớn "Avengers: Endgame" phải trả lời', menuId: 'Những câu hỏi lớn "Avengers: Endgame" phải trả lời' });
});

/* GET page Chi tiết TV QLED 8K đầu tiên của Samsung ở Việt Nam. */
router.get('/chi-tiet-tv-qled-8k-dau-tien-cua-samsung-o-viet-nam', function(req, res, next) {
    res.render('homepage/chi-tiet-tv-qled-8k-dau-tien-cua-samsung-o-viet-nam', { page: 'Chi tiết TV QLED 8K đầu tiên của Samsung ở Việt Nam', menuId: 'Chi tiết TV QLED 8K đầu tiên của Samsung ở Việt Nam' });
});

/* GET page Khai mạc Ngày sách Việt Nam tại TP.HCM. */
router.get('/khai-mac-ngay-sach-viet-nam-tai-tphcm', function(req, res, next) {
    res.render('homepage/khai-mac-ngay-sach-viet-nam-tai-tphcm', { page: 'Khai mạc Ngày sách Việt Nam tại TP.HCM', menuId: 'Khai mạc Ngày sách Việt Nam tại TP.HCM' });
});

module.exports = router;