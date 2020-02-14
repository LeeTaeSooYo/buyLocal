package com.mylocal.myL.admin.model.vo;

import java.sql.Date;

public class Report {

	private int rtNo;
	private String rtTitle;
	private String rtContent;
	private Date rtDate;
	private int cNo;
	private String cName;
	private String rtCategory;
	private String rtStatus;
	private int sbNo;
	private int hNo;
	private int rtNum; // 구분값 코드번호
	private String rtDivide; // 신고 위치
	private String pBoard; // 핫딜 땡처리 비교
	private String cName2; // 신고대상
	private String cStatus;
	
	public Report() {}

	public Report(int rtNo, String rtTitle, String rtContent, Date rtDate, int cNo, String cName, String rtCategory,
			String rtStatus, int sbNo, int hNo, int rtNum, String rtDivide, String pBoard, String cName2,
			String cStatus) {
		super();
		this.rtNo = rtNo;
		this.rtTitle = rtTitle;
		this.rtContent = rtContent;
		this.rtDate = rtDate;
		this.cNo = cNo;
		this.cName = cName;
		this.rtCategory = rtCategory;
		this.rtStatus = rtStatus;
		this.sbNo = sbNo;
		this.hNo = hNo;
		this.rtNum = rtNum;
		this.rtDivide = rtDivide;
		this.pBoard = pBoard;
		this.cName2 = cName2;
		this.cStatus = cStatus;
	}

	public int getRtNo() {
		return rtNo;
	}

	public void setRtNo(int rtNo) {
		this.rtNo = rtNo;
	}

	public String getRtTitle() {
		return rtTitle;
	}

	public void setRtTitle(String rtTitle) {
		this.rtTitle = rtTitle;
	}

	public String getRtContent() {
		return rtContent;
	}

	public void setRtContent(String rtContent) {
		this.rtContent = rtContent;
	}

	public Date getRtDate() {
		return rtDate;
	}

	public void setRtDate(Date rtDate) {
		this.rtDate = rtDate;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getRtCategory() {
		return rtCategory;
	}

	public void setRtCategory(String rtCategory) {
		this.rtCategory = rtCategory;
	}

	public String getRtStatus() {
		return rtStatus;
	}

	public void setRtStatus(String rtStatus) {
		this.rtStatus = rtStatus;
	}

	public int getSbNo() {
		return sbNo;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public int getRtNum() {
		return rtNum;
	}

	public void setRtNum(int rtNum) {
		this.rtNum = rtNum;
	}

	public String getRtDivide() {
		return rtDivide;
	}

	public void setRtDivide(String rtDivide) {
		this.rtDivide = rtDivide;
	}

	public String getpBoard() {
		return pBoard;
	}

	public void setpBoard(String pBoard) {
		this.pBoard = pBoard;
	}

	public String getcName2() {
		return cName2;
	}

	public void setcName2(String cName2) {
		this.cName2 = cName2;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "Report [rtNo=" + rtNo + ", rtTitle=" + rtTitle + ", rtContent=" + rtContent + ", rtDate=" + rtDate
				+ ", cNo=" + cNo + ", cName=" + cName + ", rtCategory=" + rtCategory + ", rtStatus=" + rtStatus
				+ ", sbNo=" + sbNo + ", hNo=" + hNo + ", rtNum=" + rtNum + ", rtDivide=" + rtDivide + ", pBoard="
				+ pBoard + ", cName2=" + cName2 + ", cStatus=" + cStatus + "]";
	}

	
	

	
	
}
