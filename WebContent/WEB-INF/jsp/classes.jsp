<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="luxun" uri="http://luxun.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 课程列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">课程管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/classes/list.action">
			    <div class="form-group">
					<label for="userid">教师ID</label> 
					 <input type="text" class="form-control" id="userid" 
					                   value="${userid}" name="userid" />
				</div>
				<div class="form-group">
					<label for="place">地点</label> 
					 <input type="text" class="form-control" id="place" 
					                   value="${place}" name="place" />
				</div>
				<div class="form-group">
					<label for="classname">课程名</label>  
					 <input type="text" class="form-control" id="classname" 
					                   value="${classname}" name="classname" />
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newClassesDialog" onclick="clearClasses()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">课程信息列表</div>
				<!-- 课程信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>地点</th>
							<th>课程名</th>
							<th>时间</th>
							<th>星期几</th>
							<th>教师ID</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.place}</td>
								<td>${row.classname}</td>
								<td>${row.time}</td>
								<td>${row.day}</td>
								<td>${row.userid}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#classesEditDialog" onclick= "editClasses(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteClasses(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<luxun:page url="${pageContext.request.contextPath }/classes/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建课程模态框 -->
<div class="modal fade" id="newClassesDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建课程信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_classes_form">
				    <div class="form-group">
						<label for="new_place" class="col-sm-2 control-label">地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_place" placeholder="地点" name="place"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_classname" class="col-sm-2 control-label">课程名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_classname" placeholder="课程名" name="classname"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_time" class="col-sm-2 control-label">时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_time" placeholder=" 时间" name="time"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_day" class="col-sm-2 control-label">星期几</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_day" placeholder="星期几" name="day"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_userid" class="col-sm-2 control-label">教师ID</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_userid" placeholder="教师ID" name="userid"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createClasses()">创建课程</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改课程模态框 -->
<div class="modal fade" id="classesEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改课程信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_classes_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_place" class="col-sm-2 control-label">地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_place" placeholder="地点" name="place"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_classname" class="col-sm-2 control-label">课程名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_classname" placeholder="课程名" name="classname"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_time" class="col-sm-2 control-label">时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_time" placeholder="时间" name="time"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_day" class="col-sm-2 control-label">星期几</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_day" placeholder="星期几" name="day"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_userid" class="col-sm-2 control-label">教师ID</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_userid" placeholder="教师ID" name="userid"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateClasses()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建课程窗口中的数据
	function clearClasses() {
		$("#new_place").val("");
	    $("#new_classname").val("")
	    $("#new_time").val("")
	    $("#new_day").val("")
	    $("#new_userid").val("");
	}
	//创建课程
	function createClasses(){
		$.post("<%=basePath%>classes/create.action",
		$("#new_classes_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("课程创建成功！");
	            window.location.reload();
	        }else{
	            alert("课程创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的课程信息
	function editClasses(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>classes/getClassesById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id); 
	        	$("#edit_place").val(data.place);
	            $("#edit_classname").val(data.classname);
	            $("#edit_time").val(data.time)
	            $("#edit_day").val(data.day)
	            $("#edit_userid").val(data.userid)
	        }
	    });
	}
	// 执行修改课程操作
	function updateClasses() {
		$.post("<%=basePath%>classes/update.action",$("#edit_classes_form").serialize(),function(data){
			if(data =="OK"){
				alert("课程信息更新成功！");
				window.location.reload();
			}else{
				alert("课程信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除课程
	function deleteClasses(id) {
	    if(confirm('确实要删除该课程吗?')) {
	$.post("<%=basePath%>classes/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("课程删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除课程失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>