<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="http://www.semantic-ui.cn/dist/semantic.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
    <style>
        *{ font:12pt Verdana,Arial,Microsoft YaHei,sans-serif; color:#666666; word-wrap:break-word;}
        #screen{margin:0 auto; width:420px; margin-top:100px; }
        .field label {font-weight: bold;}
        .ui.message .header {font-size: 1em;}
    </style>
    <script type="text/javascript">
        function login() {
            var name = $("#name").val()
            var password = $("#password").val()
            var captcha = $("#captcha").val()
            if (name.length == 0) {
                $("#err .header").html("username is blank");
                $("#err").show("fast");
                return false;
            }

            if (password.length == 0) {
                $("#err .header").html("password is blank");
                $("#err").show("fast");
                return false;
            }

            if (captcha.length == 0) {
                $("#err .header").html("captcha is blank");
                $("#err").show("fast");
                return false;
            }

            $.post("/verify", {"name":name, "password": password ,"captchaId":{{ .CaptchaId }},"captcha":captcha}, function(data){
                if (data.length == 0) {
                    window.location.href="/";
                } else {
                    if(data.code == 0){
                        $("#err .header").html(data.desc);
                        $("#err").show("fast");
                    }else{
                        window.location.href="/home";
                    }
                }
            });
        }
        $(function(){
            $("#name").keypress(function(e){
                $("#err").hide("fast");
                if(e.keyCode==13){
                    login();
                }
            });
            $("#password").keypress(function(e){
                $("#err").hide("fast");
                if(e.keyCode==13){
                    login();
                }
            });
        });
        function setSrcQuery(e, q) {
            var src  = e.src;
            var p = src.indexOf('?');
            if (p >= 0) {
                src = src.substr(0, p);
            }
            e.src = src + "?" + q
        }
        
        function reload() {
            setSrcQuery(document.getElementById('image'), "reload=" + (new Date()).getTime());
            return false;
        }
    </script>
</head>
<body>
    <div id="screen">
        <div class="ui form segment">
            <div class="field">
                <label>Username</label>
                <div class="ui left labeled icon input">
                    <input type="text" placeholder="Username" id="name">
                    <i class="user icon"></i>
                    <div class="ui corner label">
                        <i class="icon asterisk"></i>
                    </div>
                </div>
            </div>
            <div class="field">
                <label>Password</label>
                <div class="ui left labeled icon input">
                    <input type="password" id="password">
                    <i class="lock icon"></i>
                    <div class="ui corner label">
                        <i class="icon asterisk"></i>
                    </div>
                </div>
            </div>
            <div class="field">
                <label>Captcha</label>
                <div class="ui left labeled icon input">
                    <input type="text" id="captcha">
                    <i class="lock icon"></i>
                    <div class="ui corner label">
                        <i class="icon asterisk"></i>
                    </div>
                 </div>
            </div>
            <p><img id=image src="/captcha/{{.CaptchaId}}.png" onclick="reload()" alt="Captcha image"></p>
            <input type=hidden name=captchaId value="{{.CaptchaId}}">
            <div class="ui error message" id="err">
                <div class="header"></div>
            </div>
            <a class="ui blue submit button" id="login" href="javascript:login();">Login</a>
        </div>
    </div>
</body>
</html>
