package cn.obanks.ar.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssetsDeal implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long id;

    private Long assetsId;

    private Long ownerId;

    private Long investerId;

    private BigDecimal offerAmount;

    private String amountUnit;

    private String fundStatus;

    private String assetStatus;
    
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfInterest;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dueDate;

    private String createdBy;

    private Date createdDate;

    private String updatedBy;

    private Date updatedDate;

    private String deletedFlag;
    
    private int statusProgress;
    
    private String assetsName;
    
    private String shortName;
    
    private String institutionName;
    
    private String phone;
    
    private String name;
    
    private String status;
    
    private String assetUnit;
    
    private long  countBrowseAssets;
    
	private long  countIntentionAssets;
	
	private long  countJinTiaoAssets;
	
	private long  countStartCheckAssets;
	
	private long  countPassCheckAssets;
	
	private long  countFinishAssets;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(Long assetsId) {
        this.assetsId = assetsId;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public Long getInvesterId() {
        return investerId;
    }

    public void setInvesterId(Long investerId) {
        this.investerId = investerId;
    }

    public BigDecimal getOfferAmount() {
        return offerAmount;
    }

    public void setOfferAmount(BigDecimal offerAmount) {
        this.offerAmount = offerAmount;
    }

    public String getAmountUnit() {
        return amountUnit;
    }

    public void setAmountUnit(String amountUnit) {
        this.amountUnit = amountUnit == null ? null : amountUnit.trim();
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
        this.assetStatus = assetStatus == null ? null : assetStatus.trim();
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

	public int getStatusProgress() {
		return statusProgress;
	}

	public void setStatusProgress(int statusProgress) {
		this.statusProgress = statusProgress;
	}

	public String getAssetsName() {
		return assetsName;
	}

	public void setAssetsName(String assetsName) {
		this.assetsName = assetsName;
	}

	public long getCountIntentionAssets() {
		return countIntentionAssets;
	}

	public void setCountIntentionAssets(long countIntentionAssets) {
		this.countIntentionAssets = countIntentionAssets;
	}

	public long getCountJinTiaoAssets() {
		return countJinTiaoAssets;
	}

	public void setCountJinTiaoAssets(long countJinTiaoAssets) {
		this.countJinTiaoAssets = countJinTiaoAssets;
	}

	public long getCountStartCheckAssets() {
		return countStartCheckAssets;
	}

	public void setCountStartCheckAssets(long countStartCheckAssets) {
		this.countStartCheckAssets = countStartCheckAssets;
	}

	public long getCountPassCheckAssets() {
		return countPassCheckAssets;
	}

	public void setCountPassCheckAssets(long countPassCheckAssets) {
		this.countPassCheckAssets = countPassCheckAssets;
	}

	public long getCountFinishAssets() {
		return countFinishAssets;
	}

	public void setCountFinishAssets(long countFinishAssets) {
		this.countFinishAssets = countFinishAssets;
	}

	public String getInstitutionName() {
		return institutionName;
	}

	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCountBrowseAssets() {
		return countBrowseAssets;
	}

	public void setCountBrowseAssets(long countBrowseAssets) {
		this.countBrowseAssets = countBrowseAssets;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getAssetUnit() {
		return assetUnit;
	}

	public void setAssetUnit(String assetUnit) {
		this.assetUnit = assetUnit;
	}



}