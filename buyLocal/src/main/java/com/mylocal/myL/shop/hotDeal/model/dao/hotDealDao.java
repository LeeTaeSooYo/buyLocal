package com.mylocal.myL.shop.hotDeal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.common.SearchList;
import com.mylocal.myL.shop.hotDeal.model.vo.Product;
import com.mylocal.myL.shop.hotDeal.model.vo.Review;


@Repository("hotDealDao")
public class hotDealDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hotDealMapper.getListCount");
	}
	
	public int getListCount(String location) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hotDealMapper.getListCount2", location);
	}
	
	public int getListCountC(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hotDealMapper.getListCountC", category);
	}

	public ArrayList<Product> selectList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hotDealMapper.selectList", null, rowbounds);
	}
	
	public ArrayList<Product> selectList(PageInfo pi, String location) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		if(location.equals("별점순(high to low)") || location.equals("신상품순") || location.equals("가격순(low to high)")
				|| location.equals("가격순(high to low)")) {
			HashMap<String, Object> h = new HashMap<>();
			h.put("optionArray", location);
			return (ArrayList)sqlSession.selectList("hotDealMapper.selectList4", h, rowbounds);
		}else {
			return (ArrayList)sqlSession.selectList("hotDealMapper.selectList2", location, rowbounds);
		}
	}
	
	public ArrayList<Product> selectList(PageInfo pi, String location, String optionArray) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String, Object> h = new HashMap<>();
		h.put("location", location);
		h.put("optionArray", optionArray);
		
		return (ArrayList)sqlSession.selectList("hotDealMapper.selectList3", h, rowbounds);
	}
	
	public ArrayList<Product> selectListCategory(PageInfo pi, String location, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, Object> h = new HashMap<>();
		h.put("location", location);
		h.put("category", category);
		System.out.println(location + ", "+ category);
		ArrayList<Product> list = (ArrayList)sqlSession.selectList("hotDealMapper.selectListC", h, rowbounds);
		System.out.println(list);
			
		return list;
	}
	
	public ArrayList<Product> selectListCategory(PageInfo pi, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hotDealMapper.selectListC2", category, rowbounds);
	}


	public Product selectBoard(int pNo) {
		return sqlSession.selectOne("hotDealMapper.selectBoard", pNo);
	}

	public ArrayList<Review> seletReviewList(int pNo) {
		return (ArrayList)sqlSession.selectList("hotDealMapper.selectReviewList", pNo);
	}


	public ArrayList<Cart> getMyCart(int cNo) {
		return (ArrayList)sqlSession.selectList("hotDealMapper.getMyCart", cNo);
	}


	public int AddCart(Cart c) {
		return sqlSession.insert("hotDealMapper.addCart", c);
	}


	public int buyProduct(int cNo) {
		//int result = sqlSession.insert("hotDealMapper.insertDeal", );
		return sqlSession.delete("hotDealMapper.buyProduct", cNo);
	}


	public int AddWishList(Favorite f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("hotDealMapper.addWishList", f);
	}


	public ArrayList<Favorite> getMyWishList(int cNo) {
		return (ArrayList)sqlSession.selectList("hotDealMapper.getMyWishList", cNo);
	}


	public int AddReview(Review r) {
		return sqlSession.insert("hotDealMapper.addReview", r);
	}


	public int updateBoard(Product p) {
		return sqlSession.update("hotDealMapper.updateBoard", p);
	}


	public int deleteWishList(Favorite f) {
		return sqlSession.delete("hotDealMapper.deleteWishList", f);
	}


	public int deleteCart(Cart c) {
		return sqlSession.delete("hotDealMapper.deleteCart", c);
	}

	public void insertDeal(Deal d) {
		int result = sqlSession.insert("hotDealMapper.insertDeal", d);
	}

	public Deal selectDeal(int dNo) {
		return sqlSession.selectOne("hotDealMapper.selectDeal", dNo);
	}

	public ArrayList<Product> searchList(String searchStr) {
		ArrayList<SearchList> list = (ArrayList)sqlSession.selectList("hotDealMapper.selectSearchList");
		
		if(list.isEmpty()) {
			sqlSession.insert("hotDealMapper.insertSearchList", searchStr);
		}else {
			boolean tf = false;
			for(int i = 0; i < list.size(); i++) {
				if(searchStr.equals(list.get(i).getSearchStr())){
					sqlSession.update("hotDealMapper.updateSearchList", searchStr);
					tf = true;
					break;
				}
			}
			if(tf == false) {
				sqlSession.insert("hotDealMapper.insertSearchList", searchStr);
			}
		}
		
		
		return (ArrayList)sqlSession.selectList("hotDealMapper.searchList", searchStr);
	}

	public ArrayList<SearchList> selectSearchList() {
		return (ArrayList)sqlSession.selectList("hotDealMapper.selectSearchList");
	}

	

	

	

	

	

	

	


	



	
}
