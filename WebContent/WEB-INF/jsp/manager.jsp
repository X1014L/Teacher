<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="luxun" uri="http://luxun.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 用户列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">用户信息管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/manager/list.action">
			    <div class="form-group">
					<label for="id">编号</label> 
					 <input type="text" class="form-control" id="id" 
					                   value="${id}" name="id" />
				</div>
				<div class="form-group">
					<label for="username">姓名</label> 
					 <input type="text" class="form-control" id="username" 
					                   value="${username}" name="username" />
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newManagerDialog" onclick="clearManager()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">用户信息列表</div>
				<!-- 用户信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>姓名</th>
							<th>密码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.username}</td>
								<td>${row.password}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#managerEditDialog" onclick= "editManager(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteManager(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<luxun:page url="${pageContext.request.contextPath }/manager/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建用户模态框 -->
<div class="modal fade" id="newManagerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_manager_form">
					<div class="form-group">
						<label for="new_username" class="col-sm-2 control-label">
						   姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_username" placeholder="姓名" name="username"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_password" style="float:left;padding:7px 15px 0 27px;">密码</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_password" placeholder="密码" name="password"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createManager()">创建用户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改用户模态框 -->
<div class="modal fade" id="managerEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_manager_form">
					<input type="hidden" id="_id" name="id"/>
					<div class="form-group">
						<label for="edit_username" class="col-sm-2 control-label">
						   姓名
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_username" placeholder="姓名" name="username"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password" style="float:left;padding:7px 15px 0 27px;">密码</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password" placeholder="密码" name="password"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateManager()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建用户窗口中的数据
	function clearManager() {
	    $("#new_username").val("");
	    $("#new_password").val("")
	}
	//创建用户
	function createManager(){
		$.post("<%=basePath%>manager/create.action",
		$("#new_manager_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("用户创建成功！");
	            window.location.reload();
	        }else{
	            alert("用户创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的用户信息
	function editManager(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>manager/getManagerById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id); 
	            $("#edit_username").val(data.username);
	            $("#edit_password").val(data.password);
	        }
	    });
	}
	// 执行修改用户操作
	function updateManager() {
		$.post("<%=basePath%>manager/update.action",$("#edit_manager_form").serialize(),function(data){
			if(data =="OK"){
				alert("用户信息更新成功！");
				window.location.reload();
			}else{
				alert("用户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除用户
	function deleteManager(id) {
	    if(confirm('确实要删除该用户吗?')) {
	$.post("<%=basePath%>manager/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("用户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除用户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>