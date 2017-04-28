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
<title>学说话</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap-theme.min.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/jarvis.js"></script>
<style type="text/css">
	.comment {position: relative; line-height:26px;color:#FFFFFF; background: #5DAFE6; border-radius: 5px; padding:5px; float:right; }
	.commentRobot {position: relative; line-height:26px; background: #EDB157; border-radius: 5px; padding:5px; float:left; }
	
	.comment:after {content: '';width: 0; height: 0;position: absolute;top: 5px;right: -16px;border: solid 8px;
	  border-color: transparent transparent transparent #5DAFE6;
	  font-size: 0;
	}
	.commentRobot:after {content:'';width: 0; height: 0;position: absolute;top: 5px;left: -16px;border: solid 8px;
	  border-color: transparent #EDB157 transparent transparent;
	  font-size: 0;
	}
	.talkp{float:right;margin-top:16px;width:680px;padding:3px 10px;}
	.talkr{float:left;margin-top:16px;width:680px;padding:3px 10px;}
	.wordp{float: left;width:91%;}
	.wordr{float: right;width:91%;}
	.headPhoto{position: relative;float:right;margin-left:10px;margin-top:-8px;} 
	.headPhotoRobot{position: relative;float:left;margin-right:10px;margin-top:-8px;} 
	#containerMain{margin:20px auto;width:700px;}
	.panel-body{height:500px; overflow-x: hidden; overflow-y: auto; }
	#msgBox{width:300px;height:150px;text-align: center;line-height: 150px;font-size:15px;position:relative;}
	#teach{margin-top:200px;margin-left:105px;position:absolute;}
</style>
<script type="text/javascript">
	$(function(){
		$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">我喜欢学说话,请先说问题再说答案。</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
		var count=1;
		var question=null;
		var answer=null;
		$('#teachBtn').click(function(){
			var teachWords=$('#teachWords').val();
			if ($.trim(teachWords).length==0) {
				$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">什么也不说就别点好吗-_-..</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
				count=1;
			}else{
				if (count%2!=0) {
					question=teachWords;
					$('.panel-body').append('<div class="talkp"><div class="wordp"><div class="comment">'+question+'</div></div><img class="headPhoto" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/headPic.png"/></div>');
					$('#teachWords').val('');
				}else{
					answer=teachWords;
					$('.panel-body').append('<div class="talkp"><div class="wordp"><div class="comment">'+answer+'</div></div><img class="headPhoto" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/headPic.png"/></div>');
					$('#teachWords').val('');
					$.ajax({
						url:'<%=basePath %>/jarvis/add',
						type:'post',
						data:{'question':question,'answer':answer},
						dataType:'json',
						error:function(){
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">芯片温度过高，请稍后再试……</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');						
						},
						success:function(data){
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">'+data.word+'</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');						
						}
					});
				}
				count = count + 1;
			}
		});
	});	
	function go() {
		if (event.keyCode == 13) {
			$("#teachBtn").click();
		}
	}
</script>
</head>
<body style="background:url(<%=basePath %>static/images/robotBkg.png) no-repeat;" onkeypress="go()">
	
	<a href="<%=basePath %>goto/toTalk">
		<button id="teach" type="button" class="btn btn-primary">返回</button>
	</a>
	
	<div id="containerMain">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<img title="robot" alt="robot" align="absmiddle" src="<%=basePath %>static/images/robot.png"/>
					<font size="5" color="#00B2EE">教Jarvis说话</font>
				</h3>
			</div>
			<div class="panel-body">
			</div>
			<div class="col-lg-15">
				<div class="input-group input-group-lg">
					<input id="teachWords" type="text" class="form-control" placeholder="请输入……">
					<span class="input-group-btn">
						<button id="teachBtn" class="btn btn-default" type="button">发送</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>