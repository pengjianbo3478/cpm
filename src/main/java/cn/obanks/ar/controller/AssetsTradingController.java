package cn.obanks.ar.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.obanks.ar.enums.AjaxResultStauts;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsTradingService;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.common.AjaxResult;
import cn.obanks.common.Paginate;
import cn.obanks.security.web.OBSSOUtils;

@RequestMapping(value="/assetstrading")
@Controller
public class AssetsTradingController {
@Autowired
private AssetsTradingService assetsTradingService;

@Autowired
private AssetsDealService assetsDealService;

@Autowired
private BusinessUserService businessUserService;

@RequestMapping(method = RequestMethod.GET, value = "search")
public String search(){
	return"assetstrading/search";
}
@RequestMapping(value = "query")
public String assetsrecord(@ModelAttribute Assets assets,@ModelAttribute Paginate paginate,Model model){
	
	assets.setUserId(OBSSOUtils.getUserId());
	paginate = this.assetsTradingService.searchAssetsTrading(assets, paginate);
	return "assetstrading/query";
}

@RequestMapping(method = RequestMethod.GET, value = "detail")
public String detail(@ModelAttribute Assets assets,Model model){
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
	return "assetstrading/detail";
}

@RequestMapping(method = RequestMethod.POST, value = "updatestatus")
@ResponseBody
public AjaxResult updateStatus(@ModelAttribute AssetsDeal assetsDeal){
	AjaxResult ajaxResult = new AjaxResult();
	try {
		assetsDealService.updateStatus(assetsDeal);
		ajaxResult.setResult(AjaxResultStauts.YES.getValue());
	} catch (Exception e) {
		ajaxResult.setResult(AjaxResultStauts.NO.getValue());
	}
	return ajaxResult;
	
}
@RequestMapping(method = RequestMethod.POST, value = "over")
@ResponseBody
public AjaxResult over(@ModelAttribute Assets assets){
	AjaxResult ajaxResult = new AjaxResult();
	try {
		assetsTradingService.overStatus(assets);
		ajaxResult.setResult(AjaxResultStauts.YES.getValue());
	} catch (Exception e) {
		ajaxResult.setResult(AjaxResultStauts.NO.getValue());
	}
	return ajaxResult;
}

}
