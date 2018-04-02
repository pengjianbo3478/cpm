package cn.obanks.ar.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.obanks.ar.enums.AjaxResultStauts;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsConcern;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.model.AssetsViewJournal;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.AssetsConcernService;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.ar.service.AssetsViewJournalService;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.Item;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Controller
@RequestMapping("/")
public class IndexController {
	private static final Logger LOG = LoggerFactory.getLogger(IndexController.class);
	@Autowired
	private AssetsService assetsService;
	@Autowired
	private BusinessUserService businessUserService;
	@Autowired
	private AssetsDealService assetsDealService;
	@Autowired
	private AssetsConcernService assetsConcernService;
	@Autowired
	private AssetsViewJournalService assetsViewJournalService;
	
	@Resource
	private List<Item> financingCategoryList;
	@Resource
	private List<Item> assetUnitSelectList;
	@Resource
	private List<Item> targetTypeList;

	@ModelAttribute
	public void init(Model model) {
		model.addAttribute("financingCategoryList", financingCategoryList);
		model.addAttribute("assetUnitSelectList", assetUnitSelectList);
		model.addAttribute("targetTypeList", targetTypeList);
	}

	@RequestMapping(method = RequestMethod.GET, value = "index")
	public String query(Model model, @ModelAttribute AssetsVo assetsVo, @ModelAttribute Paginate paginate) {
//		LOG.debug("UserIdTest:{}", ToString.reflectionToString(OBSSOUtils.getUserId()));
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

		model.addAttribute("paginate", paginate);
		model.addAttribute("assetsVo", assetsVo);
		return "index/index";
	}

	@RequestMapping(method = RequestMethod.GET, value = "search")
	public String list(Model model, @ModelAttribute AssetsVo assetsVo, @ModelAttribute Paginate paginate) {
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
		return "index/list";
	}

	@RequestMapping(method = RequestMethod.POST, value = "search")
	public String search(Model model, @ModelAttribute AssetsVo assetsVo, @ModelAttribute Paginate paginate) {

		assetsVo.setUserID(OBSSOUtils.getUserId());//ToDo
		
		LOG.debug("assetsVo{}", ToString.reflectionToString(assetsVo));

		paginate = this.assetsService.search(assetsVo, paginate);
		LOG.debug("paginate{}", ToString.reflectionToString(paginate));
		model.addAttribute("paginate", paginate);
		model.addAttribute("assetsVo", assetsVo);
		return "index/list";
	}

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

	@RequestMapping(method = RequestMethod.POST, value = "changeOfferFlags")
	@ResponseBody
	public AjaxResult changeOfferFlags(Model model, @RequestParam List<Long> id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			this.assetsService.changeOfferFlags(id);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			LOG.debug("exception{}", ToString.reflectionToString(e));
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}

	@RequestMapping(method = RequestMethod.POST, value = "changeConcernFlags")
	@ResponseBody
	public AjaxResult changeConcernFlags(Model model, @RequestParam List<Long> id) {
		LOG.debug("id{}", ToString.reflectionToString(id));

		AjaxResult ajaxResult = new AjaxResult();
		try {
			this.assetsConcernService.changeConcernFlags(id);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {

			LOG.debug("exception{}", ToString.reflectionToString(e));

			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "cancelConcernFlag")
	@ResponseBody
	public AjaxResult cancelConcernFlag(Model model, @RequestParam long id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			AssetsConcern assetsConcern = new AssetsConcern();
			assetsConcern.setAssetsId(id);
			this.assetsConcernService.cancelConcernFlag(assetsConcern);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}

	
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
		this.assetsViewJournalService.add(assetsViewJournal);
		assets1.setUserId(currentUserId);
		Assets assets = this.assetsService.searchTotal(assets1);
		//assets.setOfferCount(assets1.getOfferCount());
		//assets.setConcernCount(assets1.getConcernCount());
		model.addAttribute("currentUserId", currentUserId);
		model.addAttribute("assets", assets);
		model.addAttribute("assetsDeal", assetsDeal);
		model.addAttribute("businessUser", businessUser);
		return "index/projectdetails";
	}
}

