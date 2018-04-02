package cn.obanks.ar.controller.m;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.utils.UploadUtil;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

/**
 * 账户管理
 * 
 * */

@Controller
@RequestMapping("/m/user")
public class UsersAction {
	
	private static final Logger LOG = LoggerFactory.getLogger(UsersAction.class);
	@Autowired
	private BusinessUserService businessUserService;
	@Value("${uploaduserfiles}")
	private String uploaduserfiles;
	/**
	 * 进入账户管理页面
	 * */
	@RequestMapping(value = "accountmanage")
	public String loginM(Model model) {
		Long userId = OBSSOUtils.getUserId();
		BusinessUser businessUser = this.businessUserService.load(userId);
		String phone=businessUser.getPhone();
		String phonestart=phone.substring(0, 4);
		String phoneend=phone.substring(8, 11);
		String phone1=phonestart+"****"+phoneend;
		String email=businessUser.getEmail();
		int index=email.lastIndexOf("@");
		String emailnum=email.substring(0, index);
		String emaileng=email.substring(index, email.length());
		String startemail=emailnum.substring(0, 1);
		String endemail=emailnum.substring(index-1, index);
		String email01=startemail+"**"+endemail+emaileng;
		model.addAttribute("email01", email01);
		model.addAttribute("phone1", phone1);
		model.addAttribute("businessUser", businessUser);
			return "m/accountmanagepage";
	}
	
	
	/**
	 * 进入联系我们页面
	 * */
	@RequestMapping(method = RequestMethod.GET, value = "contactus")
	public String contactus() {
			return "m/contactuspage";
	}
	/**
	 * 进入修改密码页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "changepassword")
	public String changepassword() {
			return "m/changepasswordpage";
	}
	
	/**
	 * 进入修改个人信息页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "changeuserinfo")
	public String changeuserinfo(Model model) {
		Long userId = OBSSOUtils.getUserId();
		BusinessUser businessUser = this.businessUserService.load(userId);
		model.addAttribute("businessUser", businessUser);
		return "m/changeuserinfopage";
	}
	
	/**
	 * 用户信息修改
	 */
	@RequestMapping(method = RequestMethod.POST, value = "changeuserinfo")
	public String merge(Model model, @ModelAttribute BusinessUser businessUser, @RequestParam("myfile") MultipartFile[] myfile, HttpServletRequest request) {
		LOG.debug("businessUser+++{}", ToString.reflectionToString(businessUser));
		LOG.debug("id{}", ToString.reflectionToString(businessUser.getId()));
		Long userId = OBSSOUtils.getUserId();
		String phoneCode = (String) request.getSession().getAttribute("phoneCode");
		try {
			businessUser.setId(userId);
			this.businessUserService.merge(businessUser, myfile);
			String path = uploaduserfiles + businessUser.getId();
			UploadUtil upload = new UploadUtil();
			upload.filesUpload(myfile[0], path,userId+".JPG");
			return "forward:/m/user/accountmanage.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "forward:/m/user/accountmanage.do";
		}
	}
	
}
