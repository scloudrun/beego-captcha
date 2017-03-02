package controllers

import (
	"github.com/dchest/captcha"
	"time"
)

// operations for Captcha
type CaptchaController struct {
	BaseController
}

func (this *CaptchaController) VerifyCaptcha() {
	startTime := time.Now()
	captchaId := this.GetString("captchaId")
	captchaValue := this.GetString("captcha")
	if !captcha.VerifyString(captchaId, captchaValue) {
		this.Data["json"] = JsonFormat(0, "verify captcha fail", "", startTime)
	} else {
		this.Data["json"] = JsonFormat(1, "success", "", startTime)
	}
	this.ServeJSON()
}
