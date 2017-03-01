package routers

import (
	"beego-captcha/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{}, "get:Login")
	beego.Router("/home", &controllers.MainController{}, "get:Login")
	beego.Router("/captcha", &controllers.CaptchaController{}, "get:GetCaptcha")
	beego.Router("/verify", &controllers.CaptchaController{}, "get:VerifyCaptcha")
}
