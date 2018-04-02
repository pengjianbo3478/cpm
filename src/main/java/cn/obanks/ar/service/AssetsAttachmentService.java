package cn.obanks.ar.service;

import cn.obanks.ar.model.AssetsAttachment;
import cn.obanks.ar.model.UserAttachment;

public interface AssetsAttachmentService {
	public void add(UserAttachment userAttachment);
	 
	AssetsAttachment load(long id);
	AssetsAttachment detail(AssetsAttachment assetsAttachment);
	
}
