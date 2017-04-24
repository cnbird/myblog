{{template "header"}}
        <title>登陆 -我的博客</title>
    </head>
    <body>
    <div class="container" style="width: 500px">
    <form method="post" action="/login">
      <div class="form-group">
        <label >用户名</label>
        <input class="form-control" id="username" placeholder="Enter account" name="username">
      </div>
      <div class="form-group">
        <label >密码</label>
        <input type="password" class="form-control"  id="password" placeholder="Password" name="password">
      </div>
      <div class="checkbox">
         <label>
           <input type="checkbox" name="autologin"> 记住登陆
         </label>
       </div>
      <button type="submit" class="btn btn-default" onclick="return checkInput()">确定</button>
      <button type="submit" class="btn btn-default" onclick="return backToHome()">返回</button>
    </form>
    <script type="text/javascript">
        function checkInput(){
            var username = document.getElementById("username");
            if (username.value.length == 0) {
                alert("请输入用户名");
                return false;
            }
            var password = document.getElementById("password");
            if (password.value.length == 0) {
                alert("请输入密码");
                return false;
            }
            return true;
        }

        function backToHome(){
            window.location("/");
            return false
        }
    </script>
    </div>
    </body>
</html>
