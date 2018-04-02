package cn.obanks.ar.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.enums.DeletedFlagStatus;
import cn.obanks.ar.mapper.AssetsConcernMapper;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsConcern;
import cn.obanks.ar.service.AssetsConcernService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.enums.DeletedFlag;
import cn.obanks.security.web.OBSSOUtils;

@Service
public class AssetsConcernServiceImpl implements AssetsConcernService {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsConcernService.class);
	@Autowired
	private AssetsConcernMapper assetsConcernMapper;
	@Autowired
	private AssetsService assetsService;

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public AssetsConcern load(long id) {
		return this.assetsConcernMapper.load(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(AssetsConcern assetsConcern) {
		Date now = new Date();
		assetsConcern.setCreatedBy(OBSSOUtils.getUserId().toString());
		assetsConcern.setCreatedDate(now);
		assetsConcern.setUpdatedBy(assetsConcern.getCreatedBy());
		assetsConcern.setUpdatedDate(now);
		assetsConcern.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		this.assetsConcernMapper.add(assetsConcern);
		LOG.debug("assetsConcern:{}", ToString.reflectionToString(assetsConcern));
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void remove(long id) {
		this.assetsConcernMapper.remove(id);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate search(AssetsConcern assetsConcern, Paginate paginate) {
		if (paginate == null)
			throw new IllegalArgumentException("paginate");
		paginate.setCondition(assetsConcern);
		long count = this.assetsConcernMapper.count(paginate);
		paginate.setTotal(count);
		paginate.setData(assetsConcernMapper.search(paginate));
		return paginate;
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate query(AssetsConcern assetsConcern, Paginate paginate) {
		if (paginate == null)
			throw new IllegalArgumentException("paginate");
		paginate.setCondition(assetsConcern);
		long count = this.assetsConcernMapper.queryCount(paginate);
		paginate.setTotal(count);
		paginate.setData(assetsConcernMapper.query(paginate).values());
		return paginate;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void mergeDeletedFlag(long id) {
		AssetsConcern assetsConcern = assetsConcernMapper.load(id);
		LOG.debug("assetsConcern222{}", ToString.reflectionToString(assetsConcern));
		if (assetsConcern.getDeletedFlag().equals(DeletedFlagStatus.NORMAL.getValue())) {
			assetsConcern.setDeletedFlag(DeletedFlagStatus.DELETED.getValue());
		} else {
			assetsConcern.getDeletedFlag().equals(DeletedFlagStatus.NORMAL.getValue());

		}
		LOG.debug("assetsConcern222{}", ToString.reflectionToString(assetsConcern));
		this.assetsConcernMapper.mergeDeletedFlag(assetsConcern);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void changeConcernFlags(List<Long> assetsId)
	{
		Long concernOwnerId = OBSSOUtils.getUserId();
		for(Long id : assetsId)
		{
	        AssetsConcern assetsConcern = new AssetsConcern();
	     	assetsConcern.setAssetsId(id);
	    	assetsConcern.setConcernOwnerId(concernOwnerId);
	    	changeConcernFlag(assetsConcern);
		}
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void changeConcernFlag(AssetsConcern assetsConcern) {
		LOG.debug("assetsConcern:{}", ToString.reflectionToString(assetsConcern));
		System.out.println("##########################+" + assetsConcern.getAssetsId());
		System.out.println("##########################+" + assetsConcern.getDeletedFlag());
		Assets assets = this.assetsService.load(assetsConcern.getAssetsId());
		Long concernOwnerId = OBSSOUtils.getUserId();
		assetsConcern.setConcernOwnerId(concernOwnerId);
		assetsConcern = this.assetsConcernMapper.loadConcern(assetsConcern);
		// 灰色的看有没有记录，如果没有，先增加；有的话再改标识。如果是D则代表已经取消关注了，那么改成关注N。如果是N则取消关注改成D
		if (assetsConcern == null) {
			AssetsConcern assetsConcern1 = new AssetsConcern();
			assetsConcern1.setAssetsId(assets.getId());
			assetsConcern1.setConcernOwnerId(concernOwnerId);
			Date now = new Date();
			assetsConcern1.setCreatedBy(concernOwnerId.toString());
			assetsConcern1.setCreatedDate(now);
			assetsConcern1.setUpdatedBy(assetsConcern1.getCreatedBy());
			assetsConcern1.setUpdatedDate(now);
			assetsConcern1.setDeletedFlag(DeletedFlag.NORMAL.getValue());
			this.assetsConcernMapper.add(assetsConcern1);
			LOG.debug("assets:{}", ToString.reflectionToString(assets));
			LOG.debug("关注成功");
			LOG.debug("assetsConcern1:{}", ToString.reflectionToString(assetsConcern1));
		} else {
			if (assetsConcern.getDeletedFlag().equals("D")) {
				assetsConcern.setDeletedFlag("N");
				assetsConcern.setUpdatedBy(concernOwnerId.toString());
				Date now = new Date();
				assetsConcern.setUpdatedDate(now);
				this.assetsConcernMapper.mergeDeletedFlag(assetsConcern);
				LOG.debug("关注成功，修改标识成功");
			} 
		}
		LOG.debug("assetsConcern:{}", ToString.reflectionToString(assetsConcern));
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void cancelConcernFlag(AssetsConcern assetsConcern) {
		Long concernOwnerId = OBSSOUtils.getUserId();
		assetsConcern.setConcernOwnerId(concernOwnerId);
		assetsConcern = this.assetsConcernMapper.loadConcern(assetsConcern);
		assetsConcern.setDeletedFlag("D");
		assetsConcern.setUpdatedBy(concernOwnerId.toString());
		Date now = new Date();
		assetsConcern.setUpdatedDate(now);
		LOG.debug("取消关注成功");
		this.assetsConcernMapper.mergeDeletedFlag(assetsConcern);

	}

	@Override
	public AssetsConcern detail(AssetsConcern assetsConcern) {
		return assetsConcernMapper.detail(assetsConcern);
	}

}
