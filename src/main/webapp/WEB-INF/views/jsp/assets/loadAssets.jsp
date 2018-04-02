<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="${ctx}/js/assets/assets.js?v=1" charset="UTF-8"></script> 
<script type="text/javascript">
/* function checkPhone() {
		var url = "${ctx}/assets/checkname.do";
		$.post(url, {
			name : $('#assetsName').val()
		}, function(data) {
			if (data == false) {
				$("#assetsName_info").html("项目名称已存在");
			} else {
				return true;
			}
		}, "json");
	} */
</script>
<!--右侧主内容start-->
<div id="fr_main" class="fr_main find_funds">
     <!--标题start-->
     <div class="title_h1">
          <h1>找资金</h1>
          <a id="top_input_info" class="select_btn btn_blue">手动录入信息</a>
          <a id="top_btn_upload" class="select_btn btn_blue">上传项目说明书</a>
          
      </div>
     <!---找资金---->
     <div class="funds clearfix">
     <div class="funds_01">
     <div class="funds_title">
     <div class="funds_title_01">一键上传附件无需录入信息</div>
     <div class="funds_title_02">选择上传项目说明书，则不需要在录入资产信息</div>
     </div>
     <div class="funds_pic"><img src="../images/fundspic_01.jpg" width="386" height="97"></div>
     <a id="btn_upload" class="funds_botton btn_blue" href="#">上传项目说明书</a>
     </div>
     <div class="funds_02">
     <div class="funds_title">
     <div class="funds_title_01">一键上传附件无需录入信息</div>
     <div class="funds_title_02">选择上传项目说明书，则不需要在录入资产信息</div>
     </div>
     <div class="funds_pic"><img src="../images/fundspic_02.jpg" width="386" height="97"></div>
     <a id="input_info" class="funds_botton btn_orange" href="#">手动录入信息</a>
     </div>
     </div> 
     <!---上传附件---->
        <form:form commandName="assets" modelAttribute="assets" onsubmit="return file_Validator();" action="${ctx}/assets/uploadadd.do" method="POST" enctype="multipart/form-data">
         <div class="enclosure" style=" left: 980px">
         <div class="enclosure_title">一键上传附件</div>
         
                <!--上传文件start-->
                <div class="main" >
                <div class="upload-wrap" >
                 <div id="upload-file">
                    <dl class="dl1"><dt>项目说明书</dt><dd>
                      <div class="file-box1">
                         <input type="text" name="textfield" id="textfield1" class="txt1" placeholder="项目说明书原件">  
                         <input type="button" class="btn1" value="浏览...">
                         <input type="file" name="myfiles" class="file1" id="imagefile1" size="28" onchange="document.getElementById('textfield1').value=this.value;document.getElementById('textfield1').style.textIndent='5px'">
                      </div>
                      <span class="add">+</span>
                      <div class="text02" id="target_info1"></div>
                      </dd>
                    </dl>
                    </div>
                    <div class="sm">
                    <p class="s1">将项目说明书原件或者盖章的复印件扫描、拍照后上传，文件支持2M以内的PNG、JPG、GIF、WORD或PDF</p>
                    <p class="s2">*请上传2M以内的PNG、JPG、GIF、WORD、PDF或PDS格式文件</p>
                    </div>
                    </div>
                     <div style="color: #FF0000" id="msgcode">${msg}</div>
                    <p><button type="submit" id="">上传</button></p>
                 </div>
          </div>
          </form:form>
       <form:form commandName="assets" id="form1" modelAttribute="assets" action="${ctx}/assets/add.do" method="POST" enctype="multipart/form-data">
    <!---手动录入信息---->
         <div class="data" style=" left: 980px">
         <div class="data_title">录入信息</div>
         
                <!--上传文件start-->
                
                <div class="main">
                <dl class="dl1"><dt><span class="red">*</span>项目名称</dt><dd>
                      <div class="file-box1">
                        <form:input path="assetsName" id="assetsName" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="assetsName_info"></div>
                  </dl>
                  <dl class="dl1"><dt><span class="red">*</span>项目类型</dt><dd>
                      <div class="file-box1">
                      <form:select path="assetType" id="assetType" class="txt3" onchange="showInput1(this.value);">
                    			<form:options items="${assetTypelist}" itemLabel="value" itemValue="key"/>
                    		</form:select>
                        <input type="text" name="textfield" id="other_input_1" class="txt2" placeholder="需要用户填写具体类型">  
                         <form:input path="assetTypeOther" id="other_input_1" cssClass="txt2" />
                      </div></dd>
                      <div class="text02" id="assetType_info"></div>
                    </dl>
                    
                    <dl class="dl1"><dt><span class="red">*</span>资产地区</dt>
                      <dd>
                      <div class="file-box1">
                         <form:input path="assetArea" id="assetArea" cssClass="txt1" />
                      </div></dd>
                      <!-- <div class="text02">* 错误信息请输入正确地区</div> -->
                      <div class="text02" id="assetArea_info"></div> 
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>融资规模</dt>
                      <dd>
                      <div class="file-box1">
                        <form:input path="assetScales" id="assetScales" cssClass="txt4" />
                         <form:select path="assetUnit" class="txt3" >
                    			<form:options items="${assetUnitSelectList}" itemLabel="value" itemValue="key" onChange="showInput1(this.value);"/>
                    		</form:select>
                      </div></dd>
                       <div class="text02" id="assetScales_info"></div> 
                  </dl>
                <dl class="dl1"><dt><span class="red">*</span>期限</dt><dd>
                      <div class="file-box1">
                         <form:input path="termMin" id="termMin" cssClass="txt5" />
                         <span class="txt6">+</span>
                         <form:input path="termMax" id="termMax" cssClass="txt5" />
                         <span class="txt7">个月</span>
                      </div></dd>
                      <div class="text02" id="term_info"></div> 
                  </dl>
                    <dl class="dl1"><dt><span class="red">*</span>预计收益率(%)</dt><dd>
                      <div class="file-box1">
                         <form:input path="yieldMin" id="yieldMin" cssClass="txt5" />
                         <span class="txt6">--</span>
                         <form:input path="yieldMax" id="yieldMax" cssClass="txt5" />
                         
                      </div></dd> <div class="text02" id="yield_info"></div> 
                    </dl>
                    
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>开放对象</dt><dd>
                      <div class="check-box1">
<li><i></i>银行<form:checkbox path="targetlist" value="1" class="check_input"/></li>  
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
                      	<form:input path="useOfFunds" id="useOfFunds" cssClass="txt1" />
                      </div></dd> <div class="text02" id="useOfFunds_info"></div>
                    </dl>
                <dl class="dl1"><dt>融资主体</dt><dd>
                      <div class="file-box1">
                         <form:input path="financing" id="financing" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="financing_info"></div>
                  </dl>
                    <dl class="dl1"><dt><span class="red">*</span>融资主体类型</dt><dd>
                      <div class="file-box1">
               <form:select path="financingCategory" id="financingCategory" class="txt3" onchange="showInput2(this.value);">
                    			<form:options items="${financingCategoryList}" itemLabel="value" itemValue="key"/>
                    		</form:select>
                    		 <input type="text" name="textfield" id="other_input_2" class="txt2" placeholder="需要用户填写具体类型">  
                      <form:input path="financingCategoryOther" id="other_input_2" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="financingCategory_info"></div>
                    </dl>
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>其他</dt><dd>
                      <div class="file-box1">
                         <form:textarea path="other" id="other" cssClass="txt8" cols="45" rows="5" />
                      </div></dd>
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>项目介绍<br></dt><dd>
                      <div class="file-box1">
                          <form:input path="introduction" id="introduction" cssClass="txt1" />
                      </div></dd>
                      <div class="text02" id="introduction_info"></div>
                    </dl>
                  <dl class="dl1 clearfix"><dt><span class="red">*</span>融资主体<br>
信用描述</dt><dd>
                      <div class="file-box1">
                         <form:textarea path="financingCredit" id="financingCredit" cssClass="txt8" cols="45" rows="5"/>
                      </div></dd>
                      <div class="text01">最多输入1000字符</div>
                      <div class="text02" id="financingCredit_info"></div>
                    </dl>
                    <dl class="dl1 clearfix"><dt><span class="red">*</span>担保主体<br>和措施</dt><dd>
                      <div class="file-box1">
                     		<form:textarea path="financingAssure" id="financingAssure" cssClass="txt8" cols="45" rows="5"/>
                      </div></dd>
                      <div class="text01">最多输入1000字符</div>
                    </dl>
                    <dl class="dl1"><dt><span class="red">*</span>进度</dt><dd>
                      <div class="file-box1">
                       <form:select path="assetStatus" class="txt3" >
                    			<form:options items="${Assets_progress}" itemLabel="value" itemValue="key" onChange="showInput1(this.value);"/>
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
                    <p style="padding:40px 0 0 0;"><button type="button" id="save" onclick="click_val('DF')">保存</button><button type="button"  onclick="click_val('PA')">提交</button></p>
                </div>
 
         </div>   
       </form:form>  
      </div>


<!--内容主体end-->

