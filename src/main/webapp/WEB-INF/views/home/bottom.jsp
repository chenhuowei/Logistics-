<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="easyui-panel"  data-options="region:'south',border:false,collapsible:true,title:''"
	 style="height:50px;background-color:#4CAF50;padding:10px;">
	 	<div style="margin-left:30%">
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-user fa-lg'" 
	    style="width:">${USER.name }</a>
	   
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-tag fa-lg'" 
	    style="width:">${USER.employeeNumber }</a>
	   
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-id-card fa-lg'" 
	    style="width:">${JOB.name }</a>
	    
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-mobile fa-lg'" 
	    style="width:">${USER.mobile }</a>
	    
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-copyright fa-lg'" 
	    style="width:">${COMPANY.name }</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-map-pin fa-lg'" 
	    style="width:">${COMPANY.address }</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-handshake-o fa-lg'" 
	    style="width:">合作</a>
	
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-info-circle fa-lg'" 
	    style="width:">关于</a>
	    <a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-question-circle fa-lg'" 
	    style="width:">帮助</a>
	</div>
	
	
	
	
	</div>


</body>
</html>