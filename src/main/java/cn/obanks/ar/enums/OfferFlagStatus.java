package cn.obanks.ar.enums;
public enum OfferFlagStatus {
	YES("Y"),NO("N");
	private final String value;

	OfferFlagStatus(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
