
  window.addEventListener('load', function() {
    const  PicUp = document.querySelectorAll ('.exe');
    PicUp.forEach(function(PicUp) {
      PicUp.addEventListener('mouseover', function(e){
        PicUp.setAttribute("style", "color: red;")
        e.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        const id = linkUrl.split("shorts")[1]; //リンクidの取得
        const HtmlUrl = "https://youtube.com/embed/" + id; //HTML適応するURLに変換
        document.getElementById('url_display').src = HtmlUrl ; //HTMLにサムネイル表示
      });

      PicUp.addEventListener('mouseout', function(){
        PicUp.setAttribute("style", "color: black;")
      });

      PicUp.addEventListener('click', function(e) {
        e.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        const id = linkUrl.split("shorts")[1]; //リンクidの取得
        const HtmlUrl = "https://youtube.com/embed/" + id; //HTML適応するURLに変換
        document.getElementById("url_text").value = HtmlUrl; //text入力
      });
    });


    function clear() {
      document.getElementById("url_text").value='';
    }
    document.getElementById("btn").addEventListener('click', clear, false);
    
  });
