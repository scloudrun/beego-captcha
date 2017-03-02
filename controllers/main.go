package controllers

import (
	"github.com/astaxie/beego"
	"github.com/dchest/captcha"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Home() {
	this.Data["Website"] = "scloud"
	this.Data["Email"] = "scloudrun@gmail.com"
	this.TplName = "index.tpl"
}

func (this *MainController) Login() {
	this.Data["Website"] = "beego.me"
	this.Data["Email"] = "scloudrun@gmail.com"
	d := struct {
		CaptchaId string
	}{
		captcha.New(),
	}
	this.Data["CaptchaId"] = d.CaptchaId
	this.TplName = "login.tpl"
}
