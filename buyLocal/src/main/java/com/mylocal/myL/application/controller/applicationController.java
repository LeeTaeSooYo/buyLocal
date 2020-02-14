package com.mylocal.myL.application.controller;


import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mylocal.myL.application.model.dao.applicationDao;
import com.mylocal.myL.application.model.exception.applicationException;
import com.mylocal.myL.application.model.service.applicationService;
import com.mylocal.myL.application.model.vo.Product;



/**
 * Handles requests for the application home page.
 */
@Controller
public class applicationController {
	@Autowired
	private applicationService appService;
	
	private Logger logger = LoggerFactory.getLogger(applicationController.class);
	
	 
	// 이벤트&광고 페이지 연결
	@RequestMapping("advertisementForm.do")
	public String advertisement() {
		return "application/advertisementForm";
	}
	
	
	// 상품 등록 페이지 연결
	@RequestMapping("insertProductType.do")
	public String insertProductForm() {
		return "application/insertProductType";
	}
	
	// 상품 등록 페이지 연결
	@RequestMapping("insertHotDeal.do")
	public String insertHotDeal() {
		return "application/insertHotDeal";
	}
	
	// 상품 등록 페이지 연결
	@RequestMapping("insertTtang.do")
	public String insertTtang() {
		return "application/insertTtang";
	}
	
	
	
	// 상품등록 폼 제출하기
	@RequestMapping("insertProduct.do")
	public String insertProduct(Product p, HttpServletRequest request, 
								@RequestParam(value="uploadFile", required=false) MultipartFile file,
								@RequestParam(value="uploadFileP", required=false) MultipartFile file2) {
		
		// 썸네일 (NullPointerException)
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				p.setpOriginalT(file.getOriginalFilename());
				p.setpThumb(renameFileName);
			}
		}
		
		// 상품정보
		if(!file2.getOriginalFilename().equals("")) {
			String pInfoImage = saveFile2(file2, request);
						
			if(pInfoImage != null) {
				p.setpOriginalInfoI(file2.getOriginalFilename());
				p.setpInfoImage(pInfoImage);
			}
		}
		
		int result = appService.insertProduct(p);
		
		if(result > 0) {
			if(logger.isDebugEnabled()) {
				logger.debug(p.getpName() + " 상품 등록 완료");
			}
			return "common/main";
		} else {
			throw new applicationException("상품 등록 실패! 다시 시도 해 주세요.");
		}
	}
	
	

	// 썸네일 - SaveFile
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\pThumb";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.util.Date()) + "."
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} 
		return renameFileName;
	}
	
	// 상품정보 - SaveFile
	public String saveFile2 (MultipartFile file2, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\productInfo";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file2.getOriginalFilename();
		String renameFileName = sdf.format( new java.util.Date()) + "."
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		
		try {
			file2.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} 
		return renameFileName;
	}
	
}
