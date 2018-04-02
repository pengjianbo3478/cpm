package cn.obanks.ar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.obanks.ar.mapper.UserAttachmentMapper;
import cn.obanks.ar.model.UserAttachment;
import cn.obanks.ar.service.UserAttachmentService;

@Service
public class UserAttachmentServiceImpl implements UserAttachmentService{
	@Autowired
	private UserAttachmentMapper userAttachmentMapper;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(UserAttachment userAttachment) {
		userAttachmentMapper.add(userAttachment);
	}
	
}
