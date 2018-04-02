<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<link href="${static_ftiao_cn}/css/comm.css" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/assets.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="${static_ftiao_cn}/js/jquery-1.11.1.min.js"></script> 
<script src="${static_ftiao_cn}/js/my_comm.js" charset="UTF-8"></script> 
<script src="${static_ftiao_cn}/js/success_alter.js" charset="UTF-8"></script> 
<script src="${static_ftiao_cn}/js/funds.js" charset="UTF-8"></script>
<script type="text/javascript">
//下面用于图片上传预览功能
function setImagePreview(avalue) {
var docObj=document.getElementById("doc");

var imgObjPreview=document.getElementById("preview");
if(docObj.files &&docObj.files[0])
{
//火狐下，直接设img属性
imgObjPreview.style.display = 'block';
imgObjPreview.style.width = '150px';
imgObjPreview.style.height = '180px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();

//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
}
else
{
//IE下，使用滤镜
docObj.select();
var imgSrc = document.selection.createRange().text;
var localImagId = document.getElementById("localImag");
//必须设置初始大小
localImagId.style.width = "150px";
localImagId.style.height = "180px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
try{
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
}
catch(e)
{
alert("您上传的图片格式不正确，请重新选择!");
return false;
}
imgObjPreview.style.display = 'none';
document.selection.empty();
}
return true;
}

</script>
 

<!--右侧主内容start-->
<div id="fr_main" class="fr_main">
     <!--标题start-->
     <div class="title_h1">
          <h1>修改密码</h1>
          
          
      </div>  
     <!---密码修改完成---->
         <div class="information information_edit" >
         <div class="main">
              <div class="password_pic"></div>
              <div class="password_completed">密码修改成功！</div>
 </div>
         </div>   
       
         
      </div>






<div class="sideToolBar">
	<span class="link01"> <a href="#"><i></i></a></span>
    <span class="link02" ><a class="#"><i></i></a></span>
    <span class="link03" ><a class="#"><i></i></a></span>
    <span href="javascript:void(0);" class="returnTop" style="display: none;"><i></i></span>
</div>
