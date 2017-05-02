<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>robot</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap-theme.min.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/bootstrap.js"></script>
<style type="text/css">
	.promptbox{
	    position: fixed;
	    bottom: 30px;
	    left: 0px;
	    padding: 3px 18px;
	    box-shadow: 1px 1px 3px #b0b0b0;
	    z-index: 99;
	    display: none
	}
 	.prompt-label{ 
 	    display: inline-block;
 	    width: 5px; 
 	    height: 100%; 
	    position: absolute; 
 	    left: 0px; 
 	    bottom:0px 
	} 
	.prompt-word{
	    font-size: 13px;
	    color: #fff;
	    font-weight: 600;
	}
	.promptbox.normal{
	    background: #3A9BD9
	}
	.promptbox.normal .prompt-label{
	    background: #3e92c8
	}
	.promptbox.success{
	    background: #95BA12
	}
	.promptbox.success .prompt-label{
	    background: #8cac1a
	}
	.promptbox.warning{
	    background: #FF9101
	}
	.promptbox.warning .prompt-label{
	    background: #E68300
	}
	.promptbox.error{
	    background: #E74C3C
	}
	.promptbox.error .prompt-label{
	    background: #d34c3e
	}
</style>
<style type="text/css">
	#containerMain{width:420px;height:450px;margin:auto;margin-top:100px;}
	.panel-title{text-align:center;font-size:23px;}
	.form-control{width:360px;height:45px;margin:auto; margin-top:10px;}
	#btnLogin{width:360px;height:45px;font-size:20px;margin-left:15px;margin-top:15px;}
	span{margin-left:15px;}
</style>
<script type="text/javascript">
	function prompt(promptWord, promptStatus) {
	    if (promptStatus === "undefined") {
	        promptStatus = 'normal';
	    } else if (promptStatus == "success") {
	        promptStatus = 'success';
	    } else if (promptStatus == "warning") {
	        promptStatus = 'warning';
	    } else if (promptStatus == "error") {
	        promptStatus = 'error';
	    } else {
	        promptStatus = 'normal';
	    }
	    $('<div class="promptbox ' +promptStatus + '"><span class="prompt-label"></span><span class="prompt-word">' + promptWord + '</span></div>')
	        .appendTo('body')
	        .animate({ bottom: '+=15', opacity: "show" }, 700);
	
	    for (i = 1; i < $('.promptbox').length; i++) {
	        $('.promptbox').eq(i - 1).finish().animate({ 'bottom': '+=30' });
	    }
	
	    setTimeout(function () {
	        $('.promptbox:eq(0)').remove();
	    }, 3000);
	}

	$(function() {
		$('#btnLogin').click(function(){
			prompt('prompt提示框测试','normal');
			var flag = true;
			var username=$('#username').val();
			var password=$('#password').val();
			if ($.trim(username).length==0) {
				$('#name_tip').html('<font color="red">用户名不能为空</font>');
				flag=false;
			}
			if ($.trim(password).length==0) {
				$('#password_tip').html('<font color="red">密码不能为空</font>');
				flag=false;
			}
			
			if (flag) {
				$.ajax({
					url:'<%=basePath %>jarvis/user/login',
					type:'post',
					data:{'name':username,'password':password},
					dataType:'json',
					error:function(){prompt('连接出错','error');},
					success:function(data){
						switch (data.code) {
						case 0:
							$('#name_tip').html('<font color="red">'+data.message+'</font>');
						    $('#username').focus();
							break;
						case 1:
							$('#password').val('');
							$('#password_tip').html('<font color="red">'+data.message+'</font>');
							$('#password').focus();
							break;
						case 2:
							location.href='<%=basePath%>goto/toTalk';
							break;
						}						
					}
				});
			}
		});
	});

	function ckeckNull(){
		var username=$('#username').val();
		var password=$('#password').val();
		if ($.trim(username).length!=0) {
			$('#name_tip').html('&nbsp;');
		}
		if ($.trim(password).length!=0) {
			$('#password_tip').html('&nbsp;');
		}
		
	}
	
	function go() {
		if (event.keyCode == 13) {
			$("#btnLogin").click();
		}
	}
</script>
</head>
<body
	style="background:url(<%=basePath%>static/images/robotBkg.png) no-repeat;"
	onkeypress="go()">
	<div id="containerMain">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">用户登录</h3>
			</div>
			<div class="panel-body" oninput="ckeckNull()">
				<input id="username" type="text" class="form-control" placeholder="用户名"><br/>
				<span id="name_tip">&nbsp;</span>
				<input id="password" type="password" class="form-control" placeholder="密码"><br/>
				<span id="password_tip">&nbsp;</span>
				<button id="btnLogin" type="button" class="btn btn-primary">登&nbsp;&nbsp;录</button>
			</div>
		</div>
	</div>
</body>
</html>