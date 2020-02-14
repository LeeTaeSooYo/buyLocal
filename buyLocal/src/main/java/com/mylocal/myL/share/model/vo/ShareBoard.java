package com.mylocal.myL.share.model.vo;

import java.sql.Date;

public class ShareBoard {
	
	private int sbNo;
	private String sbTitle;
	private String sbContent;
	private Date sbDate;
	private String sbStatus;
	private String cName;
	private int cNo;
	private String lName;
	private String lCode;
	private int sbView;
	private String sbcgName;
	private String sbcgCode;
	private String originalFileName;
	private String renameFileName;
	
	public ShareBoard() {}

	public ShareBoard(int sbNo, String sbTitle, String sbContent, Date sbDate, String sbStatus, String cName, int cNo,
			String lName, String lCode, int sbView, String sbcgName, String sbcgCode, String originalFileName,
			String renameFileName) {
		super();
		this.sbNo = sbNo;
		this.sbTitle = sbTitle;
		this.sbContent = sbContent;
		this.sbDate = sbDate;
		this.sbStatus = sbStatus;
		this.cName = cName;
		this.cNo = cNo;
		this.lName = lName;
		this.lCode = lCode;
		this.sbView = sbView;
		this.sbcgName = sbcgName;
		this.sbcgCode = sbcgCode;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public int getSbNo() {
		return sbNo;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public String getSbTitle() {
		return sbTitle;
	}

	public void setSbTitle(String sbTitle) {
		this.sbTitle = sbTitle;
	}

	public String getSbContent() {
		return sbContent;
	}

	public void setSbContent(String sbContent) {
		this.sbContent = sbContent;
	}

	public Date getSbDate() {
		return sbDate;
	}

	public void setSbDate(Date sbDate) {
		this.sbDate = sbDate;
	}

	public String getSbStatus() {
		return sbStatus;
	}

	public void setSbStatus(String sbStatus) {
		this.sbStatus = sbStatus;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getlCode() {
		return lCode;
	}

	public void setlCode(String lCode) {
		this.lCode = lCode;
	}

	public int getSbView() {
		return sbView;
	}

	public void setSbView(int sbView) {
		this.sbView = sbView;
	}

	public String getSbcgName() {
		return sbcgName;
	}

	public void setSbcgName(String sbcgName) {
		this.sbcgName = sbcgName;
	}

	public String getSbcgCode() {
		return sbcgCode;
	}

	public void setSbcgCode(String sbcgCode) {
		this.sbcgCode = sbcgCode;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "ShareBoard [sbNo=" + sbNo + ", sbTitle=" + sbTitle + ", sbContent=" + sbContent + ", sbDate=" + sbDate
				+ ", sbStatus=" + sbStatus + ", cName=" + cName + ", cNo=" + cNo + ", lName=" + lName + ", lCode="
				+ lCode + ", sbView=" + sbView + ", sbcgName=" + sbcgName + ", sbcgCode=" + sbcgCode
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + "]";
	}
}
