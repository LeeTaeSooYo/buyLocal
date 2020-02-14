package com.mylocal.myL.common;

public class Favorite {
	private int pNo;
	private int cNo;
	private String pName;
	private int pFinalPrice;
	private String cgName;
	private String pThumb; // 추가 
	
	public Favorite() {}

	public Favorite(int pNo, int cNo, String pName, int pFinalPrice, String cgName) {
		super();
		this.pNo = pNo;
		this.cNo = cNo;
		this.pName = pName;
		this.pFinalPrice = pFinalPrice;
		this.cgName = cgName;
	}

	
	public Favorite(int pNo, int cNo, String pName, int pFinalPrice, String cgName, String pThumb) {
		super();
		this.pNo = pNo;
		this.cNo = cNo;
		this.pName = pName;
		this.pFinalPrice = pFinalPrice;
		this.cgName = cgName;
		this.pThumb = pThumb;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpFinalPrice() {
		return pFinalPrice;
	}

	public void setpFinalPrice(int pFinalPrice) {
		this.pFinalPrice = pFinalPrice;
	}

	public String getCgName() {
		return cgName;
	}

	public void setCgName(String cgName) {
		this.cgName = cgName;
	}

	
	
	public String getpThumb() {
		return pThumb;
	}

	public void setpThumb(String pThumb) {
		this.pThumb = pThumb;
	}

	@Override
	public String toString() {
		return "Favorite [pNo=" + pNo + ", cNo=" + cNo + ", pName=" + pName + ", pFinalPrice=" + pFinalPrice
				+ ", cgName=" + cgName + "]";
	}
	
	
}
