package cn.obanks.ar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.obanks.exception.UserPasswordErrorException;
import cn.obanks.model.Credential;
import cn.obanks.security.web.OBSSOUtils;
import cn.obanks.service.CredentialService;

@Controller
@RequestMapping(value = "/changepassword")
public class ChangePasswordController {
	private static final Logger LOG = LoggerFactory.getLogger(ChangePasswordController.class);
	@Autowired
	private CredentialService credentialService;

	@RequestMapping(method = RequestMethod.GET, value = "merge")
	public String merge() {
		return "changepassword/changepassword";
	}

	@RequestMapping(method = RequestMethod.POST, value = "merge")
	public String merge(Model model, @RequestParam String oldPassword, @RequestParam String acctPassword) {
		// LOG.debug("oldPassword:{},Credentia:{}", oldPassword, acctPassword);
		long userId = OBSSOUtils.getUserId();
		try {
			Credential credential = new Credential();
			credential.setUserId(userId);
			credential.setAcctPassword(acctPassword);
			// credential.setUpdatedBy(userId);
			// credential.setUpdatedDate(new Date());
			this.credentialService.changePassword(oldPassword, credential);
			LOG.debug("change password " + userId);
			//model.addAttribute("msg", "密码修改成功！");
			return "changepassword/changepassword_02";
		} catch (UserPasswordErrorException e) {
			LOG.info("change password failure " + userId, e);
			model.addAttribute("msg", "你输入的旧密码与原密码不一致！请重新输入！");
		}
		return "changepassword/changepassword";
	}
}
