
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

      let count = 0;
      PicUp.addEventListener('click', function(e) {
        e.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        const idList = ['id1', 'id2', 'id3', 'id4'];
        const id = linkUrl.split("shorts")[1]; //リンクidの取得
        const HtmlUrl = "https://youtube.com/embed/" + id; //HTML適応するURLに変換
        document.getElementById(idList[count]).value = HtmlUrl; //text入力
        count++;
        if (count >= idList.length) {
          count = 0;
        }
      });
    });
    function clear() {
      const idList = ['id1', 'id2', 'id3', 'id4'];
      document.getElementById(idList[1]).value='';
    }
    document.getElementById("btn").addEventListener('click', clear, false);
    
  });
