<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>万威物流管理系统</title>
<%@ include file="/jsPath.jsp" %>
</head>
<body style="padding: 0px;margin: 0px;border: 0px">
	
	
<div id="container" 
style="width:100%;height:100%;position: absolute;padding: 0px;margin: 0px;border: 0px">

	<div id="menu" style="height:90%;width:66%;float:left;padding: 0px;margin: 0px;border: 0px">
		<img src="${pageContext.request.contextPath }/icon/logo.jpg" width="100%" height="100%;padding: 0px;margin: 0px;border: 0px"/> 
	</div>
	
	<div id="content" style="height:80%;width:34%;float:left;padding: 0px;margin: 0px;border: 0px">
	
	
			<div class="easyui-panel" data-options="border:false" style="width:450px;height:30%;"
			 >
			 <div style="margin-top: 20px;margin-left: 20px"></div>

				　　<h3>我们致力于快速、安全、准确地传递客户的信任</h3>
				
				　　<h3>我们致力于承担更多的社会责任</h3>
			</div>
	
	
		    <div class="easyui-tabs" data-options="border:false" style="width:450px;height:480px;margin-top:0px">
	        <div title="用户登录" data-options="iconCls:'fa fa-user fa-lg'" style="padding:10px">
		    <form id="login_form" method="post" action="${pageContext.request.contextPath }/base/login.do">
	        	<div style="margin-bottom:20px;margin-left: 10px;margin-top: 50px">
	        		<span>用户名</span><span id="us" style="color: red;font-size:large;">*</span><br/>
		           <input id="username" name="username" id="tt" class="easyui-textbox" 
		           style="width:60%;height:35px" data-options="
                    prompt: '输入账号',
                    iconWidth: 30,
                    iconAlign:'right',
                    icons: [{
                        iconCls:'fa fa-user fa-2x gray',
                   
                    }]
                    "/>
		        </div>
	        	<div style="margin-bottom:20px;margin-left: 10px">
	        		<span>密码</span><span id="ps" style="color: red;font-size:large;">*</span><br/>
		           <input id="password" name="password" id="tt" class="easyui-passwordbox" style="width:60%;height:35px" data-options="
                    iconWidth: 30,
                    iconAlign:'right',
                    icons: [{
                   
                    }]
                    "/>
		        </div>
		        
		        <div style="margin-bottom:10px;margin-left:10px">
		        	<strong style="margin-right: 20px">记住我:</strong>
		        	<input type="checkbox" id="rememberMe" name="rememberMe" value="true">
				</div>		       
		        
		        <div style="margin-left: 10px">
		            <a  class="easyui-linkbutton" iconCls="fa fa-sign-in fa-lg green" 
		            	onclick="login()" style="width:20%;height:32px">登录</a>
		            <a  class="easyui-linkbutton" iconCls="fa fa-registered fa-lg " 
		            	style="width:20%;height:32px">注册</a>
		            <a onclick="forget()" class="" iconCls="icon-ok" style="width:20%;height:32px">忘记密码?</a>
		        </div>
	        </form>
	        </div>
	        <div title="快捷查单" data-options="iconCls:'fa fa-search fa-lg'" style="padding:10px">
	        	        <div style="margin-bottom:20px;margin-top: 20px">
				            <input id="search_order_input" class="easyui-textbox" style="width:60%;height:32px" data-options="
				                    prompt: '运单号:',
				                    iconAlign:'right',
				                    iconWidth: 30,
				                    icons:[{
				                         iconCls:'fa fa-search fa-2x',
				                        handler: function(e){
				                        search_orderTrack();
				                        }
				                    }]
				                    ">
				        </div>
				        <div id="msg"></div>
	        </div>
	        	<div title="创建运单" data-options="iconCls:'fa fa-question fa-lg'" style="padding:10px">
	        	<a href="${pageContext.request.contextPath }/orderForm/create.do">创建运单</a>
	        
	        </div>
    </div>
	
	
	</div>
	
	<div id="footer" style="height:10%;clear:both;text-align:center;padding: 0px;margin-left: 5%;border: 0px">
		<div class="easyui-panel" data-options="region:'south',border:false,collapsible:true,"
	 style="padding:10px;">
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-copyright fa-lg'" 
	    style="width:">万威物流有限公司</a>
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-copyright fa-lg'" 
	    style="width:">www.manway.com</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-address-card fa-lg'" 
	    style="width:">广东省信宜市</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-phone fa-lg'" 
	    style="width:">13068501300</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-envelope fa-lg'" 
	    style="width:">fireway@outlook.com</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-handshake-o fa-lg'" 
	    style="width:">合作</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-info-circle fa-lg'" 
	    style="width:">关于</a>
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-question-circle fa-lg'" 
	    style="width:">帮助</a>
	
	</div>

	</div>

</div>
<script type="text/javascript">

function search_orderTrack(){
	var val = $('#search_order_input').val();
	if (val != ''){
		$.ajax({
			url:basePath+'orderTrack/findByOrderFormId.do',
			method:'get',
			async:false,
			data:{'orderFormId':val},
			success:function(datas){
				var data = datas.orderTrack;
				var orderForm = datas.orderForm;
				if (data.length == 0 || orderForm == null){
					centerMsg('不存在此订单，请确认订单号是否正确');
					return;
				}
				$('#msg').empty();
				for(var i=0;i<data.length;i++){
					$('#msg').append('<p class="red">更新时间：'+data[i].orderUpdateTime+
							'-操作人：'+data[i].operator+ '</p>');
					$('#msg').append('<p>'+data[i].location+'(<span class="red">'+
							data[i].operatorType+'</span>)'+'</p>');
					if(data[i].trackState){
						$('#msg').append('<p>下一站：'+data[i].destination+
							'</p>');
					}else{
						$('#msg').append('<p>'
							+'-签收人：'+orderForm.recipientsName+'</p>');
					}
					
				}
			}
			
		});
	}
}



$(function(){
	var m = '${LOGIN_STATE}';	
	if (null != m && m != ''){
		//centerMsg(m);	
	}
	//调用函数  
	var cookie_username = getCookie("username");  
	var cookie_password = getCookie("password"); 
	
	$('#username').val(cookie_username);
	$('#password').val(cookie_password);
	
	var u = $('#username').val();
	var p = $('#password').val();
	if (u != ''){
		$('#rememberMe').attr('checked',true);
	}
	
	
	
});
var user = $('#username');
var pass = $('#password');
function login(){
	if (user.val() == ''){
		$('#us').empty();
		$('#us').append('-请填写用户名!');
	}else if (pass.val() == ''){
		$('#us').empty();
		$('#us').append('-请填写密码!');
	}else{
		$('#us').empty();
		$('#ps').empty();
		$('#login_form').submit();
	}
	
}


//get cookies
var allcookies = document.cookie;    
//定义一个函数，用来读取特定的cookie值。  

function getCookie(cookie_name)  

	{  
	 
	var allcookies = document.cookie;  
	 
	var cookie_pos = allcookies.indexOf(cookie_name);   //索引的长度  
	 
	  
	 
	//如果找到了索引，就代表cookie存在，  
	 
	//反之，就说明不存在。  
	 
	if (cookie_pos != -1)  
	 
	{  
	 
	//把cookie_pos放在值的开始，只要给值加1即可。  
	 
	cookie_pos += cookie_name.length + 1;      //这里我自己试过，容易出问题，所以请大家参考的时候自己好好研究一下。。。  
	 
	var cookie_end = allcookies.indexOf(";", cookie_pos);  
	 
	  
	 
	if (cookie_end == -1)  
	 
	{  
	 
	cookie_end = allcookies.length;  
	 
	}  
	 
	  
	 
	var value = unescape(allcookies.substring(cookie_pos, cookie_end)); //这里就可以得到你想要的cookie的值了。。。  
	 
	}  
	 
	  
	 
	return value;  
	 
	}  

function forget(){
	centerMsg('请带身份证和工作证到209办理...');
}




</script>	
</body>
</html>