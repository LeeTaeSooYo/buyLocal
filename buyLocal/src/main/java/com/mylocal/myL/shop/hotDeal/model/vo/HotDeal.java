package com.mylocal.myL.shop.hotDeal.model.vo;

import java.sql.Date;

public class HotDeal {
	private int hNo; //핫딜번호
	private String hTitle; //글제목
	private int sNo; //회원번호(사업자)
	private int pNo; //상품고유번호
	private Date hDate; //등록일자
	private String lCode; //지역코드
	private String hStatus; //상태
	private String cgName; // 카테고리
	private int pOriginalPrice; // 할인전 가격
	private int pFinalPrice; // 최종 가격
	private String pName; // 상품이름
	private int pAmount; // 수량
	
	
	public HotDeal() {}

	
	
	public HotDeal(int hNo, String hTitle, int sNo, int pNo, String lCode, String cgName, int pOriginalPrice,
			int pFinalPrice, String pName, int pAmount) {
		super();
		this.hNo = hNo;
		this.hTitle = hTitle;
		this.sNo = sNo;
		this.pNo = pNo;
		this.lCode = lCode;
		this.cgName = cgName;
		this.pOriginalPrice = pOriginalPrice;
		this.pFinalPrice = pFinalPrice;
		this.pName = pName;
		this.pAmount = pAmount;
	}



	public int gethNo() {
		return hNo;
	}


	public void sethNo(int hNo) {
		this.hNo = hNo;
	}


	public String gethTitle() {
		return hTitle;
	}


	public void sethTitle(String hTitle) {
		this.hTitle = hTitle;
	}


	public int getsNo() {
		return sNo;
	}


	public void setsNo(int sNo) {
		this.sNo = sNo;
	}


	public int getpNo() {
		return pNo;
	}


	public void setpNo(int pNo) {
		this.pNo = pNo;
	}


	public Date gethDate() {
		return hDate;
	}


	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}


	public String getlCode() {
		return lCode;
	}


	public void setlCode(String lCode) {
		this.lCode = lCode;
	}


	public String gethStatus() {
		return hStatus;
	}


	public void sethStatus(String hStatus) {
		this.hStatus = hStatus;
	}


	public String getCgName() {
		return cgName;
	}


	public void setCgName(String cgName) {
		this.cgName = cgName;
	}


	public int getpOriginalPrice() {
		return pOriginalPrice;
	}


	public void setpOriginalPrice(int pOriginalPrice) {
		this.pOriginalPrice = pOriginalPrice;
	}


	public int getpFinalPrice() {
		return pFinalPrice;
	}


	public void setpFinalPrice(int pFinalPrice) {
		this.pFinalPrice = pFinalPrice;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public int getpAmount() {
		return pAmount;
	}


	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}



	@Override
	public String toString() {
		return "HotDeal [hNo=" + hNo + ", hTitle=" + hTitle + ", sNo=" + sNo + ", pNo=" + pNo + ", hDate=" + hDate
				+ ", lCode=" + lCode + ", hStatus=" + hStatus + ", cgName=" + cgName + ", pOriginalPrice="
				+ pOriginalPrice + ", pFinalPrice=" + pFinalPrice + ", pName=" + pName + ", pAmount=" + pAmount + "]";
	}
	
	
	
	
}
