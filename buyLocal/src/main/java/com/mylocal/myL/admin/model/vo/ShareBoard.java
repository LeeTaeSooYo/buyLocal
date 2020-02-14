package com.mylocal.myL.admin.model.vo;

import java.sql.Date;

public class ShareBoard {
   
   private int sbNo;
   private String sbTitle;
   private String sbContent;
   private Date sbCreateDate;
   private String sbStatus;
   private String cName; // 회원 이름
   private String lName;
   private int sbView;
   private String sbcgName;
   private int cNo; // 회원번호
   
   public ShareBoard() {}

public ShareBoard(int sbNo, String sbTitle, String sbContent, Date sbCreateDate, String sbStatus, String cName, String lName,
		int sbView, String sbcgName, int cNo) {
	super();
	this.sbNo = sbNo;
	this.sbTitle = sbTitle;
	this.sbContent = sbContent;
	this.sbCreateDate = sbCreateDate;
	this.sbStatus = sbStatus;
	this.cName = cName;
	this.lName = lName;
	this.sbView = sbView;
	this.sbcgName = sbcgName;
	this.cNo = cNo;
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

public Date getsbCreateDate() {
	return sbCreateDate;
}

public void setsbCreateDate(Date sbCreateDate) {
	this.sbCreateDate = sbCreateDate;
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

public String getlName() {
	return lName;
}

public void setlName(String lName) {
	this.lName = lName;
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

public int getcNo() {
	return cNo;
}

public void setcNo(int cNo) {
	this.cNo = cNo;
}

@Override
public String toString() {
	return "ShareBoard [sbNo=" + sbNo + ", sbTitle=" + sbTitle + ", sbContent=" + sbContent + ", sbCreateDate=" + sbCreateDate
			+ ", sbStatus=" + sbStatus + ", cName=" + cName + ", lName=" + lName + ", sbView=" + sbView + ", sbcgName="
			+ sbcgName + ", cNo=" + cNo + "]";
}

 
   

}