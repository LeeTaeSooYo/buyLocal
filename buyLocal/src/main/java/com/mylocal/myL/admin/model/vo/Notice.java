package com.mylocal.myL.admin.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo;
	private String nTitle;
	private String nContent;
	private Date nDate;
	private int nView;
	private String nStatus;
	
	public Notice() {}

	public Notice(int nNo, String nTitle, String nContent, Date nDate, int nView, String nStatus) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nView = nView;
		this.nStatus = nStatus;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getnView() {
		return nView;
	}

	public void setnView(int nView) {
		this.nView = nView;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nDate=" + nDate + ", nView="
				+ nView + ", nStatus=" + nStatus + "]";
	}
	
	
		
}
