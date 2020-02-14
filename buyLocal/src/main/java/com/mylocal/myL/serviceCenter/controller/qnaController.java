package com.mylocal.myL.serviceCenter.controller;


import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mylocal.myL.application.model.dao.applicationDao;
import com.mylocal.myL.application.model.exception.applicationException;
import com.mylocal.myL.application.model.service.applicationService;
import com.mylocal.myL.application.model.vo.Product;
import com.mylocal.myL.serviceCenter.model.exception.qnaException;
import com.mylocal.myL.serviceCenter.model.service.qnaService;
import com.mylocal.myL.serviceCenter.model.vo.QNA;



/**
 * Handles requests for the application home page.
 */
@Controller
public class qnaController {
	@Autowired
	private qnaService qnaService;  
	
	private Logger logger = LoggerFactory.getLogger(qnaController.class);
	
	// QNA 페이지 연결
	@RequestMapping("QNAform.do")
	public String QNAform() {
		return "serviceCenter/QNAform";
	}
	
	// QNA 폼 제출
	@RequestMapping("insertQNA.do")
	public String insertQNA (QNA q, Model model, HttpServletRequest request) {
		
		int result = qnaService.insertQNA(q);
		// System.out.println("QNA result = " + result);
		
		if(result > 0) {
			// model.addAttribute("msg", "성공적으로 제출되었습니다."); 
			return "redirect:QNAform.do";
		} else {
			throw new qnaException("QNA 제출 실패했습니다.");
		}
	}
	
	// FAQ 페이지 연결 
	@RequestMapping("FAQ.do")
	public String FAQ() {
		return "serviceCenter/FAQ";
	}
	
	
	
}
