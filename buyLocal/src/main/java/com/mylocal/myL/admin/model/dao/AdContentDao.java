package com.mylocal.myL.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.admin.model.vo.Product;
import com.mylocal.myL.admin.model.vo.QnA;
import com.mylocal.myL.admin.model.vo.Report;
import com.mylocal.myL.admin.model.vo.ShareBoard;
import com.mylocal.myL.common.Deal;



@Repository("adContentDao")
public class AdContentDao {
	@Autowired
	SqlSessionTemplate sqlSession;



		// 신고 목록
		public ArrayList<Report> ReportSelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.ReportSelectList");
		}
		
		// 신고 당한사람들 목록
		public ArrayList<Report> ReportSelectList2() {
			return (ArrayList)sqlSession.selectList("adContentMapper.ReportSelectList2");
		}

		// QnA 미응답 목록
		public ArrayList<QnA> QnASelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.QnASelectList");
		}
		
		// QnA 답변 목록
		public ArrayList<QnA> QnASelectList2() {
			return (ArrayList)sqlSession.selectList("adContentMapper.QnASelectList2");
		}

		// 게시글 목록(땡처리/핫딜/나눔게시판)
		public ArrayList<Product> TtangSelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.TtangSelectList");
		}
		public ArrayList<Product> HotDealSelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.HotDealSelectList");
		}
		public ArrayList<ShareBoard> ShareBoardSelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.ShareBoardSelectList");
		}
		
		// 공지사항 리스트 조회
		public ArrayList<Notice> NoticeSelectList() {
			return (ArrayList)sqlSession.selectList("adContentMapper.NoticeSelectList");
		}

		
		
		// 게시글 목록 보러가기(상세보기를 위한)



/*		public ShareBoard SelectShareboard(int rt_no) {
			return sqlSession.selectOne("adContentMapper.ShareBoardSelectList");	
			}*/

		// qna 갯수 가져오기
		public int getQnaListCount() {
			return sqlSession.selectOne("adContentMapper.getQnaListCount");	
		}

		// qna 상세보기
		public QnA SelectQna(int qNo) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("adContentMapper.selectQna", qNo);
		}

		public int UpdateQna(int qNo) {
			return sqlSession.update("adContentMapper.updateQna", qNo);
		}

		// 신고하기 입력(핫딜 / 땡처리)
		public int InsertReport(Report r) {
			return sqlSession.update("adContentMapper.insertReport", r);
		}
		
		// 신고하기 입력
		public int InsertReport1(Report r) {
			return sqlSession.update("adContentMapper.insertReport1", r);
		}


		// 신고된 갯수 불러오기
		public int getReportListCount() {
			return sqlSession.selectOne("adContentMapper.getReportListCount");	
		}
		// 신고하기 상세보기
		public Report SelectReport(int rtNo) {
			return sqlSession.selectOne("adContentMapper.selectReport", rtNo);
		}

		public int UpdateReportCancel(int rtNo) {
			return sqlSession.update("adContentMapper.updateReportCancel", rtNo);
		}

		public Product SelectProduct(int rtNo) {
			return sqlSession.selectOne("adContentMapper.selectProduct", rtNo);
		}

		// 회원 신고처리
		public int uptdateCustomer(int getcNo) {
			return sqlSession.update("adContentMapper.updateCustomer", getcNo);
		}

		// 회원 신고처리 취소해주기
		public int uptdateCustomer2(int getcNo) {
			return sqlSession.update("adContentMapper.updateCustomer2", getcNo);
		}

		// 다른 매퍼에서 가져오자
		public ArrayList<Deal> selectDeal() {
			return (ArrayList)sqlSession.selectList("adContentMapper.selectDeal");
		}

		public LinkedHashMap<String, Integer> selectDeal(String a) {
			LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
		      
		      String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24"};
		      int categoryR[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		      for(int i = 0; i < categoryR.length; i++) {
		         HashMap<String, String> h = new HashMap<>();
		         h.put("str", category[i]);
		         categoryR[i] = sqlSession.selectOne("adContentMapper.selectDeal2", h);
		         System.out.println(category[i] + " : " + categoryR[i]);

		         
		      }
		      result.put("01", categoryR[0]);
		      result.put("02", categoryR[1]);
		      result.put("03", categoryR[2]);
		      result.put("04", categoryR[3]);
		      result.put("05", categoryR[4]);
		      result.put("06", categoryR[5]);
		      result.put("07", categoryR[6]);
		      result.put("08", categoryR[7]);
		      result.put("09", categoryR[8]);
		      result.put("10", categoryR[9]);
		      
		      result.put("11", categoryR[10]);
		      result.put("12", categoryR[11]);
		      result.put("13", categoryR[12]);
		      result.put("14", categoryR[13]);
		      result.put("15", categoryR[14]);
		      result.put("16", categoryR[15]);
		      result.put("17", categoryR[16]);
		      result.put("18", categoryR[17]);
		      result.put("19", categoryR[18]);
		      result.put("20", categoryR[19]);
		      
		      result.put("21", categoryR[20]);
		      result.put("22", categoryR[21]);
		      result.put("23", categoryR[22]);
		      result.put("24", categoryR[23]);
		  
		      
		      return result;
		}

		public int updateBusinessInfo(int getcNo) {
			return sqlSession.update("adContentMapper.updateBusinessInfo", getcNo);
		}

		public int updateProduct(int getcNo) {
			return sqlSession.update("adContentMapper.updateProduct", getcNo);
		}


	




	
	
}
