{{template "header"}}
    <title>文章 -我的博客</title>
</head>
<body>
    <div class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h3>文章列表</h3>
        <a href="/topic/add" class="btn btn-default">添加文章</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <td>#</td>
                    <td>文章名称</td>
                    <td>最后更新</td>
                    <td>浏览</td>
                    <td>回复数</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>
            
                {{range .Topics}}
                <tr>
                <td>{{.Id}}</td>                
                <td>{{.Title}}</td>                
                <td>{{.Updated}}</td>                
                <td>{{.Views}}</td>                
                <td>{{.ReplyCount}}</td>                
                <td>
                {{/*
                {{if .IsLogin}}
                    <a href="/topic/delete/{{.Id}}">删除</a>||<a href="/topic/modify?tid={{.Id}}">修改</a>
                {{else}}
                     <a href="/topic/view/{{.Id}}">浏览</a>
                {{end}*/}}
                <a href="/topic/delete/{{.Id}}">删除</a>||<a href="/topic/modify?tid={{.Id}}">修改</a>
                </td>                
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