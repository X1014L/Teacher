<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="luxun" uri="http://luxun.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息管理-BootCRM</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>teacher/list.action">教师信息管理系统
					</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 邮件通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>张经理</strong> <span class="pull-right text-muted">
										<em>昨天</em>
									</span>
								</div>
								<div>今天晚上开会，讨论一下下个月工作的事...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 邮件通知 end -->
				<!-- 任务通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">完成40%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">完成20%</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 任务通知 end -->
				<!-- 消息通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> 新回复 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> 新消息 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> 新任务 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
								<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<!-- 消息通知 end -->
				<!-- 用户信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
								用户：${USER_SESSION.username} </a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
			<!-- 左侧显示列表部分 start-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="查询内容...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
									</button>
								</span>
							</div>
						</li>
						<li>
						    <a href="${pageContext.request.contextPath }/teacher/list.action" class="active">
						    <i class="fa fa-edit fa-fw"></i> 教师管理
						</a></li>
						<li>
						    <a href="${pageContext.request.contextPath }/classes/list.action" class="active"> 
						    <i class="fa fa-dashboard fa-fw"></i>
								课程信息管理  
						</a></li>
						<li>
						    <a href="${pageContext.request.contextPath }/notice/list.action" class="active">
						    <i class="fa fa-dashboard fa-fw"></i>
								公告管理
						</a></li>
						<li>
						    <a href="${pageContext.request.contextPath }/reward/list.action" class="active">
						    <i class="fa fa-dashboard fa-fw"></i>
								奖惩信息管理
						</a></li>
						<li>
						    <a href="${pageContext.request.contextPath }/message/list.action" class="active">
						    <i class="fa fa-dashboard fa-fw"></i>
								留言信息管理
						</a></li>
					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end-->
		</nav>
		<c:if test="${func == 'teacher'}">
			<!-- 教师列表查询部分  start-->
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">教师管理</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				 <div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline" method="get"
							action="${pageContext.request.contextPath }/teacher/list.action">
							<div class="form-group">
								<label for="username">用户名<label> <input type="text"
									class="form-control" id="username" value="${username}"
									name="userName" />
							</div>
							<div class="form-group">
								<label for="teacherid">教师编号</label> <input type="text"
									class="form-control" id="teacherid" value="${teacherid}"
									name="teacherId">
							</div>
							
							<div class="form-group">
								<label for="work">就职单位</label> <input type="text" 
									class="form-control" id="work" value="${work}"
									 name="work">
							</div>
							<button type="submit" class="btn btn-primary">查询</button>
						</form>
					</div>
				</div>
				<a href="#" class="btn btn-primary" data-toggle="modal"
					data-target="#newTeacherDialog" onclick="clearTeacher()">新建</a>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">教师信息列表</div>
							<!-- 教师信息列表 -->
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>用户名</th>
										<th>性别</th>
										<th>教师编号</th>
										<th>密码</th>
										<th>名族</th>
										<th>用户角色</th>
										<th>出生年月</th>
										<th>创建时间</th>
										<th>就职单位</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.rows}" var="row">
										<tr>
											<td>${row.id}</td>
											<td>${row.username}</td>
											<td>${row.sex}</td>
											<td>${row.teacherid}</td>
											<td>${row.password}</td>
											<td>${row.country}</td>
											<td>${row.role}</td>
											<td>${row.birthday}</td>
											<td>${row.createtime}</td>
											<td>${row.work}</td>
											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#teacherEditDialog"
												onclick="editTeacher(${row.id})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteTeacher(${row.id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<luxun:page
									url="${pageContext.request.contextPath }/teacher/list.action" />
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
			<!-- 客户列表查询部分  end-->
		</c:if>>
		<c:if test="${func == 'reward'}">
			<jsp:include page="reward.jsp" flush="true" />
		</c:if>>
		<c:if test="${func == 'classes'}">
			<jsp:include page="classes.jsp" flush="true" />
		</c:if>>
		<c:if test="${func == 'message'}">
			<jsp:include page="message.jsp" flush="true" />
		</c:if>>
		<c:if test="${func == 'notice'}">
			<jsp:include page="notice.jsp" flush="true" />
		</c:if>>
		<c:if test="${func == 'manager'}">
			<jsp:include page="manager.jsp" flush="true" />
		</c:if>>
	</div>
	<!-- 创建客户模态框 -->
	<div class="modal fade" id="newTeacherDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建教师信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_teacher_form">
						<div class="form-group">
							<label for="new_username" class="col-sm-2 control-label">
								用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_username"
									placeholder="用户名" name="username" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_sex"
								style="float: left; padding: 7px 15px 0 27px;">性别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_sex"
									placeholder="性别" name="sex" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_teacherId"
								style="float: left; padding: 7px 15px 0 27px;">教师编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_teacherId"
									placeholder="教师编号" name="teacherid" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_password"
								style="float: left; padding: 7px 15px 0 27px;">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_password"
									placeholder="密码" name="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_country" class="col-sm-2 control-label">名族</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_country"
									placeholder="名族" name="country" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_role" class="col-sm-2 control-label">用户角色</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_role"
									placeholder="用户角色" name="role" />
									<select	class="form-control" id="studentSex" name="stuSex">
						<option value="">--请选择--</option>
						<option value="0" <c:if test="${stuSex == '1'}"> selected</c:if>>管理员</option>
						<option value="1" <c:if test="${stuSex == '0'}"> selected</c:if>>教师</option>
					</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_birthday" class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_birthday"
									placeholder="出生年月" name="birthday" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_createtime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_createtime"
									placeholder="创建时间" name="createtime" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_work" class="col-sm-2 control-label">就职单位</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_work"
									placeholder="就职单位" name="work" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createTeacher()">创建教师信息</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改教师模态框 -->
	<div class="modal fade" id="teacherEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改教师信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_teacher_form">
						<input type="hidden" id="edit_id" name="id" />
						<div class="form-group">
							<label for="edit_username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_username"
									placeholder="用户名" name="username" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_sex"
								style="float: left; padding: 7px 15px 0 27px;">性别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_sex"
									placeholder="性别" name="sex" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_teacherid"
								style="float: left; padding: 7px 15px 0 27px;">教师编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_teacherid"
									placeholder="教师编号" name="teacherid" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_password"
								style="float: left; padding: 7px 15px 0 27px;">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_password"
									placeholder="密码" name="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_country" class="col-sm-2 control-label">名族</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_country"
									placeholder="名族" name="country" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_role" class="col-sm-2 control-label">用户角色</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_role"
									placeholder="用户角色" name="role" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_birthday" class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_birthday"
									placeholder="出生年月" name="birthday" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_createtime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_createtime"
									placeholder="创建时间" name="createtime" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_work" class="col-sm-2 control-label">就职单位</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_work"
									placeholder="就职单位" name="work" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateTeacher()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
//清空新建教师窗口中的数据
	function clearTeacher() {
	    $("#new_username").val("");
	    $("#new_sex").val("")
	    $("#new_teacherid").val("")
	    $("#new_password").val("")
	    $("#new_country").val("");
	    $("#new_role").val("");
	    $("#new_birthday").val("");
	    $("#new_createtime").val("");
	    $("#new_work").val("");
	}
	// 创建客户
	function createTeacher() {
	$.post("<%=basePath%>teacher/create.action",
	$("#new_teacher_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("教师创建成功！");
	            window.location.reload();
	        }else{
	            alert("教师创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的教师信息
	function editTeacher(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>teacher/getTeacherById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_username").val(data.username);
	            $("#edit_sex").val(data.sex);
	            $("#edit_teacherid").val(data.teacherid)
	            $("#edit_password").val(data.password)
	            $("#edit_country").val(data.country)
	            $("#edit_role").val(data.role);
	            $("#edit_birthday").val(data.birthday);
	            $("#edit_createtime").val(data.createtime);
	            $("#edit_work").val(data.work);
	        }
	    });
	}	
    // 执行修改教师操作
	function updateTeacher() {
		$.post("<%=basePath%>teacher/update.action",$("#edit_teacher_form").serialize(),function(data){
			if(data =="OK"){
				alert("教师信息更新成功！");
				window.location.reload();
			}else{
				alert("教师信息更新失败！");
				window.location.reload();
			}
		});
	}    
	// 删除教师
	function deleteTeacher(id) {
	    if(confirm('确实要删除该教师吗?')) {
	$.post("<%=basePath%>teacher/delete.action",{"id":id},
			function(data){
	            if(data =="OK"){
	                alert("教师删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除教师失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>