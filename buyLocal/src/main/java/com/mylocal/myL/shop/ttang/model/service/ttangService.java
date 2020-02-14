package com.mylocal.myL.shop.ttang.model.service;

import java.util.ArrayList;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.shop.ttang.model.vo.Product;

public interface ttangService {
	
	ArrayList<Product> selectList (int currentPage);
	
	Product selectBoard(int pNo, boolean flag);

	int AddCart(Cart c);

	ArrayList<Cart> getMyCart(int cNo);

	ArrayList<Favorite> getMyWishList(int cNo);

	int AddWishList(Favorite f);

	void insertDeal(Deal d);

	int buyProduct(int cNo);

	int deleteWishList(Favorite f);

	int deleteCart(Cart c);

	ArrayList<Product> selectList(int currentPage, String location);

	ArrayList<Product> selectListCategory(int currentPage, String location, String category);

	ArrayList<Product> selectList(int currentPage, String location, String optionArray);

	ArrayList<Product> selectListCategory(int currentPage, String category);

	ArrayList<com.mylocal.myL.shop.hotDeal.model.vo.Product> searchList(String searchStr);



}
