package com.mylocal.myL.shop.ttang.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.common.Pagination;
import com.mylocal.myL.shop.ttang.model.vo.Product;
import com.mylocal.myL.shop.ttang.model.dao.ttangDao;

@Service("ttangService")
public class ttangServiceImpl implements ttangService{
	@Autowired
	private ttangDao ttangDao;

	@Override
	public ArrayList<Product> selectList(int currentPage) {
		int listCount = ttangDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return ttangDao.selectList(pi);
	}
	
	
	@Override
	public Product selectBoard(int pNo, boolean flag) {
		
		// System.out.println("ttangServiceImpl Done");
		// System.out.println("pNo(Impl) : " + pNo);
		return ttangDao.selectBoard(pNo);
	}

	@Override
	public int AddCart(Cart c) {
		
		System.out.println("AddCart(impl) : " + c);
		
		return ttangDao.AddCart(c);
	}

	@Override
	public ArrayList<Cart> getMyCart(int cNo) {
		return ttangDao.getMyCart(cNo);
	}


	@Override
	public ArrayList<Favorite> getMyWishList(int cNo) {
		return ttangDao.getMyWishList(cNo);
	}


	@Override
	public int AddWishList(Favorite f) {
		
		System.out.println("f : " + f);
		
		return ttangDao.AddWishList(f);
	}


	@Override
	public void insertDeal(Deal d) {
		ttangDao.insertDeal(d);
	}


	@Override
	public int buyProduct(int cNo) {
		return ttangDao.buyProduct(cNo);
	}


	@Override
	public int deleteWishList(Favorite f) {
		return ttangDao.deleteWishList(f);
	}


	@Override
	public int deleteCart(Cart c) {
		return ttangDao.deleteCart(c);
	}

	// 여기서 부터 main 

	@Override
	public ArrayList<Product> selectList(int currentPage, String location) {
		int listCount = 0;
		
		if(location.equals("이름순(A-Z)") || location.equals("이름순(Z-A)") || location.equals("가격순(low to high)")
				|| location.equals("가격순(high to low)")) {
			listCount = ttangDao.getListCount();
		}else {
			listCount = ttangDao.getListCount(location);
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return ttangDao.selectList(pi, location);
	}


	@Override
	public ArrayList<Product> selectListCategory(int currentPage, String location, String category) {
		int listCount = ttangDao.getListCountC(category);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return ttangDao.selectListCategory(pi, location, category);
	}


	@Override
	public ArrayList<Product> selectList(int currentPage, String location, String optionArray) {
		int listCount = ttangDao.getListCount(location);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return ttangDao.selectList(pi, location, optionArray);
	}


	@Override
	public ArrayList<Product> selectListCategory(int currentPage, String category) {
		int listCount = ttangDao.getListCountC(category);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return ttangDao.selectListCategory(pi, category);
	}


	@Override
	public ArrayList<com.mylocal.myL.shop.hotDeal.model.vo.Product> searchList(String searchStr) {
		return ttangDao.searchList(searchStr);
	}



}
