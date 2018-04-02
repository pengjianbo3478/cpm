<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<div class="content-order">
	<table class="tab_list mb20">
		<thead>
			<tr>
				<th width="5%">ID</th>
				<th width="5%">邮箱</th>
				<th width="5%">姓名</th>
				<th width="5%">公司</th>
				<th width="5%">部门</th>
				<th width="5%">账户</th>
				<th width="5%">密码</th>
				<th width="5%">状态</th>
				<th width="5%">搜索</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${paginate.data}" varStatus="s">
				<tr>
					<td>${item.id}</td>
					<td>${item.email}</td>
					<td>${item.name}</td>
					<td>${item.company}</td>
					<td>${item.department}</td>
					<td>${item.account}</td>
					<td>${item.password}</td>
					<td>
						<c:if test="${item.status == 'P'}">未激活</c:if>
						<c:if test="${item.status == 'A'}">激活成功</c:if>
						<c:if test="${item.status == 'D'}">完结</c:if>
					</td>
					<td>
						<c:if test="${item.status=='A'}">
							<a onclick="end(this)" data-id="${item.id}">完结</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	function end(obj) {
		var $this = $(obj);
		$("#_DELETE_DIALOG").dialog({
			title : "警告!",
			dialogClass : "alert",
			modal : true,
			close : function(event, ui) {
				$(this).dialog("close");
			},
			open : function() {
				$(this).html("您确定执行该操作吗？");
			},
			buttons : [ {
				text : "确定",
				click : function() {
					$(this).dialog("close");
					$.ajax({
						url : "${ctx}/accountregistry/end.do",
						type : "POST",
						data : {
							id : $this.attr("data-id")
						},
						dataType : "json",
						success : function(data) {
							if (data.result == "Y") {
								jAlert("操作成功！", "提示", 1000);
								window.location.reload();
							}
						},
						error : function() {
							jAlert("操作失败！", "提示", 1000);
							window.location.reload();
						}
					});
				}
			}, {
				text : "取消",
				click : function() {
					$(this).dialog("close");
				}
			} ]
		});
	}
</script>