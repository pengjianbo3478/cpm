package cn.obanks.ar.controller.m;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import cn.obanks.ar.controller.AssetsVo;
import cn.obanks.ar.enums.AjaxResultStauts;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsConcern;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.model.AssetsViewJournal;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.model.InvestorAllowed;
import cn.obanks.ar.service.AssetsConcernService;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.ar.service.AssetsViewJournalService;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.service.InvestorAllowedService;
import cn.obanks.ar.utils.UploadUtil;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.Item;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Controller
@RequestMapping("/m/assets")
public class AssetsAction {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsAction.class);

	@Value("${uploadassetsfiles}")  
	private String uploadassetsfiles;

	
	@Autowired
	private AssetsService assetsService;
	
	@Autowired
	private InvestorAllowedService investorAllowedService;
	
	@Autowired
	private BusinessUserService businessUserService;
	
	@Autowired
	private AssetsViewJournalService assetsViewJournalService;
	
	@Autowired
	private AssetsDealService assetsDealService;
	
	@Autowired
	private AssetsConcernService assetsConcernService;
	
	@Resource
	private List<Item> financingCategoryList;
	
	@Resource
	private List<Item> assetUnitSelectList;
	
	@Resource
	private List<Item> assetTypelist;
	
	@Resource
	private List<Item> Assets_progress;
	
	
	@ModelAttribute
	public void init(Model model) {
		model.addAttribute("assetTypelist", assetTypelist);
		model.addAttribute("financingCategoryList", financingCategoryList);
		model.addAttribute("assetUnitSelectList", assetUnitSelectList);
		model.addAttribute("Assets_progress", Assets_progress);
	}
	/**
	 * 进入资产列表页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "assetlist")
	public String assetlist(Model model, @ModelAttribute AssetsVo assetsVo, @ModelAttribute Paginate paginate) {
		paginate.setRecordsPerPage(10);
		paginate.setCurrentPageNum(1);
		LOG.debug("assetsVo{}", ToString.reflectionToString(assetsVo));
		/*assetsVo.setUserID(1L);//ToDo*/	
		Set<Integer> termMin = new HashSet<Integer>();
		termMin.add(999);
		assetsVo.setTermMin(termMin);
		Set<Double> assetScales = new HashSet<Double>();
		assetScales.add((double) 999);
		assetsVo.setAssetScales(assetScales);
		Set<Double> yieldMin = new HashSet<Double>();
		yieldMin.add((double) 999);
		assetsVo.setYieldMin(yieldMin);
		Set<Integer> financingCategory = new HashSet<Integer>();
		financingCategory.add(999);
		assetsVo.setFinancingCategory(financingCategory);
		model.addAttribute("assetsVo", assetsVo);
		Set<Integer> assetType = new HashSet<Integer>();
		assetType.add(999);
		assetsVo.setAssetType(assetType);

		assetsVo.setUserID(OBSSOUtils.getUserId());//ToDo
		LOG.debug("assetsVo{}", ToString.reflectionToString(assetsVo));

		paginate = this.assetsService.search(assetsVo, paginate);
		LOG.debug("paginate{}", ToString.reflectionToString(paginate));
		model.addAttribute("paginate", paginate);
		model.addAttribute("assetsVo", assetsVo);
			return "m/assetlistpage";
	}
	
	/**
	 * 资产条件查询
	 */
	@RequestMapping(method = RequestMethod.POST, value = "search")
	public String search(Model model, @ModelAttribute AssetsVo assetsVo, @ModelAttribute Paginate paginate) {
		assetsVo.setUserID(OBSSOUtils.getUserId());//ToDo
		LOG.debug("assetsVo{}", ToString.reflectionToString(assetsVo));
		paginate = this.assetsService.search(assetsVo, paginate);
		LOG.debug("paginate{}", ToString.reflectionToString(paginate));
		model.addAttribute("paginate", paginate);
		model.addAttribute("assetsVo", assetsVo);
		return "m/assetlistpage";
	}
	
	/**
	 * 资产修改
	 * @param model
	 * @param assets
	 * @param myfile
	 * @param request
	 * @return
	 */
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
			return "m/assetlistpage";
		}
		catch (Exception e) {
			e.printStackTrace();
			return "assets/mergeassets";
		}
	}
	
	
	/**
	 * 进入项目详情列表
	 */
	@RequestMapping(method = RequestMethod.GET, value = "projectdetails")
	public String projectdetails(Model model, @ModelAttribute Assets assets1) {
		long id1 =assets1.getId();
		Assets ass = this.assetsService.load(id1);
		//得到意向认购表详情
		AssetsDeal assetsDeal = new AssetsDeal();
		assetsDeal.setAssetsId(id1);
		assetsDeal.setOwnerId(ass.getUserId());
		Long currentUserId = OBSSOUtils.getUserId(); //当前登录用户ID
		assetsDeal.setInvesterId(currentUserId);
		assetsDeal = this.assetsDealService.detail(assetsDeal);
		LOG.debug("assetsDeal{}", ToString.reflectionToString(assetsDeal));
		//发布项目者的详情
		BusinessUser businessUser = new BusinessUser();
		businessUser.setId(ass.getUserId());
		businessUser=this.businessUserService.detail(businessUser);
		LOG.debug("businessUser{}", ToString.reflectionToString(businessUser));
		//浏览一次，就加一条记录。然后统计有相同assetId的数目
		AssetsViewJournal assetsViewJournal = new AssetsViewJournal();
		assetsViewJournal.setAssetId(id1);
		assetsViewJournal.setViewerId(currentUserId);
		if(assetsViewJournal.getViewerId() != null)
		this.assetsViewJournalService.add(assetsViewJournal);
		
		assets1.setUserId(currentUserId);
		Assets assets = this.assetsService.searchTotal(assets1);
		model.addAttribute("assets", assets);
		model.addAttribute("assetsDeal", assetsDeal);
		model.addAttribute("businessUser", businessUser);
			return "m/projectdetailspage";
	}

	/*
	 * 进入资产发布页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "assetrelease")
	public String assetrelease(Model model, @ModelAttribute Assets assets, @ModelAttribute Paginate paginate) {
		LOG.debug("assets{}", ToString.reflectionToString(assets));
		LOG.debug("paginate{}", ToString.reflectionToString(paginate));
		paginate.setCurrentPageNum(1);
		paginate.setRecordsPerPage(10);
		Long userId = OBSSOUtils.getUserId();
		assets.setUserId(userId);
		System.out.println("++++++++++"+userId);
		paginate = this.assetsService.searchAssets(assets, paginate);
		model.addAttribute("assets", assets);
		model.addAttribute("paginate", paginate);
		return "m/assetreleasepage";
	}
	/**
	 * 项目信息修改页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "projectmanage")
	public String projectmanage(Model model,@ModelAttribute Assets assets,@RequestParam String status, @RequestParam long id) {
		LOG.debug("id{}", ToString.reflectionToString(id));
		assets = this.assetsService.load(id);
		List<InvestorAllowed> investorAlloweds = investorAllowedService.load(id);
		List<String> list=new ArrayList<String>();
		String str;
		for(int i=0;i<investorAlloweds.size();i++){
			str = Long.toString(investorAlloweds.get(i).getTarget());
			list.add(str);
		}
		assets.setTargetlist(list);
		model.addAttribute("assets", assets);
		model.addAttribute("status", status);
		return "m/projectmanagepage";
    }
	/**
	 * 意向认购
	 */
	@RequestMapping(method = RequestMethod.POST, value = "changeOfferFlag")
	@ResponseBody
	public AjaxResult changeOfferFlag(Model model, @RequestParam long id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			Assets assets = this.assetsService.load(id);
			this.assetsService.changeOfferFlag(assets);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			LOG.debug("Exception{}", ToString.reflectionToString(e));
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}
	/**
	 * 关注功能
	 */
	@RequestMapping(method = RequestMethod.POST, value = "changeConcernFlag")
	@ResponseBody
	public AjaxResult changeConcernFlag(Model model, @RequestParam long id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			AssetsConcern assetsConcern = new AssetsConcern();
			assetsConcern.setAssetsId(id);
			this.assetsConcernService.changeConcernFlag(assetsConcern);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}
}