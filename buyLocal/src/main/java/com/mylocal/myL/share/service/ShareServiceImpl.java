package com.mylocal.myL.share.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.share.dao.ShareDao;
import com.mylocal.myL.share.model.vo.Category;
import com.mylocal.myL.share.model.vo.Local;
import com.mylocal.myL.share.model.vo.Pagination;
import com.mylocal.myL.share.model.vo.Reply;
import com.mylocal.myL.share.model.vo.SearchCondition;
import com.mylocal.myL.share.model.vo.ShareBoard;

@Service("shareService")
public class ShareServiceImpl implements ShareService{
	
	@Autowired
	private ShareDao shareDao;

	@Override
	public ArrayList<ShareBoard> selectList(int currentPage) {
		int listCount = shareDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return shareDao.selectList(pi);
	}

	@Override
	public int insertBoard(ShareBoard sb) {
		
		return shareDao.insertBoard(sb);
	}


	@Override
	public int updateBoard(ShareBoard sbNo) {
		
		
		return shareDao.updateBoard(sbNo);
	}

	@Override
	public int deleteBoard(ShareBoard sbNo) {
		
		return shareDao.deleteBoard(sbNo);
	}

	@Override
	public ShareBoard detailBoard(ShareBoard sbno, boolean flag) {
		if(!flag) {
			shareDao.addReadCount(sbno);
		}
		
		return shareDao.detailBoard(sbno);
	}

	@Override
	public int insertReply(Reply r) {
		return shareDao.insertReply(r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int sbNo) {
		return shareDao.selectReplyList(sbNo);
	}

	@Override
	public int updateReply(Reply r) {
		// TODO Auto-generated method stub
		return shareDao.updateReply(r);
	}

	@Override
	public int deleteReply(Reply r) {
		// TODO Auto-generated method stub
		return shareDao.deleteReply(r);
	}

	@Override
	public ArrayList<ShareBoard> selectSearchResultList(SearchCondition sc, PageInfo pi) {
		
		return shareDao.selectSearchResultList(sc, pi);
	}

	@Override
	public int getSearchResultListCount(SearchCondition sc) {
		// TODO Auto-generated method stub
		return shareDao.getSearchResultListCount(sc);
	}

	@Override
	public int getCGSearchResultListCount(Category cg) {
		
		return shareDao.getCGSearchResultListCount(cg);
	}

	@Override
	public ArrayList<ShareBoard> selectCGSearchResultList(Category cg, PageInfo pi) {
		
		return shareDao.selectCGSearchResultList(cg,pi);
	}

	@Override
	public ArrayList<Local> localSelectList(Local lc) {
		
		return shareDao.localSelectList(lc);
	}

	@Override
	public ArrayList<ShareBoard> selectListAddress(int currentPage, String location) {
		int listCount = 0;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return shareDao.selectListAddress(pi, location);
	}

	@Override
	public ArrayList<String> selectTitleList(int currentPage) {
		int listCount = 0;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return shareDao.selectTitleList(pi);
	}

	@Override
	public ArrayList<ShareBoard> searchList(String searchStr) {
		return shareDao.searchList(searchStr);
	}

	@Override
	public int selectSbNo(int sbNo) {
		
		return shareDao.selectSbNo(sbNo);
	}

	@Override
	public ArrayList<ShareBoard> selectdetailValue(int sbNo) {
		// TODO Auto-generated method stub
		return shareDao.selectdetailValue(sbNo);
	}

	@Override
	public ShareBoard selectOne(int sbNo) {
		
		return shareDao.selectOne(sbNo);
	}

	@Override
	public Reply selectReply(int rNo) {
		
		return shareDao.selectReply(rNo);
	}

}
