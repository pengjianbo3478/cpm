package cn.obanks.ar.enums;
public enum AjaxResultStauts {
	YES("Y"),NO("N");
	private final String value;

	AjaxResultStauts(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
