package cn.obanks.ar.controller.m;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.ar.service.AssetsTradingService;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.common.Item;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

/**
 * 交易管理
 * */

@Controller
@RequestMapping("/m/assetsDeal")
public class AssetsDealsAction {
	@Autowired
	private AssetsDealService assetsDealService;
	
	@Autowired
	private AssetsService assetsService;
	
	@Autowired
	private AssetsTradingService assetsTradingService;
	
	@Autowired
	private BusinessUserService businessUserService;
	
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

	private static final Logger LOG = LoggerFactory.getLogger(AssetsDealsAction.class);
	
	/**
	 * 进入交易管理--出让资产页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "sellproperty")
	public String contactus(Model model,@ModelAttribute Paginate paginate,@ModelAttribute AssetsDeal assetsDeal) {
		paginate.setCurrentPageNum(1);
		paginate.setRecordsPerPage(10);
		LOG.debug("assetsDeal{}", ToString.reflectionToString(paginate));
		long userId = OBSSOUtils.getUserId();
		assetsDeal.setOwnerId(userId);
		paginate = this.assetsDealService.assetStatusCount(assetsDeal, paginate);
		model.addAttribute("assetsDeal", assetsDeal);
		model.addAttribute("paginate", paginate);
		return "m/tradesellpage";
	}
	
	/**
	 * 进入项目管理--资产方页面(出让)
	 */
	@RequestMapping(method = RequestMethod.GET, value = "assetside")
	public String assetSide(Model model, @ModelAttribute Assets assets,@ModelAttribute AssetsDeal assetsDeal, @ModelAttribute Paginate paginate,
			@RequestParam("assetId") String assetId) {
		long id=Long.parseLong(assetId);
		assets = this.assetsService.load(id);
		assetsDeal.setAssetsId(id);
		paginate = this.assetsDealService.paginateCellAssets(assetsDeal, paginate);
		model.addAttribute("assets", assets);
		model.addAttribute("paginate", paginate);
			return "m/assetsidepage";
	}
	
	/**
	 * 进入项目管理--认购资产页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "subscribeproperty")
	public String subscribeProperty(Model model, @ModelAttribute Assets assets, @ModelAttribute Paginate paginate) {
		paginate.setCurrentPageNum(1);
		paginate.setRecordsPerPage(10);
		assets.setUserId(OBSSOUtils.getUserId());
		paginate = this.assetsTradingService.searchAssetsTrading(assets, paginate);
		model.addAttribute("paginate", paginate);
		return "m/tradesubscribepage";
	}
	
	/**
	 * 进入项目管理--资金方页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "fundside")
	public String fundSide(@ModelAttribute Assets assets,Model model){
		/**根据ID查询资产项目*/
		Assets assets1 = assetsTradingService.detail(assets.getId());
		AssetsDeal deal = new AssetsDeal();
		deal.setInvesterId(OBSSOUtils.getUserId());
		deal.setAssetsId(assets.getId());
		/**根据当前登录用户查询认购所有者*/
		AssetsDeal assetsDeal = assetsDealService.loadAssetsDeal(deal);
		/**根据资产所有者ID查询资产所有者*/
		BusinessUser businessUser= businessUserService.loadBusinessUser(assetsDeal.getOwnerId());
		model.addAttribute("assets1", assets1);
		model.addAttribute("assetsDeal", assetsDeal);
		model.addAttribute("businessUser", businessUser);
		return "m/fundsidepage";
	}

}
