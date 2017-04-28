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
        <title>progress</title>
       	<script type="text/javascript" src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/bootstrap.js"></script>
        <style type="text/css">
            body{
                margin: 0;
            }
            #progress{
                height: 10px;
                background: #b91f1f;

　　　　　　/*定义动画完成时进度条的消失500ms内完成，而不是直接消失*/
                transition: opacity 500ms linear;
            }
            #progress{

　　　　　　/*调用下面定义的progress动画，规定动画3s内完成*/ 
                -webkit-animation: progress 3s;
                animation: progress 3s;
            }
            #progress.done{
                opacity: 0;
            }
            @-webkit-keyframes progress{
                0%{
                    width: 0px;
                }
                100%{
                    width: 100%;
                }
            }
            @keyframes progress{
                0%{
                    width: 0px;
                }
                100%{
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div id="progress">

        </div>
        <script type="text/javascript">
            $( {property : 0} ).animate( {property : 100}, {
                duration : 3000,
                step :  function(){
                    var percentage = Math.round( this.property );
                    $( "#progress" ).css( "width", percentage + "%" );
                    if( percentage == 100 ){
                        $( "#progress" ).addClass( "done" );
                    }
                }
            } );
        </script>
    </body>
</html>