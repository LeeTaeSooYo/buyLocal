package com.mylocal.myL.admin.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.admin.model.dao.AdminDao;
import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.common.Pagination;

@Service("adService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDao adDao;

	// 공지사항 목록 조회
	@Override
	public ArrayList<Notice> NoticeSelectList(int currentPage) {
		
		int listCount = adDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		return adDao.NoticeSelectList(pi);
	}

	// 공지사항 등록
	@Override
	public int NoticeInsert(Notice n) {
		return adDao.NoticeInsert(n);
	}

	// 공지사항 상세보기
	@Override
	public Notice selectNotice(int nNo, boolean flag) {
		
		if(!flag) {
			adDao.addReadCount(nNo);
		}
		
		
		return adDao.NoticeSelectOne(nNo);
	}


	// 공지사항 수정
	@Override
	public int NoticeUpdate(Notice n) {
		return adDao.NoticeUpdatet(n);
	}

	// 공지사항 삭제
	@Override
	public int NoticeDelete(int nNo) {
		return adDao.NoticeDelete(nNo);
	}

	// 범석
	@Override
	public ArrayList<Deal> selectDeal() {
		return adDao.selectDeal();
	}

	// 범석
	@Override
	public HashMap<String, Integer> selectDeal(String a) {
		return adDao.selectDeal(a);
	}

	@Override
	public ArrayList<Deal> selectDeal(int cNo) {
		return adDao.selectDeal(cNo);
	}

	// 거래량 가져오기
	@Override
	public LinkedHashMap<String, Integer> selectDeal2(int cNo) {
	
		return adDao.selectDeal2(cNo);
	}

	// 총합 거래량 가져오기
	@Override
	public LinkedHashMap<String, Integer> selectDeal3(String a) {
		return adDao.selectDeal3(a);	
		}

	
	// 종합 분류량 가져오기(가전/기타 등등)
	@Override
	public HashMap<String, Integer> selectDealAll(String a) {
		return adDao.selectDealAll(a);
	}

	
	// 선택한 사용자 카테고리 통계용
	@Override
	public HashMap<String, Integer> selectDealCategory(int cNo) {
		return adDao.selectDealCategory(cNo);
	}





	

	


	
	
}
