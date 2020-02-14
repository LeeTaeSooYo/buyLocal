package com.mylocal.myL.admin.model.service;


import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.admin.model.dao.AdContentDao;
import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.admin.model.vo.Product;
import com.mylocal.myL.admin.model.vo.QnA;
import com.mylocal.myL.admin.model.vo.Report;
import com.mylocal.myL.admin.model.vo.ShareBoard;
import com.mylocal.myL.common.Deal;


@Service("adContentService")
public class AdContentServiceImpl implements AdContentService{
	@Autowired
	AdContentDao adContentDao;

		// 신고 목록
		@Override
		public ArrayList<Report> ReportSelectList() {
			return adContentDao.ReportSelectList();
		}
		
		// 신고 목록(신고당한 사람들)
		@Override
		public ArrayList<Report> ReportSelectList2() {
			return adContentDao.ReportSelectList2();
		}

		// QnA 미답변 목록
		@Override
		public ArrayList<QnA> QnASelectList() {
			return adContentDao.QnASelectList();
		}
		
		// QnA 답변 목록
		@Override
		public ArrayList<QnA> QnASelectList2() {
			return adContentDao.QnASelectList2();
		}

		// 아래 3개는 게시글 모아보기
		@Override
		public ArrayList<Product> TtangSelectList() {
			return adContentDao.TtangSelectList();
		}
		@Override
		public ArrayList<Product> HotDealSelectList() {
			return adContentDao.HotDealSelectList();
		}
		@Override
		public ArrayList<ShareBoard> ShareBoardSelectList() {
			return adContentDao.ShareBoardSelectList();
		}

		
		
		
		// 아래 3개는 신고리스트 상세보기 타러가기


		/*@Override
		public ShareBoard SelectShareboard(int rt_no) {
			return adContentDao.SelectShareboard(rt_no);
		}*/

		// qna 갯수 count status='y'인것만
		@Override
		public int CountQna() {
			// TODO Auto-generated method stub
			return adContentDao.getQnaListCount();
		}
		
		// 신고 갯수 count status='Y' 인것만
		@Override
		public int CountReport() {
			return adContentDao.getReportListCount();
		}

		// qna 상세보기
		@Override
		public QnA selctQna(int qNo) {
			// TODO Auto-generated method stub
			return adContentDao.SelectQna(qNo);
		}

		// qna 답변했으면 완료처리하기
		@Override
		public int updateQna(int qNo) {
			return adContentDao.UpdateQna(qNo);
		}

		// 신고하기 물건구매 폼(핫딜 땡처리)
		@Override
		public int ReportInsert(Report r) {
			return adContentDao.InsertReport(r);
		}
		
		// 신고하기 게시판폼
		@Override
		public int ReportInsert1(Report r) {
			return adContentDao.InsertReport1(r);
		}

		// 신고하기 상세보기
		@Override
		public Report selectReport(int rtNo) {
			return adContentDao.SelectReport(rtNo);
		}

		// 허위신고 처리하기
		@Override
		public int deleteReport(int rtNo) {
			return adContentDao.UpdateReportCancel(rtNo);
		}

		// 신고된 상품 정보가져오기
		@Override
		public Product SelectProduct(int rtNo) {
			// TODO Auto-generated method stub
			return adContentDao.SelectProduct(rtNo);
		}

		// 신고처리하기(회원)
		@Override
		public int updateCustomer(int getcNo) {
			// TODO Auto-generated method stub
			return adContentDao.uptdateCustomer(getcNo);
		}

		// 신고처리 취소해주기
		@Override
		public int updateCustomer2(int getcNo) {
			return adContentDao.uptdateCustomer2(getcNo);
		}

		// 공지사항 리스트 가져오기
		@Override
		public ArrayList<Notice> NoticeSelectList() {
			return adContentDao.NoticeSelectList();
		}

		// 통계 가져오기
		@Override
		public ArrayList<Deal> selectDeal() {
			return adContentDao.selectDeal();
		}

		// 원하는 통계값 가져오기
		@Override
		public LinkedHashMap<String, Integer> selectDeal(String a) {
			return adContentDao.selectDeal(a);
		}

		// 신고처리할경우 businessInfo도 변경되게끔
		@Override
		public int updateBusinessInfo(int getcNo) {
			return adContentDao.updateBusinessInfo(getcNo);
		}

		// 해당관련 상품들 모두 아웃
		@Override
		public int updateProduct(int getcNo) {
			return adContentDao.updateProduct(getcNo);
		}











	


	
	
}
