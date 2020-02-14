package com.mylocal.myL.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.common.Deal;

public interface AdminService {

	// 공지사항 리스트뷰
	ArrayList<Notice> NoticeSelectList(int currentPage);

	
	// 공지사항 상세보기
	Notice selectNotice(int nNo, boolean flag);
	
	
	// 공지사항 등록
	int NoticeInsert(Notice n);


	// 공지사항 업데이트
	int NoticeUpdate(Notice n);

	// 공지사항 삭제
	int NoticeDelete(int nNo);

	// 범석
	ArrayList<Deal> selectDeal();

	// 범석
	HashMap<String, Integer> selectDeal(String a);


	// 
	ArrayList<Deal> selectDeal(int cNo);

	// 거래량 가져오기
	LinkedHashMap<String, Integer> selectDeal2(int cNo);


	LinkedHashMap<String, Integer> selectDeal3(String a);


	// 모든 거래량 가져오기(관리자)
	HashMap<String, Integer> selectDealAll(String a);

	
	// 선택한 사용자 카테고리 종류 가져오기
	HashMap<String, Integer> selectDealCategory(int cNo);
	

	
	

}
