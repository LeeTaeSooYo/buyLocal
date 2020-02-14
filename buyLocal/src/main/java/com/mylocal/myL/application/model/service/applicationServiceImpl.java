package com.mylocal.myL.application.model.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mylocal.myL.application.model.dao.applicationDao;
import com.mylocal.myL.application.model.vo.Advertisement;
import com.mylocal.myL.application.model.vo.Product;

@Service("applicationService")
public class applicationServiceImpl implements applicationService{
	@Autowired
	applicationDao appDao;

	
	// 상품 등록
	@Override
	public int insertProduct(Product p) {
		// System.out.println("serviceImpl 지나가는 중!");
		System.out.println("p : " + p);
		return appDao.insertProduct(p);
	} 

	/*// 광고/이벤트 등록
	@Override
	public int insertAdvertisement(Advertisement a) {
		return appDao.insertAdvertisement(a);
	}*/
	
	
}
