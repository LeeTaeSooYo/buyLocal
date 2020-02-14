package com.mylocal.myL.share.model.vo;

public class Local {
	private String lCode;
	private String lName;
	
	public Local() {}

	public Local(String lCode, String lName) {
		super();
		this.lCode = lCode;
		this.lName = lName;
	}

	public String getlCode() {
		return lCode;
	}

	public void setlCode(String lCode) {
		this.lCode = lCode;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	@Override
	public String toString() {
		return "Local [lCode=" + lCode + ", lName=" + lName + "]";
	}
}
