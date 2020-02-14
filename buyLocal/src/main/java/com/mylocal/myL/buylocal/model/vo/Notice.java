package com.mylocal.myL.buylocal.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo; // 공지사항 번호
	private String nTitle; // 글제목
	private String nContent; // 글내용
	private Date nDate; // 작성일
	private String nStatus; // 공지 게시글 상태
	private int nView; // 조회수

	public Notice() {}
	
	public Notice(int nNo, String nTitle, String nContent, Date nDate, String nStatus, int nView) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nStatus = nStatus;
		this.nView = nView;
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

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public int getnView() {
		return nView;
	}

	public void setnView(int nView) {
		this.nView = nView;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nDate=" + nDate
				+ ", nStatus=" + nStatus + ", nView=" + nView + "]";
	} 	
	
	
}
