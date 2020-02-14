package com.mylocal.myL.application.model.vo;

import java.sql.Date;

public class Product {
	private int pNo; // 상품고유번호
	private String pName; //상품이름
	private String pThumb; //썸네일(후)
	private String pOriginalT; // 썸네일(전) (20.01.16. 수정)
	private int pOriginalPrice; //할인전가격
	private int pFinalPrice; //최종판매가격
	private int pAmount; //판매수량
	private String pInfoImage; //상품정보(이미지)(후)
	private String pOriginalInfoI; // 상품정보(이미지)(전) (20.01.16. 수정)
	private String pInfoText; //상품정보(텍스트)
	private String cgCode; //카테고리
	private Date pDate; // 등록일자
	private String pStatus; //상태
	private String pVolume; // 용량/크기 (20.01.15. 수정)
	private String pProductDate; // 제조연월 (20.01.15. 수정)
	private String pTreatment; // 취급방법  (20.01.15. 수정)
	private String pStarRate; // 별점
	private String pOrigin; // 원산지
	private String pTitle; // 상품제목
	private String pBoard; // 상품 게시판(땡/핫딜)
	private int cNo;
	private String lCode; // 지역코드(20.01.20. 추가)
	private Date pStartDate; // 판매시작일(20.01.25. 수정)
	private Date pEndDate; // 판매종료일 (20.01.25. 수정)
	private String pOriginalImage1; // 추가(20.01.30. 수정)
	private String pImage1;
	private String pOriginalImage2;
	private String pImage2;
	private String pOriginalImage3;
	private String pImage3;
	
	
	
	
	public Product() {}


	public Product(int pNo, String pName, String pThumb, String pOriginalT, int pOriginalPrice, int pFinalPrice,
			int pAmount, String pInfoImage, String pOriginalInfoI, String pInfoText, String cgCode, Date pDate,
			String pStatus, String pVolume, String pProductDate, String pTreatment, String pStarRate, String pOrigin,
			String pTitle, String pBoard, int cNo, String lCode, Date pStartDate, Date pEndDate, String pOriginalImage1,
			String pImage1, String pOriginalImage2, String pImage2, String pOriginalImage3, String pImage3) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pThumb = pThumb;
		this.pOriginalT = pOriginalT;
		this.pOriginalPrice = pOriginalPrice;
		this.pFinalPrice = pFinalPrice;
		this.pAmount = pAmount;
		this.pInfoImage = pInfoImage;
		this.pOriginalInfoI = pOriginalInfoI;
		this.pInfoText = pInfoText;
		this.cgCode = cgCode;
		this.pDate = pDate;
		this.pStatus = pStatus;
		this.pVolume = pVolume;
		this.pProductDate = pProductDate;
		this.pTreatment = pTreatment;
		this.pStarRate = pStarRate;
		this.pOrigin = pOrigin;
		this.pTitle = pTitle;
		this.pBoard = pBoard;
		this.cNo = cNo;
		this.lCode = lCode;
		this.pStartDate = pStartDate;
		this.pEndDate = pEndDate;
		this.pOriginalImage1 = pOriginalImage1;
		this.pImage1 = pImage1;
		this.pOriginalImage2 = pOriginalImage2;
		this.pImage2 = pImage2;
		this.pOriginalImage3 = pOriginalImage3;
		this.pImage3 = pImage3;
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


	public String getpOriginalT() {
		return pOriginalT;
	}


	public void setpOriginalT(String pOriginalT) {
		this.pOriginalT = pOriginalT;
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


	public String getpOriginalInfoI() {
		return pOriginalInfoI;
	}


	public void setpOriginalInfoI(String pOriginalInfoI) {
		this.pOriginalInfoI = pOriginalInfoI;
	}


	public String getpInfoText() {
		return pInfoText;
	}


	public void setpInfoText(String pInfoText) {
		this.pInfoText = pInfoText;
	}


	public String getCgCode() {
		return cgCode;
	}


	public void setCgCode(String cgCode) {
		this.cgCode = cgCode;
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


	public String getpVolume() {
		return pVolume;
	}


	public void setpVolume(String pVolume) {
		this.pVolume = pVolume;
	}


	public String getpProductDate() {
		return pProductDate;
	}


	public void setpProductDate(String pProductDate) {
		this.pProductDate = pProductDate;
	}


	public String getpTreatment() {
		return pTreatment;
	}


	public void setpTreatment(String pTreatment) {
		this.pTreatment = pTreatment;
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


	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}


	public String getlCode() {
		return lCode;
	}


	public void setlCode(String lCode) {
		this.lCode = lCode;
	}


	public Date getpStartDate() {
		return pStartDate;
	}


	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}


	public Date getpEndDate() {
		return pEndDate;
	}


	public void setpEndDate(Date pEndDate) {
		this.pEndDate = pEndDate;
	}


	public String getpOriginalImage1() {
		return pOriginalImage1;
	}


	public void setpOriginalImage1(String pOriginalImage1) {
		this.pOriginalImage1 = pOriginalImage1;
	}


	public String getpImage1() {
		return pImage1;
	}


	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}


	public String getpOriginalImage2() {
		return pOriginalImage2;
	}


	public void setpOriginalImage2(String pOriginalImage2) {
		this.pOriginalImage2 = pOriginalImage2;
	}


	public String getpImage2() {
		return pImage2;
	}


	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}


	public String getpOriginalImage3() {
		return pOriginalImage3;
	}


	public void setpOriginalImage3(String pOriginalImage3) {
		this.pOriginalImage3 = pOriginalImage3;
	}


	public String getpImage3() {
		return pImage3;
	}


	public void setpImage3(String pImage3) {
		this.pImage3 = pImage3;
	}


	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pName=" + pName + ", pThumb=" + pThumb + ", pOriginalT=" + pOriginalT
				+ ", pOriginalPrice=" + pOriginalPrice + ", pFinalPrice=" + pFinalPrice + ", pAmount=" + pAmount
				+ ", pInfoImage=" + pInfoImage + ", pOriginalInfoI=" + pOriginalInfoI + ", pInfoText=" + pInfoText
				+ ", cgCode=" + cgCode + ", pDate=" + pDate + ", pStatus=" + pStatus + ", pVolume=" + pVolume
				+ ", pProductDate=" + pProductDate + ", pTreatment=" + pTreatment + ", pStarRate=" + pStarRate
				+ ", pOrigin=" + pOrigin + ", pTitle=" + pTitle + ", pBoard=" + pBoard + ", cNo=" + cNo + ", lCode="
				+ lCode + ", pStartDate=" + pStartDate + ", pEndDate=" + pEndDate + ", pOriginalImage1="
				+ pOriginalImage1 + ", pImage1=" + pImage1 + ", pOriginalImage2=" + pOriginalImage2 + ", pImage2="
				+ pImage2 + ", pOriginalImage3=" + pOriginalImage3 + ", pImage3=" + pImage3 + "]";
	}

	
	


	







	





	
	
}
