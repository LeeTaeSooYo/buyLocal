package com.mylocal.myL.shop.hotDeal.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.common.Pagination;
import com.mylocal.myL.common.SearchList;
import com.mylocal.myL.shop.hotDeal.model.dao.hotDealDao;

import com.mylocal.myL.shop.hotDeal.model.vo.Product;
import com.mylocal.myL.shop.hotDeal.model.vo.Review;


@Service("hotDealService")
public class hotDealServiceImpl implements hotDealService{
	@Autowired
	private hotDealDao hotdealDao;
	
	@Override
	public ArrayList<Product> selectList(int currentPage) {

		int listCount = hotdealDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return hotdealDao.selectList(pi);
	}

	@Override
	public ArrayList<Product> selectList(int currentPage, String location) {
		
		int listCount = 0;
		
		if(location.equals("별점순(high to low)") || location.equals("신상품순") || location.equals("가격순(low to high)")
				|| location.equals("가격순(high to low)")) {
			listCount = hotdealDao.getListCount();
		}else {
			listCount = hotdealDao.getListCount(location);
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return hotdealDao.selectList(pi, location);
	}
	
	@Override
	public ArrayList<Product> selectList(int currentPage, String location, String optionArray) {
		
		int listCount = hotdealDao.getListCount(location);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return hotdealDao.selectList(pi, location, optionArray);
	}
	
	@Override
	public ArrayList<Product> selectListCategory(int currentPage, String location, String category) {
		int listCount = hotdealDao.getListCountC(category);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return hotdealDao.selectListCategory(pi, location, category);
	}

	@Override
	public ArrayList<Product> selectListCategory(int currentPage, String category) {
		int listCount = hotdealDao.getListCountC(category);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return hotdealDao.selectListCategory(pi, category);
	}

	@Override
	public Product selectBoard(int pNo, boolean flag) {
		return hotdealDao.selectBoard(pNo);
	}

	@Override
	public ArrayList<Review> selectReviewList(int pNo) {
		return hotdealDao.seletReviewList(pNo);
	}


	@Override
	public ArrayList<Cart> getMyCart(int cNo) {
		return hotdealDao.getMyCart(cNo);
	}


	@Override
	public int AddCart(Cart c) {
		return hotdealDao.AddCart(c);
	}


	@Override
	public int buyProduct(int cNo) {
		return hotdealDao.buyProduct(cNo);
	}


	@Override
	public int AddWishList(Favorite f) {
		return hotdealDao.AddWishList(f);
	}


	@Override
	public ArrayList<Favorite> getMyWishList(int cNo) {
		return hotdealDao.getMyWishList(cNo);
	}


	@Override
	public int AddReview(Review r) {
		return hotdealDao.AddReview(r);
	}


	@Override
	public int updateBoard(Product p) {
		return hotdealDao.updateBoard(p);
	}


	@Override
	public int deleteWishList(Favorite f) {
		return hotdealDao.deleteWishList(f);
	}


	@Override
	public int deleteCart(Cart c) {
		return hotdealDao.deleteCart(c);
	}

	@Override
	public void insertDeal(Deal d) {
		hotdealDao.insertDeal(d);
	}

	@Override
	public Deal selectDeal(int dNo) {
		return hotdealDao.selectDeal(dNo);
	}

	@Override
	public ArrayList<Product> searchList(String searchStr) {
		return hotdealDao.searchList(searchStr);
	}

	@Override
	public ArrayList<SearchList> selectSearchList() {
		return hotdealDao.selectSearchList();
	}


	

	

	

	



}