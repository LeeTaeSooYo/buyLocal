package com.mylocal.myL.share.service;

import java.util.ArrayList;

import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.share.model.vo.Category;
import com.mylocal.myL.share.model.vo.Local;
import com.mylocal.myL.share.model.vo.Reply;
import com.mylocal.myL.share.model.vo.SearchCondition;
import com.mylocal.myL.share.model.vo.ShareBoard;

public interface ShareService {

	// 게시글 목록 조회
	public ArrayList<ShareBoard> selectList(int currentPage);

	// 게시글 쓰기
	public int insertBoard(ShareBoard sb);

	// 게시글 상세보기
	public ShareBoard detailBoard(ShareBoard sbno, boolean flag);

	// 게시글 수정
	public int updateBoard(ShareBoard sbNo);

	// 게시글 삭제
	public int deleteBoard(ShareBoard sbNo);

	//댓글 등록 
	public int insertReply(Reply r);

	// 댓글 목록조회
	public ArrayList<Reply> selectReplyList(int sbNo);

	// 댓글 수정
	public int updateReply(Reply r);

	// 댓글 삭제
	public int deleteReply(Reply r);

	// 실제검색 result 
	public ArrayList<ShareBoard> selectSearchResultList(SearchCondition sc, PageInfo pi);

	//검색목록 개수 알아오기
	public int getSearchResultListCount(SearchCondition sc);

	// 카테고리 개수 알아오기
	public int getCGSearchResultListCount(Category cg);

	//카테고리 검색목록뿌려주기.
	public ArrayList<ShareBoard> selectCGSearchResultList(Category cg, PageInfo pi);

	//지역코드를 받기위함.
	public ArrayList<Local> localSelectList(Local lc);

	//주소를 받아오기위함
	public ArrayList<ShareBoard> selectListAddress(int currentPage, String location);

	// 쿠키값을위한 제목select
	public ArrayList<String> selectTitleList(int currentPage);


	ArrayList<ShareBoard> searchList(String searchStr);

	//게시글번호 히든값을 받기위함.
	public int selectSbNo(int sbNo);

	//히든값저장용
	public ArrayList<ShareBoard> selectdetailValue(int sbNo);

	//수정하기 들어갈떄
	public ShareBoard selectOne(int sbNo);

	//rNo를 select하기위함 1
	public Reply selectReply(int rNo);



	//대댓글 등록
	//public int insertReply2(Reply r);

	

}
