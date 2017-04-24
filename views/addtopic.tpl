{{template "header"}}
    <title>添加文章 -我的博客</title>
</head>
<body>
    <div class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h3>添加文章</h3>
        <form method="post" action="/topic">
            <div class="form-group">
                <label >文章标题:</label>
                <input type="text" name="title" class="form-control">
            </div>
            <div class="form-group">
                <label >文章分类:</label>
                <input type="text" class="form-control" name="category">
            </div>
            <div class="form-group">
                <label>文章内容:</label>
                <textarea  class="form-control" name="content" cols="30" rows="10"></textarea>
            </div>
            <button type="submit"  class="btn btn-default">提交</button>
        </form>
   
    </div>
  
</body>
</html>