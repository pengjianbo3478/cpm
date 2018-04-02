package cn.obanks.ar.enums;

public enum DeletedFlagStatus {
	NORMAL("N"), DELETED("D");
	private final String value;

	DeletedFlagStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
