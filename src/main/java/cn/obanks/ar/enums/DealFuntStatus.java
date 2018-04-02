package cn.obanks.ar.enums;

public enum DealFuntStatus {
	INTENT_SUB("IS"), BEST_TUNE("BT"), START_REVIEW("SR"), THROUGH_REVIEW("TR"), COM_SUB("CS");
	private final String value;

	DealFuntStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
