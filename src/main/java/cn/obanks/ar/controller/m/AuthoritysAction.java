package cn.obanks.ar.controller.m;

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

import com.google.code.kaptcha.Constants;

import cn.obanks.ar.enums.AjaxResultStauts;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.utils.SendMsg;
import cn.obanks.ar.utils.UploadUtil;
import cn.obanks.common.AjaxResult;


@Controller
@RequestMapping("/m/authority")
public class AuthoritysAction {
	@Autowired
	private BusinessUserService businessUserService;
	@Value("${uploaduserfiles}")
	private String uploadUserFiles;
	private static final Logger LOG = LoggerFactory.getLogger(AuthoritysAction.class);
	
	/**
	 * 进入登录页面
	 * */
	@RequestMapping(method = RequestMethod.GET, value = "login")
	public String login() {
			return "m/login";
	}
	
	/**
	 * 进入注册页面
	 * */
	@RequestMapping(method = RequestMethod.GET, value = "register")
	public String register() {
			return "m/registerpage";
	}
	
	/**
	 * 进行注册操作第一步
	 */
	@RequestMapping(method = RequestMethod.POST, value = "registerfirst")
	public String registerFirst(@ModelAttribute BusinessUser businessUser, HttpServletRequest request, Model model) {
		String phoneCode = (String) request.getSession().getAttribute("phoneCode");
		if(!businessUser.getMsgCode().equals(phoneCode)){
			model.addAttribute("msg", "短信验证码输入不正确");
			return "m/registerpage";
		}
		String code = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (!businessUser.getCode().equals(code)) {
			model.addAttribute("codeMsg", "验证码输入不正确");
			return "m/registerpage";
		}
		model.addAttribute("businessUser", businessUser);
		return "m/registerpageSecond";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "registersecond")
	public String registerFirst() {
		return "m/registerpageSecond";
	}
	

	@RequestMapping(method=RequestMethod.POST,value="checkphone")
	@ResponseBody
	public boolean checkphone(@ModelAttribute BusinessUser businessUser){
		BusinessUser business =  businessUserService.searchPhone(businessUser.getPhone());
		if(business == null)return true;
		return false;
	}
	
	@RequestMapping(method=RequestMethod.POST,value="checkemail")
	@ResponseBody
	public boolean checkemail(@ModelAttribute BusinessUser businessUser){
		BusinessUser business =  businessUserService.searchEmail(businessUser.getEmail());
		if(business == null)return true;
		return false;
	}
	
	
	/**
	 * 完成注册
	 */
	@RequestMapping(method = RequestMethod.POST, value = "registerfinish")
	public String registerFinish(@RequestParam("myfiles1") MultipartFile myfiles1, @RequestParam("myfiles2") MultipartFile myfiles2, @RequestParam("myfiles3") MultipartFile myfiles3, @ModelAttribute BusinessUser businessUser, HttpServletRequest request, Model model) {
			try {
				UploadUtil upload = new UploadUtil();
				if (myfiles1.getSize()==0) {
					model.addAttribute("myfiles1", "请选择要上传的身份证/工作证");
					model.addAttribute("businessUser", businessUser);
					return "m/registerpage";
				}else if(myfiles2.getSize()==0){
					model.addAttribute("myfiles2", "请选择要上传的名片");
					model.addAttribute("businessUser", businessUser);
					return "m/registerpage";
				}
				MultipartFile[] myfiles = { myfiles1, myfiles2, myfiles3 };
				businessUserService.add(businessUser, myfiles);
				String path = request.getServletContext().getRealPath(uploadUserFiles + businessUser.getId());
				upload.filesUpload(myfiles, path);
				model.addAttribute("msg", "申请成功，我们会尽快与您联系.");
				return "m/success";
			} catch (Exception e) {
				model.addAttribute("msg", "申请失败，" + e.getMessage());
				return "m/success";
			}
	}
	
	/**
	 * 进入忘记密码页面
	 * */
	@RequestMapping(method = RequestMethod.GET, value = "resetpassword")
	public String resetPassword() {
			return "m/resetpasswordpage";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "resetpassword")
	public String resetPwd(String phone, String acctPassword, String msgCode, HttpServletRequest request, Model model) {
		String phoneCode = (String) request.getSession().getAttribute("phoneCode");
		if (phoneCode == null) {
			model.addAttribute("msgCode", "请获取短信验证码");
			return "m/resetpasswordpage";
		}
		if (!msgCode.equals(phoneCode)) {
			model.addAttribute("msgCode", "短信验证码输入不正确");
			return "m/resetpasswordpage";
		}
		try {
			businessUserService.resetPassword(phone, acctPassword);
			model.addAttribute("msg", "密码重置成功");
			return "m/success";
		} catch (Exception e) {
			model.addAttribute("pwdMsg", e.getMessage());
			return "m/success";
		}
	}
	

	@RequestMapping(method = RequestMethod.POST, value = "phonecode")
	@ResponseBody
	public AjaxResult phoneCode(@RequestParam String mobile,@RequestParam String type, HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
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

}
