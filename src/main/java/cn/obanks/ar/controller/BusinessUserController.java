package cn.obanks.ar.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.obanks.ar.enums.AjaxResultStauts;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.utils.SendMsg;
import cn.obanks.ar.utils.UploadUtil;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;
import com.google.code.kaptcha.Constants;

@Controller
@RequestMapping(value = "/businessuser")
public class BusinessUserController {
	private static final Logger LOG = LoggerFactory.getLogger(BusinessUserController.class);
	@Autowired
	private BusinessUserService businessUserService;
	@Value("${uploaduserfiles}")
	private String uploaduserfiles;

	@RequestMapping(method = RequestMethod.GET, value = "add")
	public String add(HttpServletRequest request) {
	
		return "businessuser/add";
	}	

	@RequestMapping(method = RequestMethod.POST, value = "add")
	public String add(@RequestParam("myfiles1") MultipartFile myfiles1, @RequestParam("myfiles2") MultipartFile myfiles2, @RequestParam("myfiles3") MultipartFile myfiles3, @ModelAttribute BusinessUser businessUser, HttpServletRequest request, Model model) {
		/*		String phoneCode = (String) request.getSession().getAttribute("phoneCode");
		/*if (!businessUser.getMsgCode().equals(phoneCode)) {
			model.addAttribute("msg1", "短信验证码输入不正确");
			model.addAttribute("businessUser", businessUser);
			return "businessuser/add";
		}*/
		String code = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (businessUser.getCode().equals(code)) {
			try {
				UploadUtil upload = new UploadUtil();
				if (myfiles1.getSize()==0) {
					model.addAttribute("myfiles1", "请选择要上传的身份证/工作证");
					model.addAttribute("businessUser", businessUser);
					return "businessuser/add";
				}else if(myfiles2.getSize()==0){
					model.addAttribute("myfiles2", "请选择要上传的名片");
					model.addAttribute("businessUser", businessUser);
					return "businessuser/add";
				}
				MultipartFile[] myfiles = { myfiles1, myfiles3 };
				businessUserService.add(businessUser, myfiles);
				Long id = businessUserService.searchPhone(businessUser.getPhone()).getId();
//				String path = request.getServletContext().getRealPath(uploaduserfiles + businessUser.getId());
				String path = uploaduserfiles + id;
				System.out.println(id+"**************");
				upload.filesUpload(myfiles2, path,businessUser.getId()+".JPG");
				upload.filesUpload(myfiles, path);
				
				model.addAttribute("msg", "申请成功，我们会尽快与您联系.");
				return "businessuser/success";
			} catch (Exception e) {
				model.addAttribute("msg", "申请失败，" + e.getMessage());
				return "businessuser/success";
			}
		} else {
			model.addAttribute("codeMsg", "验证码输入不正确");
			model.addAttribute("businessUser", businessUser);
			return "businessuser/add";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "phonecode")
	@ResponseBody
	public AjaxResult phoneCode(@RequestParam String mobile,@RequestParam String type,@RequestParam String code, HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String code1 = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(!code.equals(code1)){
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
			return ajaxResult;
		}
		if(type==null||type==""){
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
			return ajaxResult;
		}
		String templateId = "";
		if(type.equals("1")){
			templateId = "84798";
		}
		else if(type.equals("2")){
			templateId = "84805";
		}
		else if(type.equals("3")){
			templateId = "84803";
		}
		SendMsg send = new SendMsg();
		String phoneCode = send.getRandomString(4);
		HttpSession session = request.getSession();
		session.setAttribute("phoneCode", phoneCode);
		
		String[] arg_rs = phoneCode.split("\\|");
		try {
			boolean result = true;
		//		boolean result = send.send(mobile, templateId, arg_rs);
			if (result == false) {
				ajaxResult.setResult(AjaxResultStauts.NO.getValue());
			} else {
				ajaxResult.setResult(AjaxResultStauts.YES.getValue());
			}
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}

	@RequestMapping(method = RequestMethod.GET, value = "resetpwd")
	public String resetPwd() {
		return "businessuser/resetpwd";
	}

	@RequestMapping(method = RequestMethod.POST, value = "resetpwd")
	public String resetPwd(String phone, String acctPassword, String code, String msgCode, HttpServletRequest request, Model model) {
/*		Object phoneCode = request.getSession().getAttribute("phoneCode");
		if (phoneCode == null) {
			model.addAttribute("msgCode", "请获取短信验证码");
			return "businessuser/resetpwd";
		}
		if (!msgCode.equals(phoneCode.toString())) {
			model.addAttribute("msgCode", "短信验证码输入不正确");
			return "businessuser/resetpwd";
		}*/
		Object codes =  request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (!code.equals(codes)) {
			model.addAttribute("codeMsg", "验证码输入不正确");
			return "businessuser/resetpwd";
		}
		try {
			businessUserService.resetPassword(phone, acctPassword);
			model.addAttribute("msg", "密码重置成功");
			return "businessuser/success";
		} catch (Exception e) {
			model.addAttribute("pwdMsg", e.getMessage());
			return "businessuser/resetpwd";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "checkphone")
	@ResponseBody
	public boolean checkphone(@ModelAttribute BusinessUser businessUser) {
		BusinessUser business = businessUserService.searchPhone(businessUser.getPhone());
		if (business == null)
			return true;
		return false;
	}

	@RequestMapping(method = RequestMethod.POST, value = "checkemail")
	@ResponseBody
	public boolean checkemail(@ModelAttribute BusinessUser businessUser) {
		BusinessUser business = businessUserService.searchEmail(businessUser.getEmail());
		if (business == null)
			return true;
		return false;
	}

	@RequestMapping(method = RequestMethod.GET, value = "merge")
	public String merge(Model model) {
		Long userId = OBSSOUtils.getUserId();
		BusinessUser businessUser = this.businessUserService.load(userId);
		model.addAttribute("businessUser", businessUser);
		return "businessuser/merge";
	}

	@RequestMapping(method = RequestMethod.POST, value = "merge")
	public String merge(Model model, @ModelAttribute BusinessUser businessUser, @RequestParam("myfile") MultipartFile[] myfile, HttpServletRequest request) {
		LOG.debug("businessUser+++{}", ToString.reflectionToString(businessUser));
		LOG.debug("id{}", ToString.reflectionToString(businessUser.getId()));
		Long userId = OBSSOUtils.getUserId();
		String phoneCode = (String) request.getSession().getAttribute("phoneCode");
		/*if (!businessUser.getMsgCode().equals(phoneCode)) {
			model.addAttribute("msg", "短信验证码输入不正确");
			return "businessuser/merge";
		}*/
		try {
			businessUser.setId(userId);
			this.businessUserService.merge(businessUser, myfile);
			String path = uploaduserfiles + businessUser.getId();
			UploadUtil upload = new UploadUtil();
			upload.filesUpload(myfile[0], path,userId+".JPG");
			return "businessuser/merge";
		} catch (Exception e) {
			e.printStackTrace();
			return "businessuser/merge";
		}
	}
	
//	@RequestMapping(method = RequestMethod.POST, value = "checkcode")
//	@ResponseBody
//	public AjaxResult checkCode(HttpServletRequest request,String code){
//		AjaxResult ajaxResult = new AjaxResult();
//		String code1 = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
//		if(code.equals(code1)){
//			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
//		}else{
//			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
//		}
//		return ajaxResult;
//	}
}
