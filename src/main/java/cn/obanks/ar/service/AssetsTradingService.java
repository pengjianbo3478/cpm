package cn.obanks.ar.service;
import cn.obanks.ar.model.Assets;
import cn.obanks.common.Paginate;

public interface AssetsTradingService {
	
	Paginate searchAssetsTrading(Assets assets,Paginate paginate);
	
	Assets detail(Long id);
	
	void overStatus(Assets assets);
}
