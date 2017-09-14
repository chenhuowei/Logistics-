<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>万威物流管理系统</title>
<%@ include file="/jsPath.jsp" %>
<%@ include file="top.jsp" %>
<%@ include file="left.jsp" %>
<%@ include file="bottom.jsp" %>
</head>
<body class="easyui-layout" data-options="fit:true">
	
	
	
	<div id="home_center_tab" class="easyui-tabs" data-options="region:'center',fit:true,tools:'#tabbar'," 
	style="width:100%">
		<div title="首页" data-options="iconCls:'fa fa-home fa-lg green'">
			<p align="center">欢迎使用万威物流管理系统，我们致力让管理更方便，快捷，高效</p>
		</div>
		
	</div>
	<div id="tabbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
	</div>
	<div id="tabsMenu" class="easyui-menu" style="width:120px;">  
	    <div name="close">关闭</div>  
	    <div name="Other">关闭其他</div>  
	    <div name="All">关闭所有</div>
    </div>  
	
	<script type="text/javascript">
	$(function(){
		bottomRightMsg('${LOGIN_STATE}');
	})
	//绑定tabs的右键菜单
    $("#home_center_tab").tabs({
        onContextMenu : function (e, title) {
            e.preventDefault();
            $('#tabsMenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            }).data("tabTitle", title);
        }
    });
    
    //实例化menu的onClick事件
    $("#tabsMenu").menu({
        onClick : function (item) {
            CloseTab(this, item.name);
        }
    });
    
    //几个关闭事件的实现
    function CloseTab(menu, type) {
        var curTabTitle = $(menu).data("tabTitle");
        var tabs = $("#home_center_tab");
        
        if (type === "close") {
            tabs.tabs("close", curTabTitle);
            return;
        }
        
        var allTabs = tabs.tabs("tabs");
        var closeTabsTitle = [];
        
        $.each(allTabs, function () {
            var opt = $(this).panel("options");
            if (opt.closable && opt.title != curTabTitle && type === "Other") {
                closeTabsTitle.push(opt.title);
            } else if (opt.closable && type === "All") {
                closeTabsTitle.push(opt.title);
            }
        });
        
        for (var i = 0; i < closeTabsTitle.length; i++) {
            tabs.tabs("close", closeTabsTitle[i]);
        }
    }
	
    
    //在home_center区域打开菜单，新增tab
    function OpenTab(text,url,icon) {
        if ($("#home_center_tab").tabs('exists', text)) {
            $('#home_center_tab').tabs('select', text);
        } else {
            $('#home_center_tab').tabs('add', {
                title : text,
                closable : true,
                href:basePath+url,
                iconCls : icon,
               
            });
        }
    }
    
	function CloseTab(){
		var curr_tab = $('#home_center_tab').tabs('getSelected');
		var index = $('#home_center_tab').tabs('getTabIndex',curr_tab);
		$('#home_center_tab').tabs('close',index);
	}
    
    
	
	</script>
	
</body>
</html>