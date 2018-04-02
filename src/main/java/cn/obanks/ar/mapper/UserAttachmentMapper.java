package cn.obanks.ar.mapper;

import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.UserAttachment;
@Repository
public interface UserAttachmentMapper {
	void add(UserAttachment userAttachment);
	
}