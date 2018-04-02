package cn.obanks.ar.service.impl;

import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import cn.obanks.ar.enums.RegistStatus;
import cn.obanks.ar.enums.UserStatus;
import cn.obanks.ar.mapper.BusinessUserMapper;
import cn.obanks.ar.mapper.UserAttachmentMapper;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.model.UserAttachment;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.utils.Md5PasswordUtil;
import cn.obanks.enums.AcctType;
import cn.obanks.enums.DeletedFlag;
import cn.obanks.mapper.CredentialMapper;
import cn.obanks.model.Credential;

@Service
public class BusinessUserServiceImpl implements BusinessUserService {
	private static final Logger LOG = LoggerFactory.getLogger(BusinessUserServiceImpl.class);
	@Autowired
	private BusinessUserMapper businessUserMapper;
	@Autowired
	private CredentialMapper credentialMapper;
	@Autowired
	private UserAttachmentMapper attachmentMapper;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(BusinessUser businessUser, MultipartFile[] myfiles) {
		int length = myfiles.length;
		businessUser.setCreatedBy("1");
		businessUser.setRegisterStatus(RegistStatus.ENABLE.getValue());
		businessUser.setStatus(UserStatus.PENDING_AUDIT.getValue());
		businessUser.setRegisterTime(new Date());
		businessUser.setCreatedDate(businessUser.getRegisterTime());
		businessUser.setUpdatedBy(businessUser.getCreatedBy());
		businessUser.setUpdatedDate(businessUser.getRegisterTime());
		businessUser.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		businessUserMapper.add(businessUser);
		businessUser.setCreatedBy(businessUser.getId().toString());
		businessUserMapper.updateCreatedBy(businessUser);
		UserAttachment userAttachment = new UserAttachment();
		MultipartFile file0 = myfiles[0];
		userAttachment.setUserId(businessUser.getId());
		userAttachment.setCategory("身份证");
		userAttachment.setFilename(file0.getOriginalFilename());
		userAttachment.setCreatedBy(businessUser.getId().toString());
		userAttachment.setCreatedDate(businessUser.getRegisterTime());
		userAttachment.setUpdatedBy(businessUser.getId().toString());
		userAttachment.setUpdatedDate(businessUser.getRegisterTime());
		userAttachment.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		attachmentMapper.add(userAttachment);
	//	MultipartFile file1 = myfiles[1];
		userAttachment.setUserId(businessUser.getId());
		userAttachment.setCategory("名片");
		userAttachment.setFilename(businessUser.getId().toString()+".JPG");
		userAttachment.setCreatedBy(businessUser.getId().toString());
		userAttachment.setCreatedDate(businessUser.getRegisterTime());
		userAttachment.setUpdatedBy(businessUser.getId().toString());
		userAttachment.setUpdatedDate(businessUser.getRegisterTime());
		userAttachment.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		attachmentMapper.add(userAttachment);
		if(length>2){
			if (myfiles[2] != null) {
				MultipartFile file2 = myfiles[2];
				userAttachment.setUserId(businessUser.getId());
				userAttachment.setCategory("其他");
				userAttachment.setFilename(file2.getOriginalFilename());
				userAttachment.setCreatedBy(businessUser.getId().toString());
				userAttachment.setCreatedDate(businessUser.getRegisterTime());
				userAttachment.setUpdatedBy(businessUser.getId().toString());
				userAttachment.setUpdatedDate(businessUser.getRegisterTime());
				userAttachment.setDeletedFlag(DeletedFlag.NORMAL.getValue());
				attachmentMapper.add(userAttachment);
			}
		}
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public BusinessUser searchPhone(String phone) {
		return businessUserMapper.searchPhone(phone);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public BusinessUser searchEmail(String email) {
		return businessUserMapper.searchEmail(email);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void resetPassword(String phone, String acctPassword) throws Exception {
		Credential acct = credentialMapper.getByAcctCode(phone);
		if (acct == null)
			throw new Exception("手机号码不存在");
		Credential credential = new Credential();
		Md5PasswordUtil md5 = new Md5PasswordUtil();
		String password = md5.encode(acctPassword);
		credential.setAcctPassword(password);
		credential.setUpdatedBy(acct.getUserId());
		credential.setUpdatedDate(new Date());
		credential.setAcctType(AcctType.CPM.getValue());
		credential.setUserId(acct.getUserId());
		try {
			credentialMapper.merge(credential);
		} catch (Exception e) {
			LOG.error(e.getMessage(),e);
			throw new Exception("修改失败");
		}
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public BusinessUser detail(BusinessUser businessUser) {
		return this.businessUserMapper.detail(businessUser);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public BusinessUser loadBusinessUser(Long ownerId) {
		return businessUserMapper.loadBusinessUser(ownerId);
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public BusinessUser load(long id) {
		BusinessUser businessUser = businessUserMapper.load(id);
		return businessUser;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void merge(BusinessUser businessUser, MultipartFile[] myfile) {
		businessUser.setUpdatedDate(new Date());
		UserAttachment userAttachment = new UserAttachment();
		businessUserMapper.merge(businessUser);
		MultipartFile file1 = myfile [0];
		userAttachment.setUserId(businessUser.getId());
		userAttachment.setCategory("名片");
		userAttachment.setFilename(file1.getOriginalFilename());
		userAttachment.setCreatedBy(businessUser.getId().toString());
		userAttachment.setCreatedDate(new Date());
		userAttachment.setUpdatedBy(businessUser.getId().toString());
		userAttachment.setUpdatedDate(new Date());
		userAttachment.setDeletedFlag(DeletedFlag.NORMAL.getValue());
		attachmentMapper.add(userAttachment);
	}
}
