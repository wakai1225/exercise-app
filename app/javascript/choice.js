
  window.addEventListener('load', function() {
    const  PicUp = document.querySelectorAll ('.exe');
    PicUp.forEach(function(PicUp) {
      PicUp.addEventListener('mouseover', function(e){
        PicUp.setAttribute("style", "color: red;")
        e.preventDefault();
        const linkUrl = this.href; // リンクのURLを取得する
        const id = linkUrl.split("watch?v=")[1]; //リンクidの取得
        const HtmlUrl = "https://youtube.com/embed/" + id; //HTML適応するURLに変換
        document.getElementById('url_display').src = HtmlUrl ; //HTMLにサムネイル表示
      });

      PicUp.addEventListener('mouseout', function(){
        PicUp.setAttribute("style", "color: black;")
      });

        PicUp.addEventListener('click', function(e) {
          e.preventDefault();
          const linkUrl = this.href; // リンクのURLを取得する
          const id = linkUrl.split("watch?v=")[1]; //リンクidの取得
          const HtmlUrl = "https://youtube.com/embed/" + id; //HTML適応するURLに変換
          
          const URL1=document.getElementById('exercise_url1');
          const URL2=document.getElementById('exercise_url2');
          const URL3=document.getElementById('exercise_url3');
          const URL4=document.getElementById('exercise_url4');

          

          if (URL1.value=='') {
            URL1.value = HtmlUrl;
            document.getElementById('url_display1').src = HtmlUrl;
          } else if (URL2.value==''){
            URL2.value = HtmlUrl;
            document.getElementById('url_display2').src = HtmlUrl;
          } else if (URL3.value==''){
            URL3.value = HtmlUrl;
            document.getElementById('url_display3').src = HtmlUrl;
          }
          else if (URL4.value==''){
            URL4.value = HtmlUrl;
            document.getElementById('url_display4').src = HtmlUrl;
          };
      });

    function clear() {
      document.getElementById('exercise_url1').value='';
      document.getElementById('exercise_url2').value='';
      document.getElementById('exercise_url3').value='';
      document.getElementById('exercise_url4').value='';
    }
    document.getElementById("btn").addEventListener('click', clear, false);
    
  });
  });
