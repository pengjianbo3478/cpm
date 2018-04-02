package cn.obanks.ar.enums;
public enum ActivateStauts {
	PA("P"), AT("A") ,DT("D");
	private final String value;

	ActivateStauts(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
