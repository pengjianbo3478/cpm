package cn.obanks.ar.enums;

public enum DealValidStauts {
	ENABLED("E"), DISABLED("D");
	private final String value;

	DealValidStauts(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
