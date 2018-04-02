package cn.obanks.ar.enums;

public enum UserAttachmentCategory {
	IDCARD("ID"), NAME_CARD("NC"), OTHER("OT");
	private final String value;

	UserAttachmentCategory(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
