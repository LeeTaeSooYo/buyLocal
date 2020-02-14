package com.mylocal.myL.share.model.vo;

import java.util.Date;

public class Reply {
	private int rNo;
	private int sbNo;
	private String cName;
	private int cNo;
	private Date rCreateDate;
	private String rContent;
	private String rStatus;
	private int rLevel;
	private int refRno;
	

	public Reply() {}


	public Reply(int rNo, int sbNo, String cName, int cNo, Date rCreateDate, String rContent, String rStatus,
			int rLevel, int refRno) {
		super();
		this.rNo = rNo;
		this.sbNo = sbNo;
		this.cName = cName;
		this.cNo = cNo;
		this.rCreateDate = rCreateDate;
		this.rContent = rContent;
		this.rStatus = rStatus;
		this.rLevel = rLevel;
		this.refRno = refRno;
	}


	public int getrNo() {
		return rNo;
	}


	public void setrNo(int rNo) {
		this.rNo = rNo;
	}


	public int getSbNo() {
		return sbNo;
	}


	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
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


	public Date getrCreateDate() {
		return rCreateDate;
	}


	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}


	public int getrLevel() {
		return rLevel;
	}


	public void setrLevel(int rLevel) {
		this.rLevel = rLevel;
	}


	public int getRefRno() {
		return refRno;
	}


	public void setRefRno(int refRno) {
		this.refRno = refRno;
	}


	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", sbNo=" + sbNo + ", cName=" + cName + ", cNo=" + cNo + ", rCreateDate="
				+ rCreateDate + ", rContent=" + rContent + ", rStatus=" + rStatus + ", rLevel=" + rLevel + ", refRno="
				+ refRno + "]";
	}
	
}
