package cn.obanks.ar.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.obanks.ar.enums.AssetsStauts;
import cn.obanks.ar.enums.AssetsValidStauts;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsAttachment;
import cn.obanks.ar.model.InvestorAllowed;
import cn.obanks.ar.service.AssetsAttachmentService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.ar.service.InvestorAllowedService;
import cn.obanks.ar.utils.UploadUtil;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.AjaxResultStatus;
import cn.obanks.common.Item;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Controller
@RequestMapping("/assets")
public class AssetsController {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsController.class);

	@Autowired
	private AssetsService assetsService;
	
	@Autowired
	private InvestorAllowedService investorAllowedService;
	
	@Autowired
	private AssetsAttachmentService assetsAttachmentService;
	
	
	@Resource
	private List<Item> financingCategoryList;
	@Resource
	private List<Item> assetUnitSelectList;
	
	@Resource
	private List<Item> assetTypelist;
	
	@Resource
	private List<Item> Assets_progress;
	
	@Resource
	private List<Item> targetTypeList;
	
	@Value("${uploadassetsfiles}")  
	private String uploadassetsfiles;

	@ModelAttribute
	public void init(Model model) {
		model.addAttribute("assetTypelist", assetTypelist);
		model.addAttribute("financingCategoryList", financingCategoryList);
		model.addAttribute("assetUnitSelectList", assetUnitSelectList);
		model.addAttribute("Assets_progress", Assets_progress);
		model.addAttribute("targetTypeList", targetTypeList);
	}

	@RequestMapping(method = RequestMethod.GET, value = "add")
	public String add(@ModelAttribute Assets assets) {
		return "assets/loadAssets";
	}

	@RequestMapping(method = RequestMethod.POST, value = "add")
	public String add(Model model, @ModelAttribute Assets assets,@RequestParam("myfile") MultipartFile[] myfile,HttpServletRequest request) {
		List<String> list = assets.getTargetlist();
		
		String status = assets.getStatus();
		if(status.equals("DF")){
			assets.setStatus(AssetsStauts.DRAFT.getValue());
			assets.setValidStatus(AssetsValidStauts.DISABLED.getValue());
		}
		else if(status.equals("PA")){
			assets.setStatus(AssetsStauts.PENDING_APPROVE.getValue());
			assets.setValidStatus(AssetsValidStauts.ENABLED.getValue());
		}
		Long userId = OBSSOUtils.getUserId();
		assets.setUserId(userId);
		assets.setCreatedBy(Long.toString(userId));
		assets.setUpdatedBy(Long.toString(userId));
		try {
			assetsService.add(assets,list,myfile,uploadassetsfiles);
			Long assetsId = assets.getId();
			String path = uploadassetsfiles + assetsId;
		//	String path = request.getServletContext().getRealPath("/uploadfiles/assetfiles/"+assetsId);
			UploadUtil upload = new UploadUtil();
			upload.filesUpload(myfile,path);
			return "redirect:search.do";
		}
		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("addMsg", "上传文件失败，" + e);
			return "assets/search.do";
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "uploadadd")
	public String uploadadd(@ModelAttribute Assets assets) {
		return "assets/loadAssets";
	}

	@RequestMapping(method = RequestMethod.POST, value = "uploadadd")
	public String uploadadd(@RequestParam("myfiles") MultipartFile[] myfiles,Model model, @ModelAttribute Assets assets,HttpServletRequest request) {
		assets.setStatus(AssetsStauts.REQUESTING.getValue());
		assets.setValidStatus(AssetsValidStauts.DISABLED.getValue());
		Long userId = OBSSOUtils.getUserId();
		assets.setUserId(userId);
		assets.setCreatedBy(Long.toString(userId));
		assets.setUpdatedBy(Long.toString(userId));
		try {
			assetsService.add(assets, myfiles, uploadassetsfiles);
			String path = uploadassetsfiles + assets.getId();
			UploadUtil upload = new UploadUtil();
			upload.filesUpload(myfiles,path);
			return "assets/search";
		}
		catch (Exception e) {
			model.addAttribute("addMsg", "上传文件失败，" + e);
			e.printStackTrace();
			return "assets/loadAssets";
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "merge")
	public String merge(Model model, @RequestParam long id) {
		LOG.debug("id{}", ToString.reflectionToString(id));
		Assets assets = this.assetsService.load(id);
		List<InvestorAllowed> investorAlloweds = investorAllowedService.load(id);
		List<String> list=new ArrayList<String>();
		String str;
		for(int i=0;i<investorAlloweds.size();i++){
			str = Long.toString(investorAlloweds.get(i).getTarget());
			list.add(str);
		}
		assets.setTargetlist(list);
		model.addAttribute("assets", assets);
		return "assets/mergeassets";
	}

	@RequestMapping(method = RequestMethod.POST, value = "merge")
	public String merge(Model model, @ModelAttribute Assets assets,@RequestParam("myfile") MultipartFile[] myfile,HttpServletRequest request) {
		LOG.debug("assets+++{}", ToString.reflectionToString(assets));
		LOG.debug("id{}", ToString.reflectionToString(assets.getId()));
		List<String> list = assets.getTargetlist();
		try {
			this.assetsService.merge(assets,list,myfile, uploadassetsfiles);
	//		String path = request.getServletContext().getRealPath("/uploadfiles/assetfiles/"+assets.getId());
			String path = uploadassetsfiles + assets.getId();
			
			
			UploadUtil upload = new UploadUtil();
			upload.filesUpload(myfile,path);
			model.addAttribute("assets", assets);
			return "assets/search";
		}
		catch (Exception e) {
			e.printStackTrace();
			return "assets/mergeassets";
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "search")
	public String searchAssets(Model model, @ModelAttribute Assets assets) {
		model.addAttribute("assets", assets);
		return "assets/search";
	}


	@RequestMapping( value = "query")
	public String searchAssets(Model model, @ModelAttribute Assets assets, @ModelAttribute Paginate paginate) {
		LOG.debug("assets{}", ToString.reflectionToString(assets));
		LOG.debug("paginate{}", ToString.reflectionToString(paginate));
		Long userId = OBSSOUtils.getUserId();
		assets.setUserId(userId);
		System.out.println("++++++++++"+userId);
		paginate = this.assetsService.searchAssets(assets, paginate);
		model.addAttribute("assets", assets);
		model.addAttribute("paginate", paginate);
		return "assets/query";
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "fundsdetail")
	public String fundsdetail(Model model, @RequestParam long id) {
		Assets assets = this.assetsService.load(id);
		InvestorAllowed  investorAllowed = new InvestorAllowed();
		investorAllowed.setAssetId(id);
		List<InvestorAllowed> inve=  this.investorAllowedService.fundsdetail(investorAllowed);
		System.out.println("+++++++++++++"+inve);
		AssetsAttachment assetsAttachment=new AssetsAttachment();
		assetsAttachment.setAssetsId(id);
		assetsAttachment=this.assetsAttachmentService.detail(assetsAttachment);
	/*	AssetsDeal assstsDeal = new AssetsDeal();
		assstsDeal.setAssetsId(id);
		assstsDeal = this.assetsDealService.detail(assstsDeal);*/
		LOG.debug("inve********{}", ToString.reflectionToString(inve));
		/*LOG.debug("assstsDeal{}", ToString.reflectionToString(assstsDeal));*/
		model.addAttribute("assetsAttachment",assetsAttachment);
		model.addAttribute("inve", inve);
		model.addAttribute("assets", assets);
		/*model.addAttribute("assstsDeal", assstsDeal);*/
		return "assets/fundsdetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "mergestatus")
	@ResponseBody
	public AjaxResult mergestatus(@RequestParam long id) {
		LOG.debug("id++++{}", ToString.reflectionToString(id));
		AjaxResult ajaxResult = new AjaxResult();
		try {
			
		this.assetsService.mergestatus(id);
			LOG.debug("id-*---{}", ToString.reflectionToString(id));
			ajaxResult.setResult(AjaxResultStatus.Y.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStatus.N.getValue());
		}
		return ajaxResult;
	}
	
	/*@RequestMapping(method = RequestMethod.POST, value = "checkname")
	@ResponseBody
	public boolean checkname(@RequestParam String name) {
		Long userId = OBSSOUtils.getUserId();
		Assets assets = this.assetsService.searchName(name,userId);
		if (assets == null){
			return true;
		}return false;
	}*/
}
