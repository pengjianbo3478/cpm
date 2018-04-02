package cn.obanks.ar.mapper;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.Assets;
import cn.obanks.common.Paginate;

@Repository
public interface AssetsTradingMapper {
	
	List<Assets> searchAssetsTrading(Paginate paginate);
	
	Assets detail(Long id);

	long assetsTradingCount(Paginate paginate);
	
	void overStatus(Assets assets);

}
