package cn.obanks.ar.mapper;

import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.BusinessUser;
@Repository
public interface BusinessUserMapper {
   
	void add(BusinessUser businessUser);
	
	BusinessUser searchPhone(String phone); 
	
	BusinessUser searchEmail(String email); 
	
	void updateCreatedBy(BusinessUser businessUser);
	
	BusinessUser detail(BusinessUser businessUser);
	
	BusinessUser loadBusinessUser(Long ownerId);
	BusinessUser load(long id);
	
	void merge(BusinessUser businessUser);
	
}