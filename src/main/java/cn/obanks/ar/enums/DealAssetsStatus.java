package cn.obanks.ar.enums;

public enum DealAssetsStatus {
	ACCEPT_SUB("AS"), SET_PROJECT("SP"), START_REVIEW("SR"), THROUGH_REVIEW("TR"), ISSUE("IS");
	private final String value;

	DealAssetsStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
