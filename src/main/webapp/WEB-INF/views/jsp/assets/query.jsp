<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<link rel="stylesheet" href="${ctx}/js/ui/Dialog/jquery-ui-1.10.4.dialog.css" />

<div id="_DELETE_DIALOG"></div>
<script type="text/javascript">
  	function fundsdetail(id) {
  			window.location.href = $("#_DETAIL").val()+"?id="+id;
    	}
     function merge(id) {
			window.location.href = $("#_MERGE").val()+"?id="+id;
		}
     
     function mergestatus(obj){
			var $this = $(obj);
			$("#_DELETE_DIALOG").dialog({
				title : "警告!",
				dialogClass : "alert",
				modal : true,
				close : function(event, ui) {
					$(this).dialog("close");
				},
				open : function() {
					$(this).html("您确定终止吗？");
				},
				buttons : [ {
					text : "确定",
					click : function() {
						$(this).dialog("close");
						$.ajax({
							url : $("#_MERGESTATUS").val(),
							type : "POST",
							data : {
								 id : $this.attr("data-id")
							},
							dataType : "json",
							success : function(data) {
								if (data.result == "Y") {
									alert("终止成功！", "提示", 1000);
									window.location.reload();  
								}
							},
							error : function() {
								alert("终止失败！", "提示", 1000);
								window.location.reload();  
							}
						});
					}
				}, 
				{
					text : "取消",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}
     function mergestatus2(obj){
			var $this = $(obj);
			$("#_DELETE_DIALOG").dialog({
				title : "警告!",
				dialogClass : "alert",
				modal : true,
				close : function(event, ui) {
					$(this).dialog("close");
				},
				open : function() {
					$(this).html("您确定提交吗？");
				},
				buttons : [ {
					text : "确定",
					click : function() {
						$(this).dialog("close");
						$.ajax({
							url : $("#_MERGESTATUS").val(),
							type : "POST",
							data : {
								 id : $this.attr("data-id")
							},
							dataType : "json",
							success : function(data) {
								if (data.result == "Y") {
									alert("提交成功！", "提示", 1000);
									window.location.reload();  
								}
							},
							error : function() {
								alert("提交失败！", "提示", 1000);
								window.location.reload();  
							}
						});
					}
				}, 
				{
					text : "取消",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}
</script>
 <div class="title_h1">
          <h1>资产发布</h1>
          <a class="select_btn add_btn btn_blue" id="add_btn" href="${ctx}/assets/add.do"> 新增资产</a>
  </div>
 <!---资产发布---->
 <div class="funds_release">
     
     <!---顶部---->
     <div class="top">
     <div class="sort down">时间<i></i></div>
     <div > 
     <div class="m_classify" >
     <form:form commandName="assets" action="${ctx}/assets/query.do" modelAttribute="assets" method="POST" cssClass="validate" id="_assets">
 		<form:select path="status" onchange="ftiaoPageUtils.toPage('1');" cssStyle="width:80px;"   >
		<form:option value=" " >显示全部</form:option>
		<form:option value="OL">已发布</form:option>
		<form:option value="PA">待审核</form:option>
		<form:option value="DF">未提交</form:option>
		<form:option value="OF">已失效</form:option>
		</form:select>
		<input type="hidden" id="_FTIAO_PAGINATE" name="currentPageNum" value="1" form-id="_assets" btn-id="btn__" />
     </form:form>
     </div>
     
      </div>
     </div>
     <ul class="project_list" >
     <c:forEach var="item" items="${paginate.data}" varStatus="s">
     <li>
     <c:if test="${item.status=='DF'}">
     <div class="status unreleased"></div>
     </c:if>
     <c:if test="${item.status=='PA'}">
     <div class="status pending"></div>
     </c:if>
     <c:if test="${item.status=='OL'}">
     <div class="status released"></div>
     </c:if>
     <div class="w1">
     <h2><a onclick="fundsdetail(${item.id})"><i></i>${item.assetsName}</a></h2>
     <p>上一次保存日期：<f:formatDate value="${item.updatedDate}"
							pattern="yyyy-MM-dd HH:mm:ss " /></p>
     </div>
     <div class="w2">
     <i><c:forEach items="${financingCategoryList}" var="financingCategory" >
                        <c:if test="${financingCategory.key eq item.financingCategory}">${financingCategory.value}</c:if>
                    </c:forEach></i>
     <p>融资主体</p>
     </div>
     <div class="w2">
     <i><em>${item.assetScales}</em><c:forEach items="${assetUnitSelectList}" var="assetUnit" >
                        <c:if test="${assetUnit.key eq item.assetUnit}">${assetUnit.value}</c:if>
                    </c:forEach></i>
     <p>融资规模</p>
     </div>
     <div class="w3">
     <c:if test="${item.status!='PA'}">
     <a class="proj_btn"  onclick="merge(${item.id})">修改</a>
     </c:if>
     <c:if test="${item.status=='DF'}">
     <a class="proj_btn"onclick="mergestatus2(this)" data-id="${item.id}" >提交</a>
     </c:if>
     <c:if test="${item.status=='OL'}">
     <a class="proj_btn"onclick="mergestatus(this)" data-id="${item.id} ">终止</a>
     </c:if>
   <%--   <c:if test="${item.status!='OL'&& item.status=='PA' && item.status!='DF' && item.status!='OL'}">
     	<a onclick="detail(${item.id})"  class="proj_btn">查看</a>
     </c:if> --%>
		<%-- <a onclick="detail(${item.id})"  class="proj_btn">查看</a> --%>
	 </div>
     </li>
    
     </c:forEach>
     </ul> 
     </div>
