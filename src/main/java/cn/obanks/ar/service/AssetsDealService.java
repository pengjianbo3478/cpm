package cn.obanks.ar.service;

import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.common.Paginate;

public interface AssetsDealService {

	void add(AssetsDeal assetsDeal);
	
    AssetsDeal load(long id);
	
	void merge(AssetsDeal assetsDeal);
	
	AssetsDeal detail(AssetsDeal assetsDeal);
	
	Paginate paginateCellAssets(AssetsDeal assetsDeal, Paginate paginate);
    
	AssetsDeal loadInvester(AssetsDeal assetsDeal);
	
	//AssetsDeal assetStatusCount(AssetsDeal assetsDeal);
	
	Paginate assetStatusCount(AssetsDeal assetsDeal, Paginate paginate);
	
	AssetsDeal loadAssetsDeal(AssetsDeal assetsDeal);
	
	void updateStatus(AssetsDeal assetsDeal);
	
	void updateAmount(AssetsDeal assetsDeal);
	
}
