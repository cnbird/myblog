package controllers

import (
	"github.com/astaxie/beego"
	"myblog/models"
)

type HomeController struct {
	beego.Controller
}

func (c *HomeController) Get() {
	c.TplName = "index.tpl"
	c.Data["IsHome"] = true
	c.Data["IsLogin"] = CheckAccount(c.Ctx)
	var err error
	c.Data["Topics"], err = models.GetAllTopics(false)
	if err != nil {
		beego.Error(err)
	}

}
