
  window.addEventListener('load', function() {
    const  PicUp = document.querySelectorAll ('.exe');
    PicUp.forEach(function(PicUp) {
      PicUp.addEventListener('click', function() {
        event.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        console.log(linkUrl); // コンソールに表示する
      });
      PicUp.addEventListener('mouseover', function(){
        PicUp.setAttribute("style", "color: red;")
    });
    PicUp.addEventListener('mouseout', function(){
      PicUp.setAttribute("style", "color: black;")
    });
  });
  });
