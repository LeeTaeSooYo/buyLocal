package com.mylocal.myL.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.PageInfo;



@Repository("aDao")
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 갯수 카운트
	public int getListCount() {
		return sqlSession.selectOne("AdminMapper.getListCount");
	}

	// 공지사항 목록 들고 관리자 페이지로도 가고 / 실제 리스트 페이지로도 가고 (관리자페이지는 따로 빼자)
	public ArrayList<Notice> NoticeSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("AdminMapper.NoticeSelectList", null, rowBounds);
	}

	public int NoticeInsert(Notice n) {
		return sqlSession.insert("AdminMapper.NoticeInsert", n);
	}

	public Notice NoticeSelectOne(int nNo) {
		return sqlSession.selectOne("AdminMapper.NoticeSelectOne", nNo);
	}

	public int NoticeUpdatet(Notice n) {
		return sqlSession.update("AdminMapper.NoticeUpdate", n);
	}

	
	// 공지사항 삭제
	public int NoticeDelete(int nNo) {
		return sqlSession.update("AdminMapper.NoticeDelete", nNo);
	}

	// 공지사항 조회수 추가구문
	public int addReadCount(int nNo) {
		return sqlSession.update("AdminMapper.updateCount", nNo); 
	}

 

	
	


	public ArrayList<Deal> selectDeal() {
	      return (ArrayList)sqlSession.selectList("AdminMapper.selectDeal");
	   }

   public HashMap<String, Integer> selectDeal(String a) {
      HashMap<String, Integer> result = new HashMap<>();
      
      String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10"};
      int categoryR[] = {0,0,0,0,0,0,0,0,0,0};
      for(int i = 0; i < categoryR.length; i++) {
         HashMap<String, String> h = new HashMap<>();
         h.put("str", category[i]);
         categoryR[i] = sqlSession.selectOne("AdminMapper.selectDeal2", h);
        
      }
      result.put("디지털/가전", categoryR[0]);
      result.put("의류/패션잡화", categoryR[1]);
      result.put("뷰티/미용", categoryR[2]);
      result.put("스포츠/레저", categoryR[3]);
      result.put("도서/티켓/음반", categoryR[4]);
      result.put("가구/인테리어", categoryR[5]);
      result.put("신선/가공식품", categoryR[6]);
      result.put("게임/취미", categoryR[7]);
      result.put("반려동물용품", categoryR[8]);
      result.put("기타", categoryR[9]);
      
      
      return result;
   }

   public ArrayList<Deal> selectDeal(int cNo) {
		return (ArrayList)sqlSession.selectList("AdminMapper.selectDealSeller", cNo);
	}

   // 거래량 가져오기
public LinkedHashMap<String, Integer> selectDeal2(int cNo) {
	LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
    
    String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12"};
    int categoryR[] = {0,0,0,0,0,0,0,0,0,0,0,0};
    for(int i = 0; i < categoryR.length; i++) {
       HashMap<String, String> h = new HashMap<>();
       h.put("str", category[i]);
       h.put("cNo",  Integer.toString(cNo));
       categoryR[i] = sqlSession.selectOne("AdminMapper.selectDeal3", h);

  
       
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

    
    return result;
}

public LinkedHashMap<String, Integer> selectDeal3(String a) {
LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
    
    String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12"};
    int categoryR[] = {0,0,0,0,0,0,0,0,0,0,0,0};
    for(int i = 0; i < categoryR.length; i++) {
       HashMap<String, String> h = new HashMap<>();
       h.put("str", category[i]);
       categoryR[i] = sqlSession.selectOne("AdminMapper.selectDeal4", h);
       
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
  

    
    return result;
}

//
public HashMap<String, Integer> selectDealAll(String a) {
LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
    
    String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","T1","T2","T3","T4","T5","T6"};
    int categoryR[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    for(int i = 0; i < categoryR.length; i++) {
       HashMap<String, String> h = new HashMap<>();
       h.put("str", category[i]);
       categoryR[i] = sqlSession.selectOne("AdminMapper.selectDealAll", h);
       
  
  
       
    }
    result.put("디지털/가전", categoryR[0]);
    result.put("의류/패션잡화", categoryR[1]);
    result.put("뷰티/미용", categoryR[2]);
    result.put("스포츠/레저", categoryR[3]);
    result.put("도서/티켓/음반", categoryR[4]);
    result.put("가구/인테리어", categoryR[5]);
    result.put("신선/가공식품", categoryR[6]);
    result.put("게임/취미", categoryR[7]);
    result.put("반려동물용품", categoryR[8]);
    result.put("기타", categoryR[9]);
    
    result.put("한식", categoryR[10]);
    result.put("중식", categoryR[11]);
    result.put("일식", categoryR[12]);
    result.put("양식", categoryR[13]);
    result.put("커피/제과", categoryR[14]);
    result.put("땡처리기타", categoryR[15]);

  

    
    return result;
}

// 카테고리 확인용
public HashMap<String, Integer> selectDealCategory(int cNo) {
LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
    
    String category[] = {"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","T1","T2","T3","T4","T5","T6"};
    int categoryR[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    for(int i = 0; i < categoryR.length; i++) {
       HashMap<String, String> h = new HashMap<>();
       h.put("str", category[i]);
       h.put("cNo", Integer.toString(cNo));
       categoryR[i] = sqlSession.selectOne("AdminMapper.selectDealCategory", h);
       
  
  
       
    }
    result.put("디지털/가전", categoryR[0]);
    result.put("의류/패션잡화", categoryR[1]);
    result.put("뷰티/미용", categoryR[2]);
    result.put("스포츠/레저", categoryR[3]);
    result.put("도서/티켓/음반", categoryR[4]);
    result.put("가구/인테리어", categoryR[5]);
    result.put("신선/가공식품", categoryR[6]);
    result.put("게임/취미", categoryR[7]);
    result.put("반려동물용품", categoryR[8]);
    result.put("기타", categoryR[9]);
    
    result.put("한식", categoryR[10]);
    result.put("중식", categoryR[11]);
    result.put("일식", categoryR[12]);
    result.put("양식", categoryR[13]);
    result.put("커피/제과", categoryR[14]);
    result.put("땡처리기타", categoryR[15]);

  

    
    return result;
}

	
	
}
