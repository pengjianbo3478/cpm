package cn.obanks.ar.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import cn.obanks.common.Item;

public class Assets implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Long id;

    private Long userId;

    private String assetsName;

    private String shortName;

    private Integer assetType;

    private String assetTypeOther;

    private String assetArea;

    private BigDecimal assetScales;

    private String assetUnit;

    private Integer termMin;

    private Integer termMax;

    private BigDecimal yieldMin;

    private BigDecimal yieldMax;

    private Date validity;

    private Integer financingCategory;

    private String financingCategoryOther;

    private String useOfFunds;

    private String financing;

    private String financingCredit;

    private String financingAssure;

    private String other;

    private String introduction;

    private String status;

    private String validStatus;

    private Date commitDate;

    private Date endDate;

    private String checkedRemark;

    private String checkedBy;

    private Date checkedDate;

    private String releasedBy;

    private Date releasedDate;

    private String unreleasedBy;

    private Date unreleasedDate;

    private String offerFlag;

    private Date offerTime;

    private String createdBy;

    private Date createdDate;

    private String updatedBy;

    private Date updatedDate;

    private String deletedFlag;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfInterest;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dueDate;

    private String fundStatus;

    private String assetStatus;

    private String institutionName;

   private String amountUnit;
    
    private BigDecimal offerAmount;
    
    private List<Item> targetTypeList;
    
    private List<String> targetlist;

    private String phone;
    
    private int assetsProgress;
    
    private Long viewId;
    
    private String concernFlag;
    
    private Long concernCount;
    
    private Long offerCount;
    
    private String name;
    
    private Long viewCountTotal;

    private Long concernCountTotal;
    
    private Long offerCountTotal;
    
    private BigDecimal offerAmountTotal;
    
    
    public BigDecimal getOfferAmountTotal() {
		return offerAmountTotal;
	}

	public void setOfferAmountTotal(BigDecimal offerAmountTotal) {
		this.offerAmountTotal = offerAmountTotal;
	}

	public Long getConcernCountTotal() {
		return concernCountTotal;
	}

	public void setConcernCountTotal(Long concernCountTotal) {
		this.concernCountTotal = concernCountTotal;
	}

	public Long getOfferCountTotal() {
		return offerCountTotal;
	}

	public void setOfferCountTotal(Long offerCountTotal) {
		this.offerCountTotal = offerCountTotal;
	}

	public String getConcernFlag() {
		return concernFlag;
	}

	public void setConcernFlag(String concernFlag) {
		this.concernFlag = concernFlag;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAssetsName() {
        return assetsName;
    }

    public void setAssetsName(String assetsName) {
        this.assetsName = assetsName == null ? null : assetsName.trim();
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName == null ? null : shortName.trim();
    }

    public Integer getAssetType() {
        return assetType;
    }

    public void setAssetType(Integer assetType) {
        this.assetType = assetType;
    }

    public String getAssetTypeOther() {
        return assetTypeOther;
    }

    public void setAssetTypeOther(String assetTypeOther) {
        this.assetTypeOther = assetTypeOther == null ? null : assetTypeOther.trim();
    }

    public String getAssetArea() {
        return assetArea;
    }

    public void setAssetArea(String assetArea) {
        this.assetArea = assetArea == null ? null : assetArea.trim();
    }

    public BigDecimal getAssetScales() {
        return assetScales;
    }

    public void setAssetScales(BigDecimal assetScales) {
        this.assetScales = assetScales;
    }

    public String getAssetUnit() {
        return assetUnit;
    }

    public void setAssetUnit(String assetUnit) {
        this.assetUnit = assetUnit == null ? null : assetUnit.trim();
    }

	public Integer getTermMin() {
		return termMin;
	}

	public void setTermMin(Integer termMin) {
		this.termMin = termMin;
	}

	public Integer getTermMax() {
		return termMax;
	}

	public void setTermMax(Integer termMax) {
		this.termMax = termMax;
	}


    public BigDecimal getYieldMin() {
        return yieldMin;
    }

    public void setYieldMin(BigDecimal yieldMin) {
        this.yieldMin = yieldMin;
    }

    public BigDecimal getYieldMax() {
        return yieldMax;
    }

    public void setYieldMax(BigDecimal yieldMax) {
        this.yieldMax = yieldMax;
    }

    public Date getValidity() {
        return validity;
    }

    public void setValidity(Date validity) {
        this.validity = validity;
    }

    public Integer getFinancingCategory() {
        return financingCategory;
    }

    public void setFinancingCategory(Integer financingCategory) {
        this.financingCategory = financingCategory;
    }

    public String getFinancingCategoryOther() {
        return financingCategoryOther;
    }

    public void setFinancingCategoryOther(String financingCategoryOther) {
        this.financingCategoryOther = financingCategoryOther == null ? null : financingCategoryOther.trim();
    }

    public String getUseOfFunds() {
        return useOfFunds;
    }

    public void setUseOfFunds(String useOfFunds) {
        this.useOfFunds = useOfFunds == null ? null : useOfFunds.trim();
    }

    public String getFinancingCredit() {
        return financingCredit;
    }

    public void setFinancingCredit(String financingCredit) {
        this.financingCredit = financingCredit == null ? null : financingCredit.trim();
    }

    public String getFinancingAssure() {
        return financingAssure;
    }

    public void setFinancingAssure(String financingAssure) {
        this.financingAssure = financingAssure == null ? null : financingAssure.trim();
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getValidStatus() {
        return validStatus;
    }

    public void setValidStatus(String validStatus) {
        this.validStatus = validStatus == null ? null : validStatus.trim();
    }

    public Date getCommitDate() {
        return commitDate;
    }

    public void setCommitDate(Date commitDate) {
        this.commitDate = commitDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCheckedRemark() {
        return checkedRemark;
    }

    public void setCheckedRemark(String checkedRemark) {
        this.checkedRemark = checkedRemark == null ? null : checkedRemark.trim();
    }

    public String getCheckedBy() {
        return checkedBy;
    }

    public void setCheckedBy(String checkedBy) {
        this.checkedBy = checkedBy;
    }

    public Date getCheckedDate() {
        return checkedDate;
    }

    public void setCheckedDate(Date checkedDate) {
        this.checkedDate = checkedDate;
    }

    public String getReleasedBy() {
        return releasedBy;
    }

    public void setReleasedBy(String releasedBy) {
        this.releasedBy = releasedBy;
    }

    public Date getReleasedDate() {
        return releasedDate;
    }

    public void setReleasedDate(Date releasedDate) {
        this.releasedDate = releasedDate;
    }

    public String getUnreleasedBy() {
        return unreleasedBy;
    }

    public void setUnreleasedBy(String unreleasedBy) {
        this.unreleasedBy = unreleasedBy;
    }

    public Date getUnreleasedDate() {
        return unreleasedDate;
    }

    public void setUnreleasedDate(Date unreleasedDate) {
        this.unreleasedDate = unreleasedDate;
    }

    public String getOfferFlag() {
        return offerFlag;
    }

    public void setOfferFlag(String offerFlag) {
        this.offerFlag = offerFlag == null ? null : offerFlag.trim();
    }

    public Date getOfferTime() {
        return offerTime;
    }

    public void setOfferTime(Date offerTime) {
        this.offerTime = offerTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getDeletedFlag() {
        return deletedFlag;
    }

    public void setDeletedFlag(String deletedFlag) {
        this.deletedFlag = deletedFlag == null ? null : deletedFlag.trim();
    }

	public Date getDateOfInterest() {
		return dateOfInterest;
	}

	public void setDateOfInterest(Date dateOfInterest) {
		this.dateOfInterest = dateOfInterest;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getFundStatus() {
		return fundStatus;
	}

	public void setFundStatus(String fundStatus) {
		this.fundStatus = fundStatus == null ? null : fundStatus.trim();
	}

	public String getAssetStatus() {
		return assetStatus;
	}

	public void setAssetStatus(String assetStatus) {
		this.assetStatus = assetStatus== null ? null : assetStatus.trim();
	}

	public String getInstitutionName() {
		return institutionName;
	}

	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName == null ? null : institutionName.trim();
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public List<Item> getTargetTypeList() {
		return targetTypeList;
	}

	public void setTargetTypelist(List<Item> targetTypeList) {
		this.targetTypeList = targetTypeList;
	}

	public String getFinancing() {
		return financing;
	}

	public void setFinancing(String financing) {
		this.financing = financing;
	}


	public int getAssetsProgress() {
		return assetsProgress;
	}

	public void setAssetsProgress(int assetsProgress) {
		this.assetsProgress = assetsProgress;
	}

	public List<String> getTargetlist() {
		return targetlist;
	}

	public void setTargetlist(List<String> targetlist) {
		this.targetlist = targetlist;
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public BigDecimal getOfferAmount() {
		return offerAmount;
	}

	public void setOfferAmount(BigDecimal offerAmount) {
		this.offerAmount = offerAmount;
	}

	public Long getConcernCount() {
		return concernCount;
	}

	public void setConcernCount(Long concernCount) {
		this.concernCount = concernCount;
	}

	public Long getOfferCount() {
		return offerCount;
	}

	public void setOfferCount(Long offerCount) {
		this.offerCount = offerCount;
	}

	public Long getviewCountTotal() {
		return viewCountTotal;
	}

	public void setviewCountTotal(Long viewCountTotal) {
		this.viewCountTotal = viewCountTotal;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAmountUnit() {
		return amountUnit;
	}

	public void setAmountUnit(String amountUnit) {
		this.amountUnit = amountUnit;
	}

}