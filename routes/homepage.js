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

/* GET homepage tag page. */
router.get('/avengers-endgame', function(req, res, next) {
    res.render('homepage/avengers-endgame', { page: 'avengers-endgame', menuId: 'avengers-endgame' });
});

/* GET page những câu hỏi lớn Avengers Endgame phải trả lời. */
router.get('/nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi', function(req, res, next) {
    res.render('homepage/nhung-cau-hoi-lon-avengers-endgame-phai-tra-loi', { page: 'Những câu hỏi lớn "Avengers: Endgame" phải trả lời', menuId: 'Những câu hỏi lớn "Avengers: Endgame" phải trả lời' });
});

/* GET infomation page. */
router.get('/infomation', function(req, res, next) {
    res.render('homepage/infomation', { page: 'infomation', menuId: 'infomation' });
});

module.exports = router;