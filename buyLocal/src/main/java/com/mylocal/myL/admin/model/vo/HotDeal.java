package com.mylocal.myL.admin.model.vo;

import java.sql.Date;

public class HotDeal {

	private int hNo;
	private String hTitle;
	private int sNo; // 회원번호
	private int pNo; // 상품번호
	private Date hDate; // 올린 날짜
	private String lCode; // 지역코드
	private String hStatus; 
	private String sName; // 조인해서 가져올 사업자 이름
	
	public HotDeal() {}
	
	
}
