package controllers

import (
	"fmt"
	"myblog/models"

	"github.com/astaxie/beego"
)

type CategoryController struct {
	beego.Controller
}

func (c *CategoryController) Get() {
	op := c.Input().Get("op")
	fmt.Println("op = ", op)

	switch op {
	case "add":

		if !CheckAccount(c.Ctx) {
			c.Redirect("/login", 302)
			return
		}
		c.Data["IsLogin"] = true
		name := c.Input().Get("categoryname")

		if len(name) == 0 {
			break
		}
		err := models.AddCategory(name)
		if err != nil {
			beego.Error(err)
		}
		c.Ctx.Output.Header("Cache-Control", "no-cache")
		c.Redirect("/category", 301)
		return
	case "del":
		if !CheckAccount(c.Ctx) {
			c.Redirect("/login", 302)
			return
		}
		id := c.Input().Get("id")
		if len(id) == 0 {
			break
		}
		err := models.DelCategoryById(id)
		if err != nil {
			beego.Error(err)
		}
		c.Ctx.Output.Header("Cache-Control", "no-cache")
		c.Redirect("/category", 301)
	}
	c.TplName = "category.tpl"
	c.Data["IsCategory"] = true
	c.Data["IsLogin"] = CheckAccount(c.Ctx)
	var err error
	c.Data["Categories"], err = models.GetAllCategories()
	if err != nil {
		beego.Error(err)
	}
}
