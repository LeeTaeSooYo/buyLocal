package com.mylocal.myL.admin.model.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.admin.model.vo.Product;
import com.mylocal.myL.admin.model.vo.QnA;
import com.mylocal.myL.admin.model.vo.Report;
import com.mylocal.myL.admin.model.vo.ShareBoard;
import com.mylocal.myL.common.Deal;


public interface AdContentService {

	
	// 신고 목록 보여주기 list 뷰
		ArrayList<Report> ReportSelectList();
		
	// 신고 당한 회원들 리스트 띄어주는 뷰
		ArrayList<Report> ReportSelectList2();


		// 미답변 QnA목록
		ArrayList<QnA> QnASelectList();
		
		// 답변 QnA 목록
		ArrayList<QnA> QnASelectList2();

		// 아래 3개는 게시글 모아보기
		ArrayList<Product> TtangSelectList();
		ArrayList<Product> HotDealSelectList();
		ArrayList<ShareBoard> ShareBoardSelectList();
		
		
		// 통계 가져오기
		ArrayList<Deal> selectDeal();




		/*ShareBoard SelectShareboard(int rt_no);*/

		
		// qna 갯수 가져오기
		int CountQna();
		
		// 신고리스트 카운트
		int CountReport();

		// qna 상세보기
		QnA selctQna(int qNo);
		
		
		
		// 답변한 내용은 안보이게끔 status
		int updateQna(int qNo);

		// 신고하기 물건등록폼
		int ReportInsert(Report r);
		

		// 신고하기 게시판폼
		int ReportInsert1(Report r);

		Report selectReport(int rtNo);

		// 허위신고 삭제하기
		int deleteReport(int rtNo);

		// 신고될 상품 가져오기
		Product SelectProduct(int rtNo);

		// 회원 신고하기
		int updateCustomer(int getcNo);

		// 회원 신고 철회하기
		int updateCustomer2(int getcNo);
		
		// 공지사항 리스트 가져오기
		ArrayList<Notice> NoticeSelectList();

		// 원하는 통계값 들고오기(없애도 될지도)
		LinkedHashMap<String, Integer> selectDeal(String a);
		
		
		// 신고 처리했을시 사업자 정보도 일반회원으로
		int updateBusinessInfo(int getcNo);

		// 신고됬을시 해당 상품들 모두 내려왓!
		int updateProduct(int getcNo);


	



	






	

		


		
	
	

}
