package com.mylocal.myL.admin.model.vo;

import java.sql.Date;

// 회원 거래내역 조인할것
public class Customer {
	private int cNo;
	private String cName;
	private String cId;
	private String cPwd;
	private String cEmail;
	private String cAddress;
	private String cPhone;
	private Date cEnrollDate;
	private String cStatus;
	private String cLevel;

	private int pNo; // 상품이름과 조인
	
	private String pName; // 상품 이름 가져올것
	
	private int dDate; // 거래일자 가져올것
	private int dPrice; // 가격 가져올것
	private String dRevCheck; // 수령 여부 가져올것
	
	
	// 사업장 정보 전부다 들고가자
	private String bShopNo; // 사업자 등록번호
	private String bPermit; // 승인여부
	private String bShopName; // 업체명
	private String bClass; 
	private String bDetailClass;
	private String bOwner; // 대표자
	private String bPic;
	private String bShopAddress;
	
	public Customer() {}

	public Customer(int cNo, String cName, String cId, String cPwd, String cEmail, String cAddress, String cPhone,
			Date cEnrollDate, String cStatus, String cLevel, int pNo, String pName, int dDate, int dPrice,
			String dRevCheck, String bShopNo, String bPermit, String bShopName, String bClass, String bDetailClass,
			String bOwner, String bPic, String bShopAddress) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.cId = cId;
		this.cPwd = cPwd;
		this.cEmail = cEmail;
		this.cAddress = cAddress;
		this.cPhone = cPhone;
		this.cEnrollDate = cEnrollDate;
		this.cStatus = cStatus;
		this.cLevel = cLevel;
		this.pNo = pNo;
		this.pName = pName;
		this.dDate = dDate;
		this.dPrice = dPrice;
		this.dRevCheck = dRevCheck;
		this.bShopNo = bShopNo;
		this.bPermit = bPermit;
		this.bShopName = bShopName;
		this.bClass = bClass;
		this.bDetailClass = bDetailClass;
		this.bOwner = bOwner;
		this.bPic = bPic;
		this.bShopAddress = bShopAddress;
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

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcPwd() {
		return cPwd;
	}

	public void setcPwd(String cPwd) {
		this.cPwd = cPwd;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public Date getcEnrollDate() {
		return cEnrollDate;
	}

	public void setcEnrollDate(Date cEnrollDate) {
		this.cEnrollDate = cEnrollDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getcLevel() {
		return cLevel;
	}

	public void setcLevel(String cLevel) {
		this.cLevel = cLevel;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getdDate() {
		return dDate;
	}

	public void setdDate(int dDate) {
		this.dDate = dDate;
	}

	public int getdPrice() {
		return dPrice;
	}

	public void setdPrice(int dPrice) {
		this.dPrice = dPrice;
	}

	public String getdRevCheck() {
		return dRevCheck;
	}

	public void setdRevCheck(String dRevCheck) {
		this.dRevCheck = dRevCheck;
	}

	public String getbShopNo() {
		return bShopNo;
	}

	public void setbShopNo(String bShopNo) {
		this.bShopNo = bShopNo;
	}

	public String getbPermit() {
		return bPermit;
	}

	public void setbPermit(String bPermit) {
		this.bPermit = bPermit;
	}

	public String getbShopName() {
		return bShopName;
	}

	public void setbShopName(String bShopName) {
		this.bShopName = bShopName;
	}

	public String getbClass() {
		return bClass;
	}

	public void setbClass(String bClass) {
		this.bClass = bClass;
	}

	public String getbDetailClass() {
		return bDetailClass;
	}

	public void setbDetailClass(String bDetailClass) {
		this.bDetailClass = bDetailClass;
	}

	public String getbOwner() {
		return bOwner;
	}

	public void setbOwner(String bOwner) {
		this.bOwner = bOwner;
	}

	public String getbPic() {
		return bPic;
	}

	public void setbPic(String bPic) {
		this.bPic = bPic;
	}

	public String getbShopAddress() {
		return bShopAddress;
	}

	public void setbShopAddress(String bShopAddress) {
		this.bShopAddress = bShopAddress;
	}

	@Override
	public String toString() {
		return "Customer [cNo=" + cNo + ", cName=" + cName + ", cId=" + cId + ", cPwd=" + cPwd + ", cEmail=" + cEmail
				+ ", cAddress=" + cAddress + ", cPhone=" + cPhone + ", cEnrollDate=" + cEnrollDate + ", cStatus="
				+ cStatus + ", cLevel=" + cLevel + ", pNo=" + pNo + ", pName=" + pName + ", dDate=" + dDate
				+ ", dPrice=" + dPrice + ", dRevCheck=" + dRevCheck + ", bShopNo=" + bShopNo + ", bPermit=" + bPermit
				+ ", bShopName=" + bShopName + ", bClass=" + bClass + ", bDetailClass=" + bDetailClass + ", bOwner="
				+ bOwner + ", bPic=" + bPic + ", bShopAddress=" + bShopAddress + "]";
	}
	

	
	
	
	
	
}
