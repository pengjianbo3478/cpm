package cn.obanks.ar.enums;

public enum RegistStatus {
	ENABLE("E"), LOCK("L"), BLACK("B");
	private final String value;

	RegistStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
