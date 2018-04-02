package cn.obanks.ar.service.impl;


import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.mapper.AssetsViewJournalMapper;
import cn.obanks.ar.model.AssetsViewJournal;
import cn.obanks.ar.service.AssetsViewJournalService;
import cn.obanks.common.ToString;
import cn.obanks.enums.DeletedFlag;
import cn.obanks.security.web.OBSSOUtils;

@Service
public class AssetsViewJournalServiceImpl implements AssetsViewJournalService {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsViewJournalService.class);
	@Autowired
	private AssetsViewJournalMapper assetsViewJournalMapper ;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(AssetsViewJournal assetsViewJournal) {
		Date now = new Date();
		assetsViewJournal.setCreatedBy(OBSSOUtils.getUserId().toString());
		assetsViewJournal.setCreatedDate(now);
		assetsViewJournal.setUpdatedBy(assetsViewJournal.getCreatedBy());
		assetsViewJournal.setUpdatedDate(now);
		assetsViewJournal.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		//如果是同一个人，间隔半小时之内，就不能添加add。查询半小时内是否有记录，没有则添加，有就不添加。
		if(this.assetsViewJournalMapper.searchSameView(assetsViewJournal)==0){
			this.assetsViewJournalMapper.add(assetsViewJournal);
		}
		else{
			LOG.debug("&&&&&&&&&&&&&&&&&&&&&&&半小时内该已经浏览过");
			}
		LOG.debug("assetsViewJournal:{}", ToString.reflectionToString(assetsViewJournal));
	}

	
}
