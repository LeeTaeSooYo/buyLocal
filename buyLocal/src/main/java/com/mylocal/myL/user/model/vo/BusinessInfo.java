package com.mylocal.myL.user.model.vo;

import java.util.Date;

public class BusinessInfo {
	
	private String bShopNo;			// 사업자 번호
	private String bPermit;				// 승인 여부
	private String bShopName;			// 상호명
	private String bClass;				// 업종
	private String bDetailClass;		// 업태
	private String bOwner;				// 대표자 이름
	private String bPic;				// 담당자 연락처
	private String bShopAddress;		// 사업장 주소
	private int cNo; // 회원번호 이거 처리 어케 해야하지?
	
	public BusinessInfo() {}

	public BusinessInfo(String bShopNo, String bPermit, String bShopName, String bClass, String bDetailClass,
			String bOwner, String bPic, String bShopAddress, int cNo) {
		super();
		this.bShopNo = bShopNo;
		this.bPermit = bPermit;
		this.bShopName = bShopName;
		this.bClass = bClass;
		this.bDetailClass = bDetailClass;
		this.bOwner = bOwner;
		this.bPic = bPic;
		this.bShopAddress = bShopAddress;
		this.cNo = cNo;
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

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "BusinessInfo [bShopNo=" + bShopNo + ", bPermit=" + bPermit + ", bShopName=" + bShopName
				+ ", bClass=" + bClass + ", bDetailClass=" + bDetailClass + ", bOwner=" + bOwner + ", bPic=" + bPic
				+ ", bShopAddress=" + bShopAddress + ", cNo=" + cNo + "]";
	}
	
	
	
	
	
	
	

}
