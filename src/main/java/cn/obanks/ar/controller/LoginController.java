package cn.obanks.ar.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class LoginController {
	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(method = RequestMethod.GET, value = "login")
	public String login(HttpServletRequest request) {
		String userAgent = request.getHeader("User-Agent");
		if (null != userAgent) {
			userAgent = userAgent.toUpperCase();
			if (((0 <= userAgent.indexOf("PHONE")) || (0 <= userAgent.indexOf("IPAD"))
					|| (0 <= userAgent.indexOf("IPOD")) || (0 <= userAgent.indexOf("NDROID")))) {
				LOG.debug("############# MOBILE #############");
				return "m/login";
			}
		}
		return "login/login";
	}

	@RequestMapping(method = RequestMethod.GET, value = "error")
	public String error(HttpServletRequest request) {
		return "login/login";
	}
}
