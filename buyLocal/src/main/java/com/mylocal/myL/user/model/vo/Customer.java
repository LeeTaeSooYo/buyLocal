package com.mylocal.myL.user.model.vo;

import java.util.Date;

public class Customer {
	private int cNo;
	private String cName;
	private String cId;
	private String cPwd; // 수정함
	private String cEmail;
	private String cAddress;
	private String cStatus;
	private String cPhone; 
	private Date cEnrollDate;
	private String cLevel;
	
	public Customer() {}

	public Customer(int cNo, String cName, String cId, String cPwd, String cEmail, String cAddress, String cStatus,
			String cPhone, Date cEnrollDate, String cLevel) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.cId = cId;
		this.cPwd = cPwd;
		this.cEmail = cEmail;
		this.cAddress = cAddress;
		this.cStatus = cStatus;
		this.cPhone = cPhone;
		this.cEnrollDate = cEnrollDate;
		this.cLevel = cLevel;
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

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
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

	public String getcLevel() {
		return cLevel;
	}

	public void setcLevel(String cLevel) {
		this.cLevel = cLevel;
	}

	@Override
	public String toString() {
		return "Customer [cNo=" + cNo + ", cName=" + cName + ", cId=" + cId + ", cPwd=" + cPwd + ", cEmail=" + cEmail
				+ ", cAddress=" + cAddress + ", cStatus=" + cStatus + ", cPhone=" + cPhone + ", cEnrollDate="
				+ cEnrollDate + ", cLevel=" + cLevel + "]";
	}
	
	

	
	

	
	

}
