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
<link rel="shortcut icon" href="<%=basePath%>static/images/webicon.ico" type="image/x-icon" />

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
	.panel-body{height:500px; overflow-x:hidden; overflow-y:scroll;overflow-y:visible;}
	#msgBox{width:300px;height:150px;text-align: center;line-height: 150px;font-size:15px;position:relative;}
	#teach{margin-top:220px;margin-left:35px;position:absolute;}
</style>
<script type="text/javascript">
	$(function(){
		$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">你好，${user.name}  !好久不见</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
		$("#goBtn").click(function(){
			
			var div = document.getElementById('divTalk');
			div.scrollTop = div.scrollHeight;
			
			var textContent=$('#textSc').val();
			if ($.trim(textContent).length!=0) {
				$('.panel-body').append('<div class="talkp"><div class="wordp"><div class="comment">'+textContent+'</div></div><img class="headPhoto" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/headPic.png"/></div>');
				$('#textSc').val('');
				$.ajax({
					url:'<%=basePath %>jarvis/answer',
					type:'post',
					data:{"question":textContent},
					dataType:'json',
					error:function(){
						$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">Sorry,主脑不在线</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
					},
					success:function(data){
						if ($.trim(data.word).length==0) {
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">Sorry,主脑不在线</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
						}else{
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">'+data.word+'</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
						}
					}
					
				});
			}else{
				$('.panel-body').append('<div class="talkp"><div class="wordp"><div class="comment">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></div><img class="headPhoto" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/headPic.png"/></div>');
				$('#textSc').val('');
				$.ajax({
					url:'<%=basePath %>jarvis/answer',
					type:'post',
					data:{"question":textContent},
					dataType:'json',
					error:function(){
						$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">Sorry,主脑不在线</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
					},
					success:function(data){
						if ($.trim(data.word).length==0) {
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">Sorry,主脑不在线</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
						}else{
							$('.panel-body').append('<div class="talkr"><div class="wordr"><div class="commentRobot">'+data.word+'</div></div><img class="headPhotoRobot" title="头像" alt="头像" align="absmiddle" src="<%=basePath %>static/images/robot.png"/></div>');
						}
					}
					
				});
			}
		});
		
		
	});	
	function go() {
		if (event.keyCode == 13) {
			$("#goBtn").click();
		}
	}
	
	function delcfm() {
		$('#delcfmModel').modal();
	}
	function urlSubmit() {
		var url = $.trim($("#exitUrl").val());// 获取会话中的隐藏属性URL
		console.log('test');
		console.log(url);
		window.location.href = url;
	}
</script>
</head>
<body style="background:url(<%=basePath %>static/images/robotBkg.png) no-repeat;" onkeypress="go()">
	<a onclick="delcfm()" href="javascript:void(0);">退出</a>
	<a href="<%=basePath %>goto/toLearn">
		<button id="teach" type="button" class="btn btn-primary">教Jarvis说话</button>
	</a>
	
	<div id="containerMain">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<img title="robot" alt="robot" align="absmiddle" src="<%=basePath %>static/images/robot.png"/>
					<font size="5" color="#00B2EE">Jarvis</font>
				</h3>
			</div>
			<div id="divTalk" class="panel-body"></div>
			<div class="col-lg-15">
				<div class="input-group input-group-lg">
					<input id="textSc" type="text" class="form-control" placeholder="请输入……">
					<span class="input-group-btn">
						<button id="goBtn" class="btn btn-default" type="button">发送</button>
					</span>
				</div>
			</div>
		</div>
	</div>
<!-- 信息删除确认 -->  
<div class="modal fade" id="delcfmModel">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">提示信息</h4>  
      </div>  
      <div class="modal-body">
        <p>确定不再聊会儿了？</p>  
      </div>
      <div class="modal-footer">  
      	<input value="<%=basePath %>jarvis/user/exit" id="exitUrl" type="hidden"/>
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <a onclick="urlSubmit()" class="btn btn-primary" data-dismiss="modal">确定</a>  
      </div>  
    </div><!-- /.modal-content -->  
  </div><!-- /.modal-dialog -->  
</div><!-- /.modal --> 
</body>
</html>