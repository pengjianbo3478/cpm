<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<script src="${ctx}/js/assets/assets.js?v=1.1" charset="UTF-8"></script> 

<script type="text/javascript">
function click_val(){
	checkForm();
	$('#form').submit();
}
</script>

<!--顶部页头end-->
<!--内容主体start-->


<!--右侧主内容start-->
<div id="fr_main" class="fr_main">
     <!--标题start-->
     <div class="title_h1">
          <h1>找资金</h1>
          
          
      </div>  
     <!---手动录入信息---->
     <form:form commandName="assets" id="form" onsubmit="return file_Validator();" modelAttribute="assets" action="${ctx}/assets/merge.do" method="POST" enctype="multipart/form-data">
         <div class="data data_edit" >
         <div class="data_title">信息修改</div>
         
                <!--上传文件start-->
                
                <div class="main">
                <dl class="dl1"><dt><span class="red">*</span>项目名称</dt><dd>
                      <div class="file-box1">
                      <form:hidden path="id" value="${id }"/>
                        <form:input path="assetsName" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="assetsName_info"></div>
                  </dl>
                  <dl class="dl1"><dt><span class="red">*</span>项目类型</dt><dd>
                      <div class="file-box1">
                      <form:select path="assetType" class="txt3"  onChange="showInput1(this.value);">                                       
                    			<form:options items="${assetTypelist}" itemLabel="value" itemValue="key" />
                    		</form:select>
                         <input type="text" name="textfield" id="other_input_1" class="txt2" placeholder="需要用户填写具体类型">  
                         <form:input path="assetTypeOther" id="other_input_1" cssClass="txt2" />
                      </div></dd>
                      <div class="text02" id="assetType_info"></div>
                    </dl>
                    
                    <dl class="dl1"><dt><span class="red">*</span>资产地区</dt>
                      <dd>
                      <div class="file-box1">
                         <form:input path="assetArea" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="assetArea_info"></div>
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>融资规模</dt>
                      <dd>
                      <div class="file-box1">
                        <form:input path="assetScales" cssClass="txt4" />
                         <form:select path="assetUnit" class="txt3"  onChange="showInput1(this.value);">
                    			<form:options items="${assetUnitSelectList}" itemLabel="value" itemValue="key" />
                    		</form:select>
                      </div></dd><div class="text02" id="assetScales_info"></div>
                  </dl>
                <dl class="dl1"><dt><span class="red">*</span>期限</dt><dd>
                      <div class="file-box1">
                         <form:input path="termMin" cssClass="txt5" />
                         <span class="txt6">-</span>
                         <form:input path="termMax" cssClass="txt5" />
                         <span class="txt7">个月</span>
                      </div></dd>
                      <div class="text01">-号前必填，整数</div>
                      <div class="text02" id="term_info"></div>
                  </dl>
                    <dl class="dl1"><dt><span class="red">*</span>预计收益率</dt><dd>
                      <div class="file-box1">
                         <form:input path="yieldMin" cssClass="txt5" />
                         <span class="txt6">--</span>
                         <form:input path="yieldMax" cssClass="txt5" />
                         
                      </div></dd><div class="text02" id="yield_info"></div>
                    </dl>
                    
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>开放对象</dt><dd>
                      <div class="check-box1">
						<li><i></i>银行<form:checkbox path="targetlist" value="1" class="check_input" /></li>  
						<li><i></i>保险<form:checkbox path="targetlist" value="2" class="check_input"/></li>  
						<li><i></i>公募<form:checkbox path="targetlist" value="3" class="check_input"/></li>  
						<li><i></i>私募<form:checkbox path="targetlist" value="4" class="check_input"/></li>    
						<li><i></i>券商<form:checkbox path="targetlist" value="5" class="check_input"/></li>    
						<li><i></i>信托<form:checkbox path="targetlist" value="6" class="check_input"/></li>    
						<li><i></i>金融租赁<form:checkbox path="targetlist" value="7" class="check_input"/></li>    
						<li><i></i>金控集团<form:checkbox path="targetlist" value="8" class="check_input"/></li>    
						<li><i></i>互金工司<form:checkbox path="targetlist" value="9" class="check_input"/></li>    
						<li><i></i>商业保理<form:checkbox path="targetlist" value="10" class="check_input"/></li>    
						<li><i></i>商业租赁<form:checkbox path="targetlist" value="11" class="check_input"/></li>    
						<li><i></i>其他<form:checkbox path="targetlist" value="12" class="check_input"/></li> 
						<li class="last"><i></i>不限<form:checkbox path="targetlist" value="99" class="check_input"/></li>     
                      </div></dd>
                    </dl>
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>资金用途</dt><dd>
                      <div class="file-box1">
                      	<form:input path="useOfFunds" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="useOfFunds_info"></div>
                    </dl>
                <dl class="dl1"><dt><span class="red">*</span>融资主体</dt><dd>
                      <div class="file-box1">
                         <form:input path="financing" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="financing_info"></div>
                  </dl>
                    <dl class="dl1"><dt><span class="red">*</span>融资主体类型</dt><dd>
                      <div class="file-box1">
               <form:select path="financingCategory" class="txt3"  onChange="showInput2(this.value);">
                    			<form:options items="${financingCategoryList}" itemLabel="value" itemValue="key" />
                    		</form:select>
                       <input type="text" name="textfield" id="other_input_2" class="txt2" placeholder="需要用户填写具体类型">  
                      <form:input path="financingCategoryOther" id="other_input_2" cssClass="txt1" />
                      </div></dd><div class="text02" id="financingCategory_info"></div>
                    </dl>
                    
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>其他</dt><dd>
                      <div class="file-box1">
                         <form:textarea path="other" cssClass="txt8" cols="45" rows="5" />
                      </div></dd>
                      <div class="text02"></div>
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>项目介绍<br></dt><dd>
                      <div class="file-box1">
                          <form:input path="introduction" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="introduction_info"></div>
                    </dl>
                  <dl class="dl1 clearfix"><dt><span class="red">*</span>融资主体<br>
信用描述</dt><dd>
                      <div class="file-box1">
                         <form:textarea path="financingCredit" cssClass="txt8" cols="45" rows="5"/>
                      </div></dd>
                      <div class="text01">最多输入1000字符</div>
                    </dl>
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>担保主体<br>和措施</dt><dd>
                      <div class="file-box1">
                     		<form:textarea path="financingAssure" cssClass="txt8" cols="45" rows="5"/>
                      </div></dd>
                      <div class="text02" id="financingAssure_info"></div>
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>进度</dt><dd>
                      <div class="file-box1">
                       <form:select path="assetStatus" class="txt3" >
                    			<form:options items="${Assets_progress}" itemLabel="value" itemValue="key"/>
                    		</form:select>
                                               <!-- <select class="txt3" name="select">
   <option selected="selected">立顶</option>
   <option>立顶1</option>
   <option>立顶2</option> 
   </select> -->
                       </div></dd>
                    </dl>
                     <form:hidden path="status" id="status"/>
                    <dl class="dl1"><dt>上传附件</dt><dd>
                      <div class="file-box1">
                         <input type="text" name="textfield" id="textfield3" class="txt1" placeholder="项目说明书原件">  
                         <input type="button" class="btn1" value="浏览...">
                         <input type="file" name="myfile" class="file1" id="myfile" size="28" onchange="document.getElementById('textfield3').value=this.value;document.getElementById('textfield3').style.textIndent='5px'">
                      </div>
                      </dd>
                    </dl>
                    <div class="text02" id="target_info"></div>
                    <p style="padding:40px 0 0 0;"><button type="button" onclick="click_val()">提交</button></p>
                </div>
 
         </div>   
         
         </form:form>
         
      </div>







