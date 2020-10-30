<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="luxun" uri="http://luxun.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!-- 公告列表查询部分  start-->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">奖惩管理</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<!-- 查询框 -->
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get" 
			      action="${pageContext.request.contextPath }/reward/list.action">
			    <div class="form-group">
					<label for="grand">等级</label> 
					 <input type="text" class="form-control" id="grand" 
					                   value="${grand}" name="grand" />
				</div>
				<div class="form-group">
					<label for="name">名称</label> 
					 <input type="text" class="form-control" id="name" 
					                   value="${name}" name="name" />
				</div>
				<div class="form-group">
					<label for="userid">教师ID</label>  
					 <input type="text" class="form-control" id="userid" 
					                   value="${userid}" name="userid" />
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	
	
	<a href="#" class="btn btn-primary" data-toggle="modal" 
	           data-target="#newRewardDialog" onclick="clearReward()">新建</a>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">奖惩信息列表</div>
				<!-- 奖惩信息列表 -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>编号</th>
							<th>创建时间</th>
							<th>等级</th>
							<th>名称</th>
							<th>类型</th>
							<th>教师ID</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.id}</td>
								<td>${row.createtime}</td>
								<td>${row.grand}</td>
								<td>${row.name}</td>
								<td>${row.type}</td>
								<td>${row.userid}</td>
								<td>
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#rewardEditDialog" onclick= "editReward(${row.id})">修改</a>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteReward(${row.id})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<luxun:page url="${pageContext.request.contextPath }/reward/list.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
<!-- 创建学生模态框 -->
<div class="modal fade" id="newRewardDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建奖惩信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_reward_form">
					<div class="form-group">
						<label for="new_createtime" class="col-sm-2 control-label">创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_createtime" placeholder="创建时间" name="createtime"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_grand" class="col-sm-2 control-label">等级</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_grande" placeholder="等级" name="grand"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_name" class="col-sm-2 control-label">名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_name" placeholder="名称" name="name"/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_type" class="col-sm-2 control-label">类型</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_type" placeholder="类型" name="type"/>
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
				<button type="button" class="btn btn-primary" onclick="createReward()">创建奖惩</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改奖惩模态框 -->
<div class="modal fade" id="rewardEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改奖惩信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_reward_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_createtime" class="col-sm-2 control-label">创建时间</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_createtime" placeholder="创建时间" name="createtime"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_grand" class="col-sm-2 control-label">等级</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_grand" placeholder="等级" name="grand"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_name" class="col-sm-2 control-label">名称</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_name" placeholder="名称" name="name"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_type" class="col-sm-2 control-label">类型</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_type" placeholder="类型" name="type"/>
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
				<button type="button" class="btn btn-primary" onclick="updateReward()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//清空新建奖惩窗口中的数据
	function clearReward() {
		$("#new_createtime").val("");
	    $("#new_grand").val("")
	    $("#new_name").val("")
	    $("#new_type").val("")
	    $("#new_userid").val("");
	}
	//创建奖惩
	function createReward(){
		$.post("<%=basePath%>reward/create.action",
		$("#new_reward_form").serialize(),function(data){
	       	if(data =="OK"){
	            alert("奖惩创建成功！");
	            window.location.reload();
	        }else{
	            alert("奖惩创建失败！");
	            window.location.reload();
	        }
	    });
	}	
	// 通过id获取修改的奖惩信息
	function editReward(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>reward/getRewardById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id); 
	        	$("#edit_createtime").val(data.createtime);
	            $("#edit_grand").val(data.grand);
	            $("#edit_name").val(data.name)
	            $("#edit_type").val(data.type)
	            $("#edit_userid").val(data.userid)
	        }
	    });
	}
	// 执行修改奖惩操作
	function updateReward() {
		$.post("<%=basePath%>reward/update.action",$("#edit_reward_form").serialize(),function(data){
			if(data =="OK"){
				alert("奖惩信息更新成功！");
				window.location.reload();
			}else{
				alert("奖惩信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除奖惩
	function deleteReward(id) {
	    if(confirm('确实要删除该奖惩吗?')) {
	$.post("<%=basePath%>reward/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("奖惩删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除奖惩失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>