package cn.obanks.ar.controller.m;

import java.util.List;

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
import cn.obanks.ar.service.AssetsConcernService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.AjaxResultStatus;
import cn.obanks.common.Item;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Controller
@RequestMapping("/m/assetsconcern")
public class AssetsConcernAction {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsConcernAction.class);
	
	@Autowired
	private AssetsConcernService assetsConcernService;

	@Resource
	private List<Item> financingCategoryList;
	@Resource
	private List<Item> assetUnitSelectList;
	@Autowired
	private AssetsService assetsService;
	@Resource
	private List<Item> Assets_progress;

	@ModelAttribute
	public void init(Model model) {
		model.addAttribute("financingCategoryList", financingCategoryList);
		model.addAttribute("assetUnitSelectList", assetUnitSelectList);
	}	
	
	
	
	/**
	 * 进入我的关注页面
	 */
	@RequestMapping(method = RequestMethod.GET, value = "myconcern")
	public String myconcern(Model model, @ModelAttribute AssetsConcern assetsConcern, @ModelAttribute Paginate paginate) {
		/*assetsConcern.setConcernOwnerId(1L); */
		assetsConcern.setConcernOwnerId(1000L); //ToDo
		paginate.setRecordsPerPage(10);
		paginate.setCurrentPageNum(1);
		LOG.debug("area:paginate:{}", ToString.reflectionToString(assetsConcern), ToString.reflectionToString(paginate));
		assetsConcern.setConcernOwnerId(OBSSOUtils.getUserId()); //
		paginate = assetsConcernService.query(assetsConcern, paginate);
		model.addAttribute("paginate", paginate);
		return "m/myconcernpage";
    }
	/**
	 * 取消关注功能
	 */
	@RequestMapping(method = RequestMethod.POST, value = "mergeDeletedFlag")
	@ResponseBody
	public AjaxResult mergeDeletedFlag(@RequestParam long id) {
		LOG.debug("id++++{}", ToString.reflectionToString(id));
		AjaxResult ajaxResult = new AjaxResult();
		try {
			
		this.assetsConcernService.mergeDeletedFlag(id);
			LOG.debug("id-*---{}", ToString.reflectionToString(id));
			ajaxResult.setResult(AjaxResultStatus.Y.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStatus.N.getValue());
		}
		return ajaxResult;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "changeOfferFlag")
	@ResponseBody
	public AjaxResult changeOfferFlag(Model model, @RequestParam long id) {
		LOG.debug("id-*--*****-{}", ToString.reflectionToString(id));
		AjaxResult ajaxResult = new AjaxResult();
		try {
			Assets assets = this.assetsService.load(id);
			LOG.debug("id-*---{}", ToString.reflectionToString(id));
			this.assetsService.changeOfferFlag(assets);
			LOG.debug("assets*---{}", ToString.reflectionToString(assets));
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}

}
