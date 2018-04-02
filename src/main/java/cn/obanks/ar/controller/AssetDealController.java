package cn.obanks.ar.controller;

import java.util.Date;
import java.util.List;

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
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Controller
@RequestMapping("/assetsdeal")
public class AssetDealController {
	private static final Logger LOG = LoggerFactory.getLogger(AssetDealController.class);

	@Autowired
	private AssetsDealService assetsDealService;

	@Autowired
	private AssetsService assetsService;

	/**
	 * 资产状态修改
	 */
	@RequestMapping(method = RequestMethod.POST, value = "fundsselldetial")
	@ResponseBody
	public AjaxResult merge(Model model, @ModelAttribute Assets assets) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			this.assetsService.mergeAssetsStatus(assets);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}

	/**
	 * 资产起止日修改
	 * 
	 */
	@RequestMapping(method = RequestMethod.POST, value = "merge")
	public String updateTime(Model model, @ModelAttribute Assets assets) {
		long userId = OBSSOUtils.getUserId();
		assets.setUserId(userId);
		Date start = assets.getDateOfInterest();
		Date end = assets.getDueDate();
		if (end.before(start)) {
		model.addAttribute("msg", "起息日不得大于到期日，请重新选择！");
		return "redirect:http://localhost:8080/cpm/assetsdetail/search.do?id=1051";
		} 
		else{
			this.assetsService.mergeTime(assets);
			model.addAttribute("assets", assets);
			return "redirect:http://localhost:8080/cpm/assetsdetail/search.do?id=1051";
		}
		
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "merge")
	public String merge(Model model, @RequestParam long id) {
		Assets assets = this.assetsService.load(id);
		model.addAttribute("assets", assets);
		return "assetsdeal/query";
	}
	/**
	 * 出让资产查询
	 */
	@RequestMapping(value = "query")
	public String assetStatusCount(Model model, @ModelAttribute AssetsDeal assetsDeal, @ModelAttribute Paginate paginate) {
		LOG.debug("assetsDeal{}", ToString.reflectionToString(paginate));
		long userId = OBSSOUtils.getUserId();
		assetsDeal.setOwnerId(userId);
		paginate = this.assetsDealService.assetStatusCount(assetsDeal, paginate);
		model.addAttribute("assetsDeal", assetsDeal);
		model.addAttribute("paginate", paginate);
		return "assetsdeal/query";
	}

	@RequestMapping(method = RequestMethod.GET, value = "search")
	public String search(){
		return"assetsdeal/search";
	}


	@RequestMapping(method = RequestMethod.POST, value = "updateamount")
	@ResponseBody
	public AjaxResult updateAmount(@ModelAttribute AssetsDeal assetsDeal) {
		System.out.println("#################:"+assetsDeal.getId());
		System.out.println("@@@@@@@@@@@:"+assetsDeal.getOfferAmount());
		AjaxResult ajaxResult = new AjaxResult();
		try {
			assetsDealService.updateAmount(assetsDeal);
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;

	}

	@RequestMapping(method = RequestMethod.POST, value = "updateRemind")
	@ResponseBody
	public AjaxResult updateRemind(Model model, @RequestParam List<Long> id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			System.out.println("***********");
			this.assetsService.updateRemind(id); //传过来的是投资人的ID
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			LOG.debug("exception{}", ToString.reflectionToString(e));
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}	

	@RequestMapping(method = RequestMethod.POST, value = "updateRemindOne")
	@ResponseBody
	public AjaxResult updateRemindOne(Model model, @RequestParam long id) {
		AjaxResult ajaxResult = new AjaxResult();
		try {
			System.out.println("***********"+id);
			this.assetsService.updateRemindOne(id); 
			ajaxResult.setResult(AjaxResultStauts.YES.getValue());
		} catch (Exception e) {
			ajaxResult.setResult(AjaxResultStauts.NO.getValue());
		}
		return ajaxResult;
	}
}
