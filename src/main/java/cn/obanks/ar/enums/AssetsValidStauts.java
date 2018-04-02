package cn.obanks.ar.enums;

public enum AssetsValidStauts {
	ENABLED("E"), DISABLED("D");
	private final String value;

	AssetsValidStauts(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
