package com.mylocal.myL.share.model.vo;

public class Category {
	private String allresult;
	private String sell;
	private String buy;
	private String share;
	private String information;
	private String etc;
	
	
	public Category() {}


	public Category(String allresult, String sell, String buy, String share, String information, String etc) {
		super();
		this.allresult = allresult;
		this.sell = sell;
		this.buy = buy;
		this.share = share;
		this.information = information;
		this.etc = etc;
	}


	public String getAllresult() {
		return allresult;
	}


	public void setAllresult(String allresult) {
		this.allresult = allresult;
	}


	public String getSell() {
		return sell;
	}


	public void setSell(String sell) {
		this.sell = sell;
	}


	public String getBuy() {
		return buy;
	}


	public void setBuy(String buy) {
		this.buy = buy;
	}


	public String getShare() {
		return share;
	}


	public void setShare(String share) {
		this.share = share;
	}


	public String getInformation() {
		return information;
	}


	public void setInformation(String information) {
		this.information = information;
	}


	public String getEtc() {
		return etc;
	}


	public void setEtc(String etc) {
		this.etc = etc;
	}


	@Override
	public String toString() {
		return "Category [allresult=" + allresult + ", sell=" + sell + ", buy=" + buy + ", share=" + share
				+ ", information=" + information + ", etc=" + etc + "]";
	}
}
