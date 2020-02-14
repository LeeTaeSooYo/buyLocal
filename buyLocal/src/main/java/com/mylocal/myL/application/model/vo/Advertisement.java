package com.mylocal.myL.application.model.vo;

import java.sql.Date;

public class Advertisement {
	
	private int aNo;
	private String aTitle;
	private String lCode;
	private Date aDate;
	private String aStatus;
	private String aFile; // 광고파일(이미지)
	
	
	private int cNo; // 회원번호(광고주)
	
	public Advertisement() {} 

	public Advertisement(int aNo, String aTitle, String lCode, Date aDate, String aStatus, String aFile, int cNo) {
		super();
		this.aNo = aNo;
		this.aTitle = aTitle;
		this.lCode = lCode;
		this.aDate = aDate;
		this.aStatus = aStatus;
		this.aFile = aFile;
		this.cNo = cNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getlCode() {
		return lCode;
	}

	public void setlCode(String lCode) {
		this.lCode = lCode;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public String getaFile() {
		return aFile;
	}

	public void setaFile(String aFile) {
		this.aFile = aFile;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "Advertisement [aNo=" + aNo + ", aTitle=" + aTitle + ", lCode=" + lCode + ", aDate=" + aDate
				+ ", aStatus=" + aStatus + ", aFile=" + aFile + ", cNo=" + cNo + "]";
	}

	
	
	
}
