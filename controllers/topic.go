package controllers

import (
	"github.com/astaxie/beego"
	"myblog/models"
)

type TopicController struct {
	beego.Controller
}

func (c *TopicController) Get() {
	c.TplName = "topic.tpl"
	c.Data["IsTopic"] = true
	c.Data["IsLogin"] = CheckAccount(c.Ctx)
	var err error
	c.Data["Topics"], err = models.GetAllTopics(false)
	if err != nil {
		beego.Error(err)
	}

}
func (c *TopicController) Add() {
	c.Data["IsLogin"] = CheckAccount(c.Ctx)
	c.TplName = "addtopic.tpl"
}
func (c *TopicController) Post() {

	if !CheckAccount(c.Ctx) {
		c.Redirect("/login", 302)
		return
	}
	tid := c.Input().Get("tid")
	title := c.Input().Get("title")
	content := c.Input().Get("content")
	category := c.Input().Get("category")
	var err error

	if len(tid) != 0 {
		err = models.ModifyTopic(tid, title, category, content)
		if err != nil {
			beego.Error(err)
		}
		c.Redirect("/topic", 302)
		return
	}
	err = models.AddTopic(title, category, content)
	if err != nil {
		beego.Error(err)
	}
	c.Redirect("/topic", 302)
}
func (c *TopicController) View() {
	c.TplName = "topic-view.tpl"
	topic, err := models.GetTopic(c.Ctx.Input.Param("0"))
	if err != nil {
		beego.Error(err)
		c.Redirect("/", 302)
		return
	}
	c.Data["Topic"] = topic
	c.Data["id"] = c.Ctx.Input.Param("0")
}

func (c *TopicController) Modify() {
	c.Data["IsLogin"] = CheckAccount(c.Ctx)
	c.TplName = "topic-modify.tpl"
	tid := c.Input().Get("tid")
	topic, err := models.GetTopic(tid)
	if err != nil {
		beego.Error(err)
		c.Redirect("/", 302)
		return
	}
	c.Data["Topic"] = topic
	c.Data["Tid"] = tid
}

func (c *TopicController) Delete() {
	if !CheckAccount(c.Ctx) {
		c.Redirect("/login", 302)
		return
	}
	err := models.DeleteTopic(c.Ctx.Input.Param("0"))
	if err != nil {
		beego.Error(err)
	}
	c.Redirect("/", 302)

}
