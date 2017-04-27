{{template "header"}}
	<title>首页 -我的博客</title>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		{{template "navbar" .}}
	</div>

	<div class="container">
	{{range .Topics}}
		<div class="page-header">
			<h1>{{.Title}}</h1>
			<h6 class="text-muted">文章发表于{{.Created}}， 共有{{.Views}}次浏览，{{.ReplyCount}}个评论</h6>
		
		</div>
		<div class="container">
		    <h3>发表评论</h3>
		    <form method="post" action="/topic">
			    <div class="form-group">
			        <label>评论:</label>
			        <textarea  class="form-control" name="reply" cols="30" rows="10"></textarea>
			    </div>
		        <div class="form-group">
		            <label >姓名:</label>
		            <input type="text" name="name" class="form-control">
		        </div>
		        <div class="form-group">
		            <label >电子邮件:</label>
		            <input type="text" class="form-control" name="email">
		        </div>
		        
		        <button type="submit"  class="btn btn-default">提交</button>
		    </form>
		
		</div>

	{{end}}
	</div>
</body>
</html>