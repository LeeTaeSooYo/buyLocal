package com.mylocal.myL.serviceCenter.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylocal.myL.serviceCenter.model.vo.QNA;
import com.mylocal.myL.serviceCenter.model.dao.*;

@Service("qnaService")
public class qnaServiceImpl implements qnaService{
	@Autowired
	qnaDao qnaDao;

	@Override
	public int insertQNA(QNA q) {
		return qnaDao.insertQNA(q);
	}

  
	
}
