package com.mylocal.myL.shop.ttang.model.dao;


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
import com.mylocal.myL.shop.ttang.model.vo.Product;

@Repository("ttangDao")
public class ttangDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("ttangMapper.getListCount"); 
	}
	
	public ArrayList<Product> selectList(PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ttangMapper.selectList", null, rowbounds);
	}
	
	
	public Product selectBoard(int pNo) {
		
		// System.out.println("ttangDao Done");
		// System.out.println("pNo(Dao) : " + pNo);
		return sqlSession.selectOne("ttangMapper.selectBoard", pNo);
	}

	// cart랑 wish, deal은 hotdealMapper 공동 사용
	public int AddCart(Cart c) {
		
		System.out.println("AddCart(dao) : " + c);
		return sqlSession.insert("ttangMapper.addCart", c);
	}

	public ArrayList<Cart> getMyCart(int cNo) {
		return (ArrayList)sqlSession.selectList("ttangMapper.getMyCart", cNo);
	}

	public ArrayList<Favorite> getMyWishList(int cNo) {
		return (ArrayList)sqlSession.selectList("ttangMapper.getMyWishList", cNo);
	}

	public int AddWishList(Favorite f) {
		return sqlSession.insert("ttangMapper.addWishList", f);
	}

	public void insertDeal(Deal d) {
		int result = sqlSession.insert("ttangMapper.insertDeal", d);
	}

	public int buyProduct(int cNo) {
		// delete
		return sqlSession.delete("ttangMapper.buyProduct", cNo);
	}

	public int deleteWishList(Favorite f) {
		return sqlSession.delete("ttangMapper.deleteWishList", f);
	}

	public int deleteCart(Cart c) {
		return sqlSession.delete("ttangMapper.deleteCart", c);
	}

	
	// main 
	
	
	public int getListCount(String location) {
		return sqlSession.selectOne("ttangMapper.getListCount2", location);
	}

	public ArrayList<Product> selectList(PageInfo pi, String location) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		if(location.equals("이름순(A-Z)") || location.equals("이름순(Z-A)") || location.equals("가격순(low to high)")
				|| location.equals("가격순(high to low)")) {
			HashMap<String, Object> h = new HashMap<>();
			h.put("optionArray", location);
			return (ArrayList)sqlSession.selectList("ttangMapper.selectList4", h, rowbounds);
		}else {
			return (ArrayList)sqlSession.selectList("ttangMapper.selectList2", location, rowbounds);
		}
	}

	public int getListCountC(String category) {
		return sqlSession.selectOne("ttangMapper.getListCountC", category);
	}

	public ArrayList<Product> selectListCategory(PageInfo pi, String location, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, Object> h = new HashMap<>();
		h.put("location", location);
		h.put("category", category);
		System.out.println(location + ", "+ category);
		ArrayList<Product> list = (ArrayList)sqlSession.selectList("ttangMapper.selectListC", h, rowbounds);
		System.out.println(list);
			
		return list;
	}

	public ArrayList<Product> selectList(PageInfo pi, String location, String optionArray) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String, Object> h = new HashMap<>();
		h.put("location", location);
		h.put("optionArray", optionArray);
		
		return (ArrayList)sqlSession.selectList("ttangMapper.selectList3", h, rowbounds);
	}

	public ArrayList<Product> selectListCategory(PageInfo pi, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ttangMapper.selectListC2", category, rowbounds);
	}

	public ArrayList<com.mylocal.myL.shop.hotDeal.model.vo.Product> searchList(String searchStr) {
		return (ArrayList)sqlSession.selectList("ttangMapper.searchList", searchStr);
	}
	
}
