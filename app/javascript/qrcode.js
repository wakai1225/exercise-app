function qrcode() {
  document.getElementById('getqrInfo').addEventListener('click', () => {
    // 入力された文字列を取得
    var userInput = location.href;
    //var query = userInput.split(' ').join('+');
    // QRコードの生成
    (function() {
      var qr = new QRious({
        element: document.getElementById('newImg'),
        // 入力した文字列でQRコード生成
        value: userInput
    });
    qr.background = '#FFF'; //背景色
    qr.backgroundAlpha = 0.8; // 背景の透過率
    qr.foreground = '#6bb6ff'; //QRコード自体の色
    qr.foregroundAlpha = 1.0; //QRコード自体の透過率
    qr.level = 'L'; // QRコードの誤り訂正レベル
    qr.size = 240; // QRコードのサイズ
    })();
  // png出力用コード
  var cvs = document.getElementById("newImg");
  var png = cvs.toDataURL();
  document.getElementById("newImg").src = png;
  });
};
 window.addEventListener('load', qrcode);


