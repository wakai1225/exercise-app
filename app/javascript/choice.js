
  window.addEventListener('load', function() {
    const  PicUp = document.querySelectorAll ('.exe');
    PicUp.forEach(function(PicUp) {
      PicUp.addEventListener('mouseover', function(){
        PicUp.setAttribute("style", "color: red;")
      });
      PicUp.addEventListener('mouseout', function(){
        PicUp.setAttribute("style", "color: black;")
      });
      PicUp.addEventListener('click', function(e) {
        e.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        const id = linkUrl.split("shorts")[1];
        const HtmlUrl = "https://youtube.com/embed/" + id;
        document.getElementById('url_display').src = HtmlUrl ;
        document.getElementById("url_text").value = HtmlUrl;

      });
    });

  });
