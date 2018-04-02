package cn.obanks.ar.enums;

public enum AssetsOfferFlag {
	YES("Y"), NO("N");
	private final String value;

	AssetsOfferFlag(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
