package cn.obanks.ar.service.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import cn.obanks.ar.controller.AssetsVo;
import cn.obanks.ar.enums.AssetsStauts;
import cn.obanks.ar.enums.DealFuntStatus;
import cn.obanks.ar.mapper.AssetsAttachmentMapper;
import cn.obanks.ar.mapper.AssetsMapper;
import cn.obanks.ar.model.Assets;
import cn.obanks.ar.model.AssetsAttachment;
import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.ar.model.BusinessUser;
import cn.obanks.ar.model.InvestorAllowed;
import cn.obanks.ar.service.AssetsDealService;
import cn.obanks.ar.service.AssetsService;
import cn.obanks.ar.service.BusinessUserService;
import cn.obanks.ar.service.InvestorAllowedService;
import cn.obanks.common.Paginate;
import cn.obanks.common.ToString;
import cn.obanks.security.web.OBSSOUtils;

@Service
public class AssetsServiceImpl implements AssetsService {
	private static final Logger LOG = LoggerFactory.getLogger(AssetsService.class);
	@Autowired
	private AssetsMapper assetsMapper;
	@Autowired
	private AssetsDealService assetsDealService;
	@Autowired
	private InvestorAllowedService investorAllowedService;
	@Autowired
	private AssetsAttachmentMapper assetsAttachmentMapper;
	@Autowired
	private BusinessUserService businessUserService;
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Assets load(long id) {
		if (id == 0) {
			throw new IllegalArgumentException("id为空");
		}
		Assets assets = assetsMapper.load(id);
		return assets;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(Assets assets) {
		assets.setUpdatedDate(new Date());
		assets.setOfferFlag("N");
		assets.setDeletedFlag("N");
		assets.setCreatedDate(new Date());
		assetsMapper.add(assets);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void add(Assets assets, List<String> list, MultipartFile[] myfile, String path) {
		assets.setUpdatedDate(new Date());
		assets.setOfferFlag("N");
		assets.setDeletedFlag("N");
		assets.setCreatedDate(new Date());
		assetsMapper.add(assets);
		Long assetsId = assets.getId();
		for (int i = 0; i < list.size(); i++) {
			InvestorAllowed investorAllowed = new InvestorAllowed();
			investorAllowed.setCreatedBy(assets.getCreatedBy());
			investorAllowed.setCreatedDate(new Date());
			investorAllowed.setDeletedFlag("N");
			investorAllowed.setAssetId(assetsId);
			investorAllowed.setTarget(Long.parseLong(list.get(i)));
			investorAllowed.setUpdatedBy(assets.getCreatedBy());
			investorAllowed.setUpdatedDate(new Date());
			investorAllowedService.add(investorAllowed);
		}
		String category = "项目材料";
		MultipartFile file = myfile[0];
		if (file.getSize() > 0 && file.getSize() <= 2097152) {
			AssetsAttachment assetsAttachment = new AssetsAttachment();
			assetsAttachment.setAssetsId(assets.getId());
			assetsAttachment.setCategory(category);
			assetsAttachment.setCreatedBy(assets.getCreatedBy());
			assetsAttachment.setCreatedDate(new Date());
			assetsAttachment.setDeletedFlag("N");
			assetsAttachment.setFilename(file.getOriginalFilename());
			assetsAttachment.setUpdatedBy(assets.getCreatedBy());
			assetsAttachment.setUpdatedDate(new Date());
			assetsAttachmentMapper.add(assetsAttachment);
		}
	}

	@Override
	public void add(Assets assets, MultipartFile[] myfiles, String path) {
		assets.setUpdatedDate(new Date());
		assets.setOfferFlag("N");
		assets.setDeletedFlag("N");
		assets.setCreatedDate(new Date());
		assetsMapper.add(assets);
		MultipartFile file;
		String category = "项目材料";
		for (int i = 0; i < myfiles.length; i++) {
			file = myfiles[i];
			if (file.getSize() > 0 && file.getSize() <= 2097152) {
				AssetsAttachment assetsAttachment = new AssetsAttachment();
				assetsAttachment.setAssetsId(assets.getId());
				assetsAttachment.setCategory(category);
				assetsAttachment.setCreatedBy(assets.getCreatedBy());
				assetsAttachment.setCreatedDate(new Date());
				assetsAttachment.setDeletedFlag("N");
				assetsAttachment.setFilename(file.getOriginalFilename());
				assetsAttachment.setUpdatedBy(assets.getCreatedBy());
				assetsAttachment.setUpdatedDate(new Date());
				assetsAttachmentMapper.add(assetsAttachment);
			}
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void merge(Assets assets, List<String> list, MultipartFile[] myfile, String path) {
		/*
		 * if(assets.getAssetsProgress()==1){ assets.setAssetStatus("1"); }
		 * if(assets.getAssetsProgress()==2){ assets.setAssetStatus("2"); }
		 * if(assets.getAssetsProgress()==3){ assets.setAssetStatus("3"); }
		 * if(assets.getAssetsProgress()==4){ assets.setAssetStatus("4"); }
		 */
		Long id = assets.getId();
		Assets pre_assets = assetsMapper.load(id);
		investorAllowedService.delete(id);
		for (int i = 0; i < list.size(); i++) {
			InvestorAllowed investorAllowed = new InvestorAllowed();
			investorAllowed.setCreatedBy(pre_assets.getCreatedBy());
			investorAllowed.setCreatedDate(new Date());
			investorAllowed.setDeletedFlag("N");
			investorAllowed.setAssetId(id);
			investorAllowed.setTarget(Long.parseLong(list.get(i)));
			investorAllowed.setUpdatedBy(pre_assets.getCreatedBy());
			investorAllowed.setUpdatedDate(new Date());
			investorAllowedService.add(investorAllowed);
		}
		assets.setStatus(AssetsStauts.PENDING_APPROVE.getValue());
		assets.setUpdatedDate(new Date());
		String category = "项目材料";
		MultipartFile file = myfile[0];
		if (file.getSize() > 0 && file.getSize() <= 2097152) {
			AssetsAttachment assetsAttachment = new AssetsAttachment();
			assetsAttachment.setAssetsId(assets.getId());
			assetsAttachment.setCategory(category);
			assetsAttachment.setCreatedBy(pre_assets.getCreatedBy());
			assetsAttachment.setCreatedDate(new Date());
			assetsAttachment.setUpdatedBy(pre_assets.getCreatedBy());
			assetsAttachment.setUpdatedDate(new Date());
			assetsAttachment.setDeletedFlag("N");
			assetsAttachment.setFilename(file.getOriginalFilename());
			System.out.println(path + assets.getId() + "\\assetfiles\\" + file.getOriginalFilename());
			assetsAttachmentMapper.add(assetsAttachment);
			
		}
		assets.setStatus(AssetsStauts.PENDING_APPROVE.getValue());
		this.assetsMapper.merge(assets);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate searchAssets(Assets assets, Paginate paginate) {
		if (paginate == null) throw new IllegalArgumentException("paginate");
		paginate.setCondition(assets);
		long count = this.assetsMapper.countAssets(paginate);
		if (count == 0) return paginate;
		paginate.setTotal(count);
		paginate.setData(assetsMapper.searchAssets(paginate));
		return paginate;
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Paginate search(AssetsVo assetsVo, Paginate paginate) {
		if (paginate == null) throw new IllegalArgumentException("paginate");
		paginate.setCondition(assetsVo);
		long count = this.assetsMapper.count(paginate);
		if (count == 0) return paginate;
		paginate.setTotal(count);
		/*
		 * paginate.setData(assetsMapper.search(paginate)); return paginate;
		 */
		Map<Long, Assets> data = assetsMapper.search(paginate);
		// data.keySet();
		paginate.setData(data.values());
		return paginate;
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void changeOfferFlag(Assets assets) {
		LOG.debug("UserId:{}", ToString.reflectionToString(OBSSOUtils.getUserId()));
		/*
		 * if (OfferFlagStatus.NO.getValue().equals(assets.getOfferFlag())) {
		 * assets.setOfferFlag(OfferFlagStatus.YES.getValue()); }
		 * this.assetsMapper.changeOfferFlag(assets);
		 */
		AssetsDeal assetsDeal = new AssetsDeal();
		assetsDeal.setAssetsId(assets.getId());
		assetsDeal.setOwnerId(assets.getUserId());
		assetsDeal.setInvesterId(OBSSOUtils.getUserId());
		assetsDeal.setFundStatus(DealFuntStatus.INTENT_SUB.getValue());
		AssetsDeal result = assetsDealService.loadInvester(assetsDeal);
		if (result == null) {
			// 先给资金方进度设为“意向认购”
			this.assetsDealService.add(assetsDeal);
		}
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void changeOfferFlags(List<Long> assetsId) {
		for (Long id : assetsId) {
			Assets assets = this.load(id);
			changeOfferFlag(assets);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void mergestatus(long id) {
		Assets assets = assetsMapper.load(id);
		LOG.debug("assetsConcern222{}", ToString.reflectionToString(assets));
		if (assets.getStatus().equals(AssetsStauts.ON_LINE.getValue())) {
			assets.setStatus(AssetsStauts.OFF_LINE.getValue());
		}
		else
			if (assets.getStatus().equals(AssetsStauts.DRAFT.getValue())) {
				assets.setStatus(AssetsStauts.PENDING_APPROVE.getValue());
			}
		LOG.debug("assetsConcern222{}", ToString.reflectionToString(assets));
		this.assetsMapper.mergestatus(assets);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void mergeAssetsStatus(Assets assets) {
		LOG.debug("assets{}", ToString.reflectionToString(assets));
		Date now = new Date();
		assets.setUpdatedDate(now);
		this.assetsMapper.mergeAssetsStatus(assets);
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Assets searchTotal(Assets assets) {
		return this.assetsMapper.searchTotal(assets);
	}

	@Override
	public void mergeTime(Assets assets) {
		LOG.debug("assets{}", ToString.reflectionToString(assets));
		Date now = new Date();
		assets.setUpdatedDate(now);
		this.assetsMapper.mergeTime(assets);
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void updateRemindOne(long id) {
			System.out.println("%%%%%%%%%%%%%%%"+id);//business_user表的ID
			BusinessUser bus=this.businessUserService.load(id);  //得到投资人的手机号
			String phone = bus.getPhone();
			//发送短信
			System.out.println("%%%%%%%%%%%%%%%"+phone);
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public void updateRemind(List<Long> aa) {
		for(Long id : aa)
		{
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+id);//business_user表的ID
			BusinessUser bus=this.businessUserService.load(id);  //得到投资人的手机号
			String phone = bus.getPhone();
			//发送短信
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+phone);
         /*   Assets assets = new Assets();
            assets =this.assetsMapper.load(assetId);
            assets.getShortName();*/
			/*	String templateId = "";
			String[] arg_rs = name.split("\\|");*/
	//		boolean result = send.send(phone, templateId, arg_rs);
		}
		
	}

/*	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Assets searchName(String name,Long userId) {
		return assetsMapper.searchName(name,userId);
	}	*/
}
