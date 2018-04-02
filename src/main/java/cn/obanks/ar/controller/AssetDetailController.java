package cn.obanks.ar.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.common.Paginate;

@Controller
@RequestMapping("/assetsdetail")
public class AssetDetailController {

	@Autowired
	private AssetsDealService assetsDealService;

	@Autowired
	private AssetsService assetsService;


	/**
	 * 资产交易详情
	 */
	@RequestMapping( value = "query")
	public String searchCellAssets(Model model, @ModelAttribute Assets assets, @ModelAttribute AssetsDeal assetsDeal, @ModelAttribute Paginate paginate, @RequestParam long id) {
		assets = this.assetsService.load(id);
		assetsDeal.setAssetsId(id);
		paginate = this.assetsDealService.paginateCellAssets(assetsDeal, paginate);
		model.addAttribute("assets", assets);
		model.addAttribute("paginate", paginate);
		return "assetsdetail/query";
	}
	@RequestMapping(method = RequestMethod.GET, value = "search")
	public String search1(Model model, @ModelAttribute Assets assets, @ModelAttribute AssetsDeal assetsDeal, @ModelAttribute Paginate paginate, @RequestParam long id){
		return"assetsdetail/search";
	}
	

}
