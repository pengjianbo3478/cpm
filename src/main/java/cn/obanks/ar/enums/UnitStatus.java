package cn.obanks.ar.enums;

public enum UnitStatus {
	TEN_THOUSAND("K"), BILLION("M");
	private final String value;

	UnitStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
