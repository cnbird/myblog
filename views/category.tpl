{{template "header"}}
    <title>分类 -我的博客</title>
</head>
<body>
    <div class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h3>分类列表</h3>
        <form method="GET" action="/category">
            <div class="form-group">
                <label >分类名称：</label>
                <input class="form-control" id="categoryname" placeholder="input category name" name="categoryname">
            </div>
            <input type="hidden" name="op" value="add">
            <button type="submit" class="btn btn-default" onclick="return checkInput()">添加</button>
        </form>
        <table class="table table-striped">
            <thead>
                <tr>
                    <td>#</td>
                    <td>名称</td>
                    <td>文章数</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>
            
                {{range .Categories}}
                <tr>
                <td>{{.Id}}</td>                
                <td>{{.Title}}</td>                
                <td>{{.TopicCount}}</td>                
                <td><a href="/category?op=del&id={{.Id}}">删除</a></td>                
                {{end}}
                </tr>
            </tbody>
            
        </table>
   
    </div>

    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
          function checkInput(){
              var categoryname = document.getElementById("categoryname");
              if (categoryname.value.length == 0) {
                  alert("请输入分类名称");
                  return false;
              }
              return true;
           }
    </script>
  
</body>
</html>