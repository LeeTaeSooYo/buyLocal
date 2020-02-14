package com.mylocal.myL.serviceCenter.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.application.model.vo.Advertisement;
import com.mylocal.myL.application.model.vo.Product;
import com.mylocal.myL.serviceCenter.model.vo.QNA;

@Repository("qnaDao")
public class qnaDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertQNA(QNA q) {
		return sqlSession.insert("qnaMapper.insertQNA", q);
	}

	
	
}
  