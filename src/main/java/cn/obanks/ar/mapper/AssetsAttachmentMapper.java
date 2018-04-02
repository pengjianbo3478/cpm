package cn.obanks.ar.mapper;

import org.springframework.stereotype.Repository;
import cn.obanks.ar.model.AssetsAttachment;
@Repository
public interface AssetsAttachmentMapper {
	void add(AssetsAttachment assetsAttachment);
	
	AssetsAttachment load(long id);
	AssetsAttachment detail(AssetsAttachment assetsAttachment);
}