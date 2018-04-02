package cn.obanks.ar.service;

import org.springframework.web.multipart.MultipartFile;

import cn.obanks.ar.model.BusinessUser;

public interface BusinessUserService {

	public void add(BusinessUser businessUser,MultipartFile[] myfiles);
	
	public BusinessUser searchPhone(String phone);
	
	public BusinessUser searchEmail(String email);

	public void resetPassword(String phone, String acctPassword)throws Exception; 
	
	BusinessUser detail(BusinessUser businessUser);
	
	BusinessUser loadBusinessUser(Long ownerId);
	
	public BusinessUser load(long id);
	
	void merge(BusinessUser businessUser,MultipartFile[] myfile);
}
