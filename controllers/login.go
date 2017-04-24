package controllers

import (
	// "fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	// "log"
)

type LoginController struct {
	beego.Controller
}

func (c *LoginController) Get() {

	isExit := c.Input().Get("exit") == "true"
	if isExit {
		c.Ctx.SetCookie("username", "", -1, "/")
		c.Ctx.SetCookie("passowrd", "", -1, "/")
		// c.Ctx.Output.Header("Cache-Ctrol", "no-cache")
		c.Redirect("/", 302)
		return
	}
	c.TplName = "login.tpl"

}

func (c *LoginController) Post() {

	if c.Ctx.GetCookie("username") == beego.AppConfig.String("username") &&
		c.Ctx.GetCookie("password") == beego.AppConfig.String("password") {
		c.Redirect("/", 302)
		return
	}

	username := c.Input().Get("username")
	password := c.Input().Get("password")
	autologin := c.Input().Get("autologin") == "on"

	if beego.AppConfig.String("username") == username &&
		beego.AppConfig.String("password") == password {
		maxAge := 0
		if autologin {
			maxAge = 1<<32 - 1
		}
		c.Ctx.SetCookie("username", username, maxAge, "/")
		c.Ctx.SetCookie("password", password, maxAge, "/")
		// c.Ctx.Output.Header("Cache-Ctrol", "no-cache")
	}
	c.Redirect("/", 302)
	return

}

func CheckAccount(ctx *context.Context) bool {
	username := ctx.GetCookie("username")
	password := ctx.GetCookie("password")
	if beego.AppConfig.String("username") == username &&
		beego.AppConfig.String("password") == password {
		return true
	} else {
		return false
	}

}
