package cn.obanks.ar.enums;

public enum UserStatus {
	PENDING_AUDIT("PA"), FIRST_PASS("FP"), FIRST_REJECT("FR"), REVIEW_PASS("RP"), REVIEW_REJECT("RR");
	private final String value;

	UserStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
