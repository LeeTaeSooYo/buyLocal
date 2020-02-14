package com.mylocal.myL.shop.hotDeal.model.vo;

public class Review {
	private int rvNo;
	private int rvStarRate;
	private String rvContent;
	private String cName;
	private String rvStatus;
	private int pNo;
	private int cNo;
	
	public Review() {}

	public Review(int rvNo, int rvStarRate, String rvContent, String cName, int pNo, int cNo) {
		super();
		this.rvNo = rvNo;
		this.rvStarRate = rvStarRate;
		this.rvContent = rvContent;
		this.cName = cName;
		this.pNo = pNo;
		this.cNo = cNo;
	}
	
	

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public int getRvStarRate() {
		return rvStarRate;
	}

	public void setRvStarRate(int rvStarRate) {
		this.rvStarRate = rvStarRate;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getRvStatus() {
		return rvStatus;
	}

	public void setRvStatus(String rvStatus) {
		this.rvStatus = rvStatus;
	}

	@Override
	public String toString() {
		return "Review [rvNo=" + rvNo + ", rvStarRate=" + rvStarRate + ", rvContent=" + rvContent + ", cName=" + cName
				+ ", rvStatus=" + rvStatus + "]";
	}
}
