{{template "header"}}
    <title>修改文章 -我的博客</title>
</head>
<body>
    <div class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h3>修改文章</h3>
        <form method="post" action="/topic">
            <input type="hidden" name="tid" value="{{.Tid}}">
            <div class="form-group">
                <label >文章标题:</label>
                <input type="text" name="title" class="form-control" value="{{.Topic.Title}}">
            </div>
            <div class="form-group">
                <label >文章分类:</label>
                <input type="text" class="form-control" name="category" value="{{.Topic.Category}}">
            </div>
            <div class="form-group">
                <label>文章内容:</label>
                <textarea  class="form-control" name="content" cols="30" rows="10">{{.Topic.Content}}</textarea>
            </div>
            <button type="submit"  class="btn btn-default">提交</button>
        </form>
   
    </div>
  
</body>
</html>