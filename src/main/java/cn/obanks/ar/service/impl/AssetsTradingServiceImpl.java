package cn.obanks.ar.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.mapper.AssetsTradingMapper;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.service.AssetsTradingService;
import cn.obanks.common.Paginate;

@Service
public class AssetsTradingServiceImpl implements AssetsTradingService {
	@Autowired
	private  AssetsTradingMapper assetsTradingMapper;


	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate searchAssetsTrading(Assets assets, Paginate paginate) {
		if (paginate == null) throw new IllegalArgumentException("paginate");
		paginate.setCondition(assets);
		long count = this.assetsTradingMapper.assetsTradingCount(paginate);
		if (count == 0) return paginate;
		paginate.setTotal(count);
		paginate.setData(assetsTradingMapper.searchAssetsTrading(paginate));
		return paginate;
	}


	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Assets detail(Long id) {
		return assetsTradingMapper.detail(id);
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void overStatus(Assets assets) {
		assetsTradingMapper.overStatus(assets);
	}
}
