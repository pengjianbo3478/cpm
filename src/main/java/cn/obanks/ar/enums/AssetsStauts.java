package cn.obanks.ar.enums;
public enum AssetsStauts {
	SEND_BACK("SB"), REQUESTING("RQ") ,DRAFT("DF"),PENDING_APPROVE ("PA"),APPROVAL("AP"),REJECTED("RJ"),ON_LINE("OL"),OFF_LINE("OF");

	private final String value;

	AssetsStauts(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
