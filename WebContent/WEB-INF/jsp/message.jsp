<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="luxun" uri="http://luxun.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 留言列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">留言管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/message/list.action">
			    <div class="form-group">
					<label for="id">编号</label> 
					 <input type="text" class="form-control" id="id" 
					                   value="${id}" name="id" />
				</div>
				<div class="form-group">
					<label for="content">公告内容</label> 
					 <input type="text" class="form-control" id="content" 
					                   value="${content}" name="content" />
				</div>
				<div class="form-group">
					<label for="title">教师ID</label>  
					 <input type="userid" class="form-control" id="userid" 
					                   value="${userid}" name="userid" />
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newMessageDialog" onclick="clearMessage()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">留言信息列表</div>
				<!-- 公告信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>公告内容</th>
							<th>创建时间</th>
							<th>教师ID</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.content}</td>
								<td>${row.createtime}</td>
								<td>${row.userid}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#messageEditDialog" onclick= "editMessage(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteMessage(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<luxun:page url="${pageContext.request.contextPath }/message/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建留言模态框 -->
<div class="modal fade" id="newMessageDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建留言信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_notice_form">
					<div class="form-group">
						<label for="new_content" class="col-sm-2 control-label">公告内容</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_content" placeholder=" 公告内容" name="content"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_createtime" class="col-sm-2 control-label">创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_createtime" placeholder="创建时间" name="createtime"/>
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
				<button type="button" class="btn btn-primary" onclick="createMessage()">创建留言</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改留言模态框 -->
<div class="modal fade" id="messageEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改留言信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_message_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_content" class="col-sm-2 control-label">留言内容</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_content" placeholder="公告内容" name="content"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_createtime" class="col-sm-2 control-label">创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_createtime" placeholder="创建时间" name="createtime"/>
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
				<button type="button" class="btn btn-primary" onclick="updateMessage()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建留言窗口中的数据
	function clearMessage() {
	    $("#new_content").val("");
	    $("#new_createtime").val("")
	    $("#new_userid").val("")
	}
	//创建留言
	function createMessage(){
		$.post("<%=basePath%>message/create.action",
		$("#new_message_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("留言创建成功！");
	            window.location.reload();
	        }else{
	            alert("留言创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的留言信息
	function editMessage(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>message/getMessageById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id); 
	            $("#edit_content").val(data.content);
	            $("#edit_createtime").val(data.createtime);
	            $("#edit_userid").val(data.userid);
	        }
	    });
	}
	// 执行修改留言操作
	function updateMessage() {
		$.post("<%=basePath%>message/update.action",$("#edit_message_form").serialize(),function(data){
			if(data =="OK"){
				alert("留言信息更新成功！");
				window.location.reload();
			}else{
				alert("留言信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除留言
	function deleteMessage(id) {
	    if(confirm('确实要删除该留言吗?')) {
	$.post("<%=basePath%>message/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("留言删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除留言失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>