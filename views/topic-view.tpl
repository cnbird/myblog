{{template "header"}}
    <title>{{.Topic.Title}} -我的博客</title>
</head>
<body>
    <div class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h3>{{.Topic.Title}} <a href="/topic/modify?tid={{.Topic.Id}}" class="btn btn-default">修改</a></h3>
        <p>{{.Topic.Content}}</p>
    </div>
  
</body>
</html>