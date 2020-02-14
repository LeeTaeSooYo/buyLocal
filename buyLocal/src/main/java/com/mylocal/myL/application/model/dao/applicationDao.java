package com.mylocal.myL.application.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.application.model.vo.Product;

@Repository("appDao")
public class applicationDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertProduct(Product p) {
		
		// System.out.println("dao지나가는중~");
		System.out.println("p : " + p);
		return sqlSession.insert("productMapper.insertProduct", p);
	}
 
	
}
