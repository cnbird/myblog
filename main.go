package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"myblog/models"
	_ "myblog/routers"
)

func init() {
	models.RegisterDB()
	orm.Debug = true
	orm.RunSyncdb("default", false, true)
}
func main() {

	beego.Run()
}
