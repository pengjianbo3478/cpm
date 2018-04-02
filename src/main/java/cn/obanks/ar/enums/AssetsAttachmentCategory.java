package cn.obanks.ar.enums;

public enum AssetsAttachmentCategory {
	PROJECT("PS"), OTHER("OT");
	private final String value;

	AssetsAttachmentCategory(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
