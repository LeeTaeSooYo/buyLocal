package com.mylocal.myL.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mylocal.myL.admin.model.exception.AdminException;
import com.mylocal.myL.admin.model.service.AdminService;
import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Pagination;

@Controller
public class AdminController {
	@Autowired
	AdminService adService;

	// 공지사항 리스트
	@RequestMapping("noticeList.do")
	public ModelAndView NoticeList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = page != null ? page : 1;

		ArrayList<Notice> list = adService.NoticeSelectList(currentPage);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", Pagination.getPageInfo());
			mv.setViewName("buylocal/noticeMain");

		} else {
			throw new AdminException("공지사항 전체 조회 실패!");
		}

		return mv;
	}

	// 공지사항 입력폼으로 이동
	@RequestMapping("noticeInsertView.do")
	public String noticeInsertView() {
		return "buylocal/noticeInsert";
	}

	// 공지사항 리스트 들고 이동
	/*
	 * @RequestMapping("admin.do") public ModelAndView ContentMenu(ModelAndView mv)
	 * { ArrayList<Notice> list = adService.NoticeSelectList();
	 * 
	 * 
	 * mv.setViewName("admin/main");
	 * 
	 * 
	 * return mv; }
	 */

	// 접속자수 들고 오기 (예정)
	
	
	
	
	

	// 공지사항 작성
	@RequestMapping("noticeInsert.do")
	public String NoticeInsert(Notice n) {

		n.setnContent(n.getnContent().replace("\n", "<br>"));

		int result = adService.NoticeInsert(n);

		if (result > 0) {
			return "redirect:noticeList.do";
		} else {
			throw new AdminException("공지사항 등록하기 실패!");

		}
	}

	// 공지사항 상세보기
	@RequestMapping("noticeDetail.do")
	public ModelAndView NoticeDetail(ModelAndView mv, int nNo, @RequestParam(value = "page", required=false) Integer page,
			HttpServletRequest request, HttpServletResponse response) {

		int currentPage = page != null ? page : 1;

		Notice notice = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("nNo" + nNo)) {
					flag = true; // 해당 게시글에 대한 쿠키 존재(이미 읽은 게시물)
				}
			}

			if (!flag) {
				// 처음 읽는 게시물 일 때
				Cookie c = new Cookie("nNo" + nNo, String.valueOf(nNo));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 쿠키 저장
				response.addCookie(c);
			}

			notice = adService.selectNotice(nNo, flag);

		}

		if (notice != null) {
			mv.addObject("notice", notice).addObject("currentPage", currentPage).setViewName("buylocal/noticeDetail");

		} else {
			throw new AdminException("공지사항 상세보기 실패!");
		}
		return mv;

	}

	// 수정하기 페이지로 이동
	@RequestMapping("noticeUpdateView.do")
	public ModelAndView NoticeUpdateView(ModelAndView mv, int nNo, @RequestParam("page") Integer page) {

		Notice notice = adService.selectNotice(nNo, true);

		notice.setnContent(notice.getnContent().replace("<br>", "\n"));

		mv.addObject("notice", notice).addObject("currentPage", page).setViewName("buylocal/noticeUpdate");

		return mv;

	}

	// 공지사항 수정하기
	@RequestMapping("noticeUpdate.do")
	public ModelAndView NoticeUpdate(ModelAndView mv, Notice n, HttpServletRequest request,
			@RequestParam("page") Integer page) {



		n.setnContent(n.getnContent().replace("\n", "<br>"));


		int result = adService.NoticeUpdate(n);

		if (result > 0) {

			mv.addObject("page", page).addObject("nNo", n.getnNo()).setViewName("redirect:noticeDetail.do");
		} else {
			throw new AdminException("ins공지사항 수정 실패!!");
		}

		return mv;
	}

	// 삭제 업데이트 하는식으로 하자
	@RequestMapping("noticeDelete.do")
	public String NoticeDelete(int nNo) {
		

		int result = adService.NoticeDelete(nNo);
		
		if(result > 0) {

		return "redirect:noticeList.do";
		}else {
			throw new AdminException("공지사항 삭제 실패");
		}
		
	}

	// 관리자 모드 차트 보기
	   @RequestMapping("adminChart.do")
	   public String ChartMenu(Model model) {
	      ArrayList<Deal> d = adService.selectDeal();
	      
	      String a = null;
	      HashMap<String, Integer> d2 = adService.selectDealAll(a);

	      
	      int month[] = {0,0,0,0,0,0,0,0,0,0,0,0};
	      
	      int max = 0;
	      for(int i = 0; i < d.size(); i++) {
	    	 switch(d.get(i).getdDate().getMonth()+1) {
	         case 1:
	            month[0]+=d.get(i).getdPrice();
	            break;
	         case 2:
	            month[1]+=d.get(i).getdPrice();
	            break;
	         case 3:
	            month[2]+=d.get(i).getdPrice();
	            break;
	         case 4:
	            month[3]+=d.get(i).getdPrice();
	            break;
	         case 5:
	            month[4]+=d.get(i).getdPrice();
	            break;
	         case 6:
	            month[5]+=d.get(i).getdPrice();
	            break;
	         case 7:
	            month[6]+=d.get(i).getdPrice();
	            break;
	         case 8:
	            month[7]+=d.get(i).getdPrice();
	            break;
	         case 9:
	            month[8]+=d.get(i).getdPrice();
	            break;
	         case 10:
	            month[9]+=d.get(i).getdPrice();
	            break;
	         case 11:
	            month[10]+=d.get(i).getdPrice();
	            break;
	         case 12:
	            month[11]+=d.get(i).getdPrice();
	            break;
	         }
	      }
	      for(int i = 0; i<12; i++) {
	    	  if(max <= month[i]) {
	    		  max = month[i];
	    	  }
	    	  
	    	  
	      }
	      
	      
	      // 하나 추가 거래량
		   

		   LinkedHashMap<String, Integer> d3 = adService.selectDeal3(a);
		   

		   
	      model.addAttribute("month", month);
	      model.addAttribute("categorys", d2);
	      model.addAttribute("countMonth", d3);
	      model.addAttribute("max", max);
	      
	      return "admin/chart";
	   }
	   
	   @RequestMapping("adminChartSeller.do")
	   public String adminChartSeller(Model model, int cNo) { 
		   ArrayList<Deal> d = adService.selectDeal(cNo);
		   
		   
		   HashMap<String, Integer> d3 = adService.selectDealCategory(cNo);

		   int month[] = {0,0,0,0,0,0,0,0,0,0,0,0};
		   
		   int max = 0;
		   for(int i = 0; i < d.size(); i++) {
		   switch(d.get(i).getdDate().getMonth()+1) {
	         case 1:
	            month[0]+=d.get(i).getdPrice();
	            break;
	         case 2:
	            month[1]+=d.get(i).getdPrice();
	            break;
	         case 3:
	            month[2]+=d.get(i).getdPrice();
	            break;
	         case 4:
	            month[3]+=d.get(i).getdPrice();
	            break;
	         case 5:
	            month[4]+=d.get(i).getdPrice();
	            break;
	         case 6:
	            month[5]+=d.get(i).getdPrice();
	            break;
	         case 7:
	            month[6]+=d.get(i).getdPrice();
	            break;
	         case 8:
	            month[7]+=d.get(i).getdPrice();
	            break;
	         case 9:
	            month[8]+=d.get(i).getdPrice();
	            break;
	         case 10:
	            month[9]+=d.get(i).getdPrice();
	            break;
	         case 11:
	            month[10]+=d.get(i).getdPrice();
	            break;
	         case 12:
	            month[11]+=d.get(i).getdPrice();
	            break;
	         }
		      }
		   
		   for(int i = 0; i<12; i++) {
		    	  if(max <= month[i]) {
		    		  max = month[i];
		    	  }
		   }
		   
		   
		   
		   // 하나 추가 거래량
		   LinkedHashMap<String, Integer> d2 = adService.selectDeal2(cNo);
		   
		   String bShopName = "";
		   
		   
		   if(d.size() != 0) {
			   bShopName = d.get(0).getbShopName();
			   model.addAttribute("bShopName", bShopName);
			   
		   }else {
			  model.addAttribute("bShopName" , bShopName);
		   }
		   

		   
		   model.addAttribute("month", month);
		   model.addAttribute("category", d3);
		   model.addAttribute("max", max);
		   model.addAttribute("monthCount", d2);
	
		   
		   return "admin/chartForSeller";
	   }

}
