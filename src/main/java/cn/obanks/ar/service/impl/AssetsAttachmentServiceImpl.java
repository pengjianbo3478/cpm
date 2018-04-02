package cn.obanks.ar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.mapper.AssetsAttachmentMapper;
import cn.obanks.ar.mapper.UserAttachmentMapper;
import cn.obanks.ar.model.AssetsAttachment;
import cn.obanks.ar.model.UserAttachment;
import cn.obanks.ar.service.AssetsAttachmentService;

@Service
public class AssetsAttachmentServiceImpl implements AssetsAttachmentService{
	@Autowired
	private UserAttachmentMapper userAttachmentMapper;
	@Autowired 
	private AssetsAttachmentMapper assetsAttachmentMapper;
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(UserAttachment userAttachment) {
		userAttachmentMapper.add(userAttachment);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public AssetsAttachment load(long id) {
		AssetsAttachment assetsAttachment=this.assetsAttachmentMapper.load(id);
		return assetsAttachment;
	}

	@Override
	public AssetsAttachment detail(AssetsAttachment assetsAttachment) {
		return  assetsAttachment=this.assetsAttachmentMapper.detail(assetsAttachment);
	}
	
}
