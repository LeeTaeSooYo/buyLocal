package com.mylocal.myL.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;
public class Product {
	private int pNo; // 상품고유번호
	private String pName; //상품이름
	private String pThumb; //썸네일
	private int pOriginalPrice; //할인전가격
	private int pFinalPrice; //최종판매가격
	private int pAmount; //판매수량
	private String pInfoImage; //상품정보(이미지)
	private String pInfoText; //상품정보(텍스트)
	private String cgName; //카테고리
	private Date pDate; // 등록일자
	private String pStatus; //상태
	private String lName; //지역
	private int cNo;
	private String cName; // 사업자명
	private String bShopAddress; // 상호명
	private String cPhone; // 전화번호
	private String pStarRate;
	private String pOrigin;
	private String pTitle;
	private String pBoard;
	
	
	public Product() {}


	public Product(int pNo, String pName, String pThumb, int pOriginalPrice, int pFinalPrice, int pAmount,
			String pInfoImage, String pInfoText, String cgName, Date pDate, String pStatus, String lName, int cNo,
			String cName, String bShopAddress, String cPhone, String pStarRate, String pOrigin, String pTitle,
			String pBoard) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pThumb = pThumb;
		this.pOriginalPrice = pOriginalPrice;
		this.pFinalPrice = pFinalPrice;
		this.pAmount = pAmount;
		this.pInfoImage = pInfoImage;
		this.pInfoText = pInfoText;
		this.cgName = cgName;
		this.pDate = pDate;
		this.pStatus = pStatus;
		this.lName = lName;
		this.cNo = cNo;
		this.cName = cName;
		this.bShopAddress = bShopAddress;
		this.cPhone = cPhone;
		this.pStarRate = pStarRate;
		this.pOrigin = pOrigin;
		this.pTitle = pTitle;
		this.pBoard = pBoard;
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


	public String getpThumb() {
		return pThumb;
	}


	public void setpThumb(String pThumb) {
		this.pThumb = pThumb;
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


	public int getpAmount() {
		return pAmount;
	}


	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}


	public String getpInfoImage() {
		return pInfoImage;
	}


	public void setpInfoImage(String pInfoImage) {
		this.pInfoImage = pInfoImage;
	}


	public String getpInfoText() {
		return pInfoText;
	}


	public void setpInfoText(String pInfoText) {
		this.pInfoText = pInfoText;
	}


	public String getCgName() {
		return cgName;
	}


	public void setCgName(String cgName) {
		this.cgName = cgName;
	}


	public Date getpDate() {
		return pDate;
	}


	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}


	public String getpStatus() {
		return pStatus;
	}


	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}


	public String getlName() {
		return lName;
	}


	public void setlName(String lName) {
		this.lName = lName;
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


	public String getbShopAddress() {
		return bShopAddress;
	}


	public void setbShopAddress(String bShopAddress) {
		this.bShopAddress = bShopAddress;
	}


	public String getcPhone() {
		return cPhone;
	}


	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}


	public String getpStarRate() {
		return pStarRate;
	}


	public void setpStarRate(String pStarRate) {
		this.pStarRate = pStarRate;
	}


	public String getpOrigin() {
		return pOrigin;
	}


	public void setpOrigin(String pOrigin) {
		this.pOrigin = pOrigin;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpBoard() {
		return pBoard;
	}


	public void setpBoard(String pBoard) {
		this.pBoard = pBoard;
	}


	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pName=" + pName + ", pThumb=" + pThumb + ", pOriginalPrice=" + pOriginalPrice
				+ ", pFinalPrice=" + pFinalPrice + ", pAmount=" + pAmount + ", pInfoImage=" + pInfoImage
				+ ", pInfoText=" + pInfoText + ", cgName=" + cgName + ", pDate=" + pDate + ", pStatus=" + pStatus
				+ ", lName=" + lName + ", cNo=" + cNo + ", cName=" + cName + ", bShopAddress=" + bShopAddress
				+ ", cPhone=" + cPhone + ", pStarRate=" + pStarRate + ", pOrigin=" + pOrigin + ", pTitle=" + pTitle
				+ ", pBoard=" + pBoard + "]";
	}


	
	
   
  
   

   
   
}