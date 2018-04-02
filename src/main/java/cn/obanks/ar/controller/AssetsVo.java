package cn.obanks.ar.controller;

import java.util.Set;

public class AssetsVo {
	
	private Set<Double> assetScales;
	
	private Set<Integer> termMin;
	
	private Set<Double> yieldMin;
	
	private Set<String> assetsName;
	
	
	private Set<Integer> financingCategory;
	
	private Set<Integer> assetType;
	
	private Long userID; 

	public Set<Double> getAssetScales() {
		return assetScales;
	}

	public void setAssetScales(Set<Double> assetScales) {
		this.assetScales = assetScales;
	}

	

	public Set<Integer> getTermMin() {
		return termMin;
	}

	public void setTermMin(Set<Integer> termMin) {
		this.termMin = termMin;
	}

	public Set<Double> getYieldMin() {
		return yieldMin;
	}

	public void setYieldMin(Set<Double> yieldMin) {
		this.yieldMin = yieldMin;
	}

	public Set<String> getAssetsName() {
		return assetsName;
	}

	public void setAssetsName(Set<String> assetsName) {
		this.assetsName = assetsName;
	}

	public Set<Integer> getFinancingCategory() {
		return financingCategory;
	}

	public void setFinancingCategory(Set<Integer> financingCategory) {
		this.financingCategory = financingCategory;
	}

	public Set<Integer> getAssetType() {
		return assetType;
	}

	public void setAssetType(Set<Integer> assetType) {
		this.assetType = assetType;
	}

	public Long getUserID() {
		return userID;
	}

	public void setUserID(Long userID) {
		this.userID = userID;
	}

	

	
	
}
