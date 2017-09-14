<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
   		.topbg{
			background-color: #4CAF50  		
   		}
   		sup{
			color: red  		
   		}
   	.whiteFont{
   		color:white;
   	}
   </style>
<div data-options="region:'north',border:false" class="topbg" style="height:70px;padding:10px">
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:false" class="topbg" style="width:30%;height:70px;padding:10px">
			<i class="fa fa-truck fa-2x whiteFont"></i><a class="whiteFont" style="font-size: x-large;">万威物流管理系统</a>
			
	</div>
	<div data-options="region:'center',border:false" class="topbg" style="height:70px;padding:10px">
		<div data-options="border:false" class="easyui-panel topbg" style="">
			
		</div>	
	</div>
	<div data-options="region:'east',border:false" class="topbg" style="width:50%;height:70px;padding:10px">
		<div data-options="border:false" class="easyui-panel topbg" style="">
			<a href="#" class="easyui-linkbutton whiteFont" data-options="iconCls:'fa fa-home fa-lg',plain:true">Home</a>
			<a href="#" class="easyui-menubutton whiteFont" data-options="menu:'#tasks',iconCls:'fa fa-tasks fa-lg'">任务<sup id="task"></sup></a>
			<a href="#" class="easyui-menubutton whiteFont" data-options="menu:'#message',iconCls:'fa  fa-envelope fa-lg'">信息<sup>2</sup></a>
			<a href="#" class="easyui-menubutton whiteFont" data-options="menu:'#user',iconCls:'fa fa-user-circle-o fa-lg'">用户</a>
			<a href="#" class="easyui-menubutton whiteFont" data-options="menu:'#setting',iconCls:'fa fa-cog fa-lg'">设置</a>
			
		</div>	
	</div>
</div>
	
	<div id="tasks" style="width:150px;">
		<div data-options="iconCls:'fa fa-flag'">任务一</div>
		<div  class="easyui-progressbar"  data-options="value:60," 
			style="width:150px;">
		</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'fa fa-flag '">任务二</div>
		<div  class="easyui-progressbar"  data-options="value:20," 
			style="width:150px;">
		</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'fa fa-flag'">任务三</div>
		<div  class="easyui-progressbar"  data-options="value:90," 
			style="width:150px;">
		</div>
		<div class="menu-sep"></div>
	</div>
	
	<div id="message" style="width:150px;">
		<div class="red" data-options="iconCls:'fa fa-envelope-o fa-lg' ">未读消息</div>
		<div class="green" data-options="iconCls:'fa fa-envelope-open-o fa-lg'">已读消息</div>
		
	</div>
	
	<div id="setting" style="width:150px;">
		<div class="green" data-options="iconCls:'fa fa-briefcase fa-lg'">
			<span >主题皮肤</span>
			<div>
				<div onclick="changeTheme('material')">material</div>
				<div onclick="changeTheme('bootstrap')">bootstrap</div>
				<div onclick="changeTheme('metro')">metro</div>
				<div onclick="changeTheme('default')">classic</div>
			</div>
		</div>
		<div class="menu-sep"></div>
		<div class="green" data-options="iconCls:'fa fa-briefcase fa-lg'">
			<span >菜单样式</span>
			<div>
				<div>侧栏菜单</div>
				<div>工具栏菜单</div>
				<div>按钮菜单</div>
			</div>
		</div>
	
	</div>
	
	<div id="user" style="width:150px;">
		<div class="green" data-options="iconCls:'fa fa-user fa-lg'">
			<span >个人中心</span>
			<div>
				<div onclick="OpenTab('个人信息','user/personnalPage.do','fa fa-user fa-lg')">个人信息</div>
				<div onclick="OpenTab('密码修改','user/passwordPage.do','fa fa-user fa-lg')">密码修改</div>
				<div>权限请求</div>
			</div>
		</div>
		<div onclick="javascript:window.location.href = '${pageContext.request.contextPath}/base/logout.do'" 
		class="red"  data-options="iconCls:'fa fa-sign-out fa-lg'">退出账号</div>
		
	</div>
	
	<script type="text/javascript">
	function updateTask(){
			$.ajax({
				url:'${pageContext.request.contextPath}/orderForm/countYunOrder.do',
				dataType:'json',
				success:function(data){
					$('#task').html(data.taskCount);
				}
			})
			
		}
			setInterval(updateTask,3000);
	
	</script>
	
	
	
</div>
