package com.mylocal.myL.share.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.share.model.vo.Category;
import com.mylocal.myL.share.model.vo.Local;
import com.mylocal.myL.share.model.vo.Reply;
import com.mylocal.myL.share.model.vo.SearchCondition;
import com.mylocal.myL.share.model.vo.ShareBoard;

@Repository("shareDao")
public class ShareDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		
		return sqlSession.selectOne("shareboardMapper.getListCount"); 
	}
	
	public ArrayList<ShareBoard> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, Object> hash = new HashMap<>();
		return (ArrayList)sqlSession.selectList("shareboardMapper.selectList",null, rowbounds);
	}

	public ShareBoard detailBoard(ShareBoard sbno) {
		
		return sqlSession.selectOne("shareboardMapper.detailBoard", sbno);
	}

	public int insertBoard(ShareBoard sb) {
		
		return sqlSession.insert("shareboardMapper.insertBoard",sb);
	}

	public int updateBoard(ShareBoard sbNo) {
		
		return sqlSession.update("shareboardMapper.updateShareBoard", sbNo);
	}

	public int deleteBoard(ShareBoard sbNo) {
		
		return sqlSession.update("shareboardMapper.deleteShareBoard", sbNo);
	}

	public int addReadCount(ShareBoard sbno) {
		
		return sqlSession.update("shareboardMapper.updateCount", sbno);
		
	}
	

	public ArrayList<ShareBoard> selectSearchResultList(SearchCondition sc, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shareboardMapper.selectSearchResultList",sc, rowBounds);
	}

	public int getSearchResultListCount(SearchCondition sc) {
		
		return sqlSession.selectOne("shareboardMapper.selectSearchResultCount",sc);
	}

	public int getCGSearchResultListCount(Category cg) {
		
		return sqlSession.selectOne("shareboardMapper.selectCGSearchResultListCount",cg);
	}

	public ArrayList<ShareBoard> selectCGSearchResultList(Category cg, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		
		return (ArrayList)sqlSession.selectList("shareboardMapper.selectCGSearchResultList",cg, rowBounds);
	}

	public ArrayList<Local> localSelectList(Local lc) {
		
		return (ArrayList)sqlSession.selectList("shareboardMapper.localSelectList", lc);
	}

	public ArrayList<ShareBoard> selectListAddress(PageInfo pi, String location) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("location", location);
		
		return (ArrayList)sqlSession.selectList("shareboardMapper.selectListAddress",hash, rowbounds);
	}

	public ArrayList<String> selectTitleList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shareboardMapper.selectTitleList",null,rowbounds);
	}

	public ArrayList<ShareBoard> searchList(String searchStr) {
		return (ArrayList)sqlSession.selectList("shareboardMapper.searchList", searchStr);
	}

	public int selectSbNo(int sbNo) {
		
		return sqlSession.update("shareMapper.selectSbNo",sbNo);
	}

	public ArrayList<ShareBoard> selectdetailValue(int sbNo) {
		
		return (ArrayList)sqlSession.selectList("shareMapper.selectdetailValue",sbNo);
	}

	public ShareBoard selectOne(int sbNo) {
		
		return sqlSession.selectOne("shareboardMapper.selectOne",sbNo);
	}

	
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyMapper.insertReply", r);
	}
	
	public ArrayList<Reply> selectReplyList(int sbNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("replyMapper.selectList",sbNo);
	}
	
	public int updateReply(Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyMapper.updateReply", r);
	}
	
	public int deleteReply(Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyMapper.deleteReply", r);
	}
	
	
	public Reply selectReply(int rNo) {
		
		return sqlSession.selectOne("replyMapper.selectrNo",rNo);
	}


}
