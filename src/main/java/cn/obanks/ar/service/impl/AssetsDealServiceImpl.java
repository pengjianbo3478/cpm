package cn.obanks.ar.service.impl;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.enums.DealFuntStatus;
import cn.obanks.ar.mapper.AssetsDealMapper;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.common.Paginate;
import cn.obanks.enums.DeletedFlag;
import cn.obanks.security.web.OBSSOUtils;

@Service
public class AssetsDealServiceImpl  implements AssetsDealService{
	
	@Autowired
	private AssetsDealMapper assetsDealMapper;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(AssetsDeal assetsDeal) {
		Date now = new Date();
//		BigDecimal i = new BigDecimal(13);
//		assetsDeal.setOfferAmount(i);
//		assetsDeal.setAmountUnit("亿");
		assetsDeal.setFundStatus(DealFuntStatus.INTENT_SUB.getValue());
//		assetsDeal.setStatusProgress(2);
		assetsDeal.setDateOfInterest(now);
		assetsDeal.setDueDate(now);
		assetsDeal.setCreatedBy(OBSSOUtils.getUserId().toString());
		assetsDeal.setCreatedDate(now);
		assetsDeal.setUpdatedBy(assetsDeal.getCreatedBy());
		assetsDeal.setUpdatedDate(now);
		assetsDeal.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		this.assetsDealMapper.add(assetsDeal);
		
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly= true)
	public AssetsDeal load(long id) {
		return this.assetsDealMapper.load(id);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void merge(AssetsDeal assetsDeal) {
		if (assetsDeal == null)
			throw new IllegalArgumentException("assetsDeal");
	
		this.assetsDealMapper.merge(assetsDeal);
		
	}

	@Override
	public AssetsDeal detail(AssetsDeal assetsDeal) {
		return this.assetsDealMapper.detail(assetsDeal);
	}
	
	@Override
	public AssetsDeal loadInvester(AssetsDeal assetsDeal) {
		return this.assetsDealMapper.loadInvester(assetsDeal);
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate paginateCellAssets(AssetsDeal assetsDeal, Paginate paginate) {
		if (paginate == null)
			throw new IllegalArgumentException("paginate");
		paginate.setCondition(assetsDeal);
		long count = this.assetsDealMapper.countCellAssets(paginate);
		if (count == 0)
			return paginate;
		paginate.setTotal(count);
		paginate.setData(assetsDealMapper.searchcellAssets(paginate));
		return paginate;
		}

	@Override
	public Paginate assetStatusCount(AssetsDeal assetsDeal, Paginate paginate) {
		if (paginate == null)
			throw new IllegalArgumentException("paginate");
		paginate.setCondition(assetsDeal);
		long count = this.assetsDealMapper.count(paginate);
		if (count == 0)
			return paginate;
		paginate.setTotal(count);
		paginate.setData(assetsDealMapper.assetStatusCount(paginate));
		return paginate;
	}

	/*@Override
	public AssetsDeal assetStatusCount(AssetsDeal assetsDeal) {
		return this.assetsDealMapper.assetStatusCount(assetsDeal);
	}
*/
		
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public AssetsDeal loadAssetsDeal(AssetsDeal assetsDeal) {
		return assetsDealMapper.loadAssetsDeal(assetsDeal);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateStatus(AssetsDeal assetsDeal) {
		assetsDeal.setFundStatus(assetsDeal.getFundStatus());
		assetsDeal.setInvesterId(assetsDeal.getInvesterId());
		assetsDealMapper.updateStatus(assetsDeal);
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateAmount(AssetsDeal assetsDeal) {
		assetsDealMapper.updateAmount(assetsDeal);
	}
}
