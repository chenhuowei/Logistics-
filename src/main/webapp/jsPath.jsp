<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 /**
        //从cookies中读取主题名称
        String easyuiThemeName = "metro";
        Cookie[] cookies = request.getCookies();
        if(cookies != null && cookies.length > 0){
            for(int i=0; i<cookies.length; i++){
            	 
            	if(cookies[i].getName().equals("easyuiThemeName")){
            		easyuiThemeName=cookies[i].getValue();
            		break; 
            		}
            	
            	}
            }
        */
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.green{
		color: #4CAF50
	}
	.yellow{
		color: #FF5722
	}
	.red{
		color: #F44336
	}
	.blue{
		color: #2196F3
	}
	.gray{
		color: #9E9E9E
	}
</style>
<script type="text/javascript">var basePath = '<%=basePath%>'</script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/util.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/datagrid-cellediting.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/valid.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>awesome/css/font-awesome.min.css">
</head>
</html>