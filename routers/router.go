package routers

import (
	"beego-captcha/controllers"
	"github.com/astaxie/beego"
	"github.com/dchest/captcha"
)

func init() {
	beego.Router("/", &controllers.MainController{}, "get:Login")
	beego.Router("/home", &controllers.MainController{}, "get:Home")
	beego.Router("/verify", &controllers.CaptchaController{}, "get:VerifyCaptcha")
	beego.Handler("/captcha/*.png", captcha.Server(240, 80))
}
