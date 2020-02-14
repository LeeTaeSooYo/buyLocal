package com.mylocal.myL.shop.hotDeal.model.service;

import java.util.ArrayList;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.common.SearchList;
import com.mylocal.myL.shop.hotDeal.model.vo.Product;
import com.mylocal.myL.shop.hotDeal.model.vo.Review;

public interface hotDealService {

	ArrayList<Product> selectList(int currentPage);

	ArrayList<Product> selectList(int currentPage, String location);
	
	ArrayList<Product> selectList(int currentPage, String location, String optionArray);
	
	ArrayList<Product> selectListCategory(int currentPage, String location, String category);
	
	ArrayList<Product> selectListCategory(int currentPage, String category);
	
	Product selectBoard(int pNo, boolean flag);

	ArrayList<Review> selectReviewList(int pNo);

	ArrayList<Cart> getMyCart(int cNo);

	int AddCart(Cart c);

	int buyProduct(int cNo);

	int AddWishList(Favorite f);

	ArrayList<Favorite> getMyWishList(int cNo);

	int AddReview(Review r);

	int updateBoard(Product p);

	int deleteWishList(Favorite f);

	int deleteCart(Cart c);

	void insertDeal(Deal d);

	Deal selectDeal(int dNo);

	ArrayList<Product> searchList(String searchStr);

	ArrayList<SearchList> selectSearchList();



	

	
}
