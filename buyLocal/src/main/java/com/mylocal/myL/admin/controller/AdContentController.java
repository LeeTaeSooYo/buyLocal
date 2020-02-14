package com.mylocal.myL.admin.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mylocal.myL.admin.model.exception.AdContentException;
import com.mylocal.myL.admin.model.exception.AdUserException;
import com.mylocal.myL.admin.model.service.AdContentService;
import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.admin.model.vo.Product;
import com.mylocal.myL.admin.model.vo.QnA;
import com.mylocal.myL.admin.model.vo.Report;
import com.mylocal.myL.admin.model.vo.ShareBoard;

@Controller
public class AdContentController {
	@Autowired
	AdContentService adContentService;
	

	

	@Autowired // 메일 전송을 위한
	private JavaMailSender mailSender;

	// QnA 신고 목록 불러오기
	// @SuppressWarnings("deprecation")
	
	@RequestMapping("Count.do")
	public ModelAndView qnaCount(ModelAndView mv, HttpServletRequest request) {

		HttpSession session = request.getSession();

		int count = adContentService.CountQna();
		
		int count1 = adContentService.CountReport();
		
		// 통계 가져오기


		 String a= null;
		 LinkedHashMap<String, Integer> d2 = adContentService.selectDeal(a);
		 
		 System.out.println("궁금한 : " + d2);
		 

		 
		 
		
		// 공지사항 리스트 불러오기
		ArrayList<Notice> list = adContentService.NoticeSelectList();

		// Count 세션 Name Qna갯수
		int Number = count;
		
		// Count 세션 Name report 갯수
		int Number1 = count1;

		session.setAttribute("QnACount", Number);
		
		session.setAttribute("reportCount", Number1);

		mv = new ModelAndView();

		mv.addObject("count", count);
		mv.addObject("reportCount", Number1);
		mv.addObject("list", list);
		mv.addObject("todayCount", d2);

		mv.setViewName("admin/main");
		return mv;
	}
	
	
	
	
	
	
	// QnA 답변안한 갯수 불러오기
	@RequestMapping("refreshQnaCount.do")
	public String refreshQnaCount(RedirectAttributes redirect, ModelAndView mv, HttpServletRequest request) {

		HttpSession session = request.getSession();

		int count = adContentService.CountQna();
	
		int count1 = adContentService.CountReport();

		// Count 세션 Name
		int Number = count;
		
		int Number1 = count1;

		session.setAttribute("QnACount", Number);
		
		session.setAttribute("reportCount", Number1);

		mv = new ModelAndView();

		mv.addObject("count", count);
		mv.addObject("reportCount", Number1);

		mv.setViewName("admin/qna");
		
		return "redirect:qna.do";
	}

	// QnA 답변하기 페이지로 이동
	@RequestMapping("awnser.do")
	public ModelAndView anser(ModelAndView mv, int qNo) {

		QnA qna = adContentService.selctQna(qNo);
		
		System.out.println("리스트 :" + qna);

		qna.setqContent(qna.getqContent().replace("<br>", "\n"));

		mv.addObject("qna", qna).setViewName("admin/awnser");

		return mv;
	}

	// 게시판 관리 (content, qna, black 목록 보여주는곳 수정완료)
	@RequestMapping("boardList.do")
	public String BoardListMenu() {
		return "admin/boardList";
	}

	// 게시글 관리 메뉴 리스트
	@RequestMapping("content.do")
	public ModelAndView ContentMenu(ModelAndView mv) {
		ArrayList<Product> list1 = adContentService.HotDealSelectList(); // 핫딜
		ArrayList<Product> list2 = adContentService.TtangSelectList(); // 땡처리
		ArrayList<ShareBoard> list3 = adContentService.ShareBoardSelectList(); //
		// 나눔게시판

		if (list1 != null || list2 != null  || list3 !=null ) {
			mv.addObject("list1", list1); // 핫딜
			mv.addObject("list2", list2); // 땡처리
			mv.addObject("list3", list3); // 나눔 게시판
			mv.setViewName("admin/content");

		} else {
			throw new AdContentException("전체 게시글 조회 실패!");
		}

		return mv;
	}

	// QNA 관리 메뉴 리스트
	@RequestMapping("qna.do")
	public ModelAndView QnaMenu(ModelAndView mv, HttpServletRequest request) {
		//미답변 목록
		ArrayList<QnA> list = adContentService.QnASelectList();
		
		// 답변 목록
		ArrayList<QnA> list2 = adContentService.QnASelectList2();
		
		
		HttpSession session = request.getSession();

		int count = adContentService.CountQna();
		
		int Number = count;
		
		session.setAttribute("QnACount", Number);
		
		

		if (list != null || list2 != null) {
			mv.addObject("list", list);
			mv.addObject("list2", list2);
			mv.addObject("count", count);
			mv.setViewName("admin/qna");

		} else {
			throw new AdContentException("QNA 조회 실패!");
		}

		return mv;
	}

	// QnA 디테일폼
	@RequestMapping("qnaDetail.do")
	public ModelAndView qnaDetail(ModelAndView mv, int qNo, String cEmail) {

		QnA qna = null;

		qna = adContentService.selctQna(qNo);
		

		if (qna != null) {
			qna.setqContent(qna.getqContent().replace("<br>", "\n"));
			System.out.println(qna.getqContent().replace("<br>","\n"));
			mv.addObject("qna", qna);
			mv.setViewName("admin/qnaDetailForm");

		} else {
			throw new AdUserException("Qna 상세보기 실패");
		}

		return mv;

	}

	// 신고리스트 메뉴(report 테이블 사용) 리스트
	@RequestMapping("report.do")
	public ModelAndView BlackMenu(ModelAndView mv,  HttpServletRequest request) {
		ArrayList<Report> list = adContentService.ReportSelectList();
		
		
		// 신고 처리 목록
		ArrayList<Report> list2 = adContentService.ReportSelectList2();
		
		
		HttpSession session = request.getSession();
		
		
		int count1 = adContentService.CountReport();
		
		int Number1 = count1;
		
		session.setAttribute("reportCount", Number1);

		mv.addObject("reportCount", Number1);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("list2", list2);
			mv.setViewName("admin/report");
		}else {
			throw new AdUserException("신고하기 조회 실패");
		}


		return mv;
	}

	// 신고리스트 상세보기
	@RequestMapping("reportDetail.do")
	public String reportDetail(RedirectAttributes redirectAttributes, ModelAndView mv, int rtNo ) {
		
		Report r = null;
		
		r = adContentService.selectReport(rtNo);

		System.out.println("잘나옴?" + r);
		
		System.out.println("rt값은?" + r.getRtDivide());
		
		if(r.getRtDivide().equals("1") && r.getpBoard().equals("핫딜")){
			redirectAttributes.addAttribute("pNo", r.getRtNum());
			return "redirect:hotDealDetail.do";
			
		}else if(r.getRtDivide().equals("1") && r.getpBoard().equals("땡처리")) {
			redirectAttributes.addAttribute("pNo", r.getRtNum());
			return "redirect:ttangDetail.do";
		}else if(r.getRtDivide().equals("2")) {
			redirectAttributes.addAttribute("sbNo", r.getRtNum());
			return "redirect:sbdetail.do";
		}else {
			return null;
		}
		


	}
	
	// 신고처리하기
	
	
	// 각 메뉴별로 디테일뷰 만들어주기(팝업창으로 띄우자)
	// QNA / 신고 / 게시판별 상세보기

	// 신고리스트는 업데이트 하는걸로 (유저 status='N'로 사업자 일반유저 둘다 해야할듯)

	// 신고하기 작성 뷰는 각 디테일뷰(핫딜, 나눔, 땡처리)에서 건드려줄것

	/*
	 * // 제3자가 신고하기 작성 신고하기는 변수명이 달라서 여러개를 가져와야함
	 * 
	 * @RequestMapping("reportInsert.do") public String NoticeInsert(Notice n) {
	 * 
	 * int result = adContentService.NoticeInsert(n);
	 * 
	 * return "";
	 * 
	 * }
	 */
	

	
	// 핫딜 게시판 신고
	@RequestMapping("insertReport.do")
	public String report(HttpServletRequest request, Report r) {
		
	
		
		r.setRtContent(r.getRtContent().replace("\n", "<br>"));
		
		int result = adContentService.ReportInsert(r);
		
		if(result > 0) {
			return "redirect:hotDealMenu.do";
		} 
		
		else {
			throw new AdUserException("신고하기 실패");
		}
		
		
	}
	
	// 땡처리 게시판 신고 
	@RequestMapping("insertReport1.do")
	public String report1(HttpServletRequest request, Report r) {
		
		
		r.setRtContent(r.getRtContent().replace("\n", "<br>"));
		
		int result = adContentService.ReportInsert(r);
		
		if(result > 0) {
			return "redirect:ttangMain.do";
		} 
		
		else {
			throw new AdUserException("신고하기 실패");
		}
		
		
	}
	
	// 게시판 신고
	@RequestMapping("insertReport2.do")
	public String report2(HttpServletRequest request, Report r) {
		
		
		
		r.setRtContent(r.getRtContent().replace("\n", "<br>"));
		
		int result = adContentService.ReportInsert1(r);
		
		if(result > 0) {
			return "redirect:shareboard.do";
		} 
		
		else {
			throw new AdUserException("신고하기 실패");
		}
		
		
	}
	

/*	// 신고하기 상세보기 (이안에서 업데이트할거임) 공통값을 꺼내와야함 각자 온 게시판이 다름
	@RequestMapping("roportView.do")
	public ModelAndView ReportView(ModelAndView mv, int rt_no, int h_no, int t_no, int option) {

		// 조건 3개 달아줘야할듯 핫딜일때 나눔일때 땡처리일때

		HotDeal hotdeal = adContentService.SelectHotDeal(h_no);

		Ttang ttang = adContentService.SelectTtang(t_no);

		// ShareBoard shareboard = adContentService.SelectShareboard(rt_no);

		// hotdeal, ttang, shareboard 조건 달아서 updateForm으로 이동

		// 일단 hotDeal을 예씨로 나머지도 넣어야함
		mv.addObject("hotdeal", hotdeal).setViewName("board/boardUpdateForm");

		return mv;
	}*/

	// 신고하기 업데이트(허위신고였으므로 목록에서만 삭제)
	@RequestMapping("reportCancel.do")
	public String reportCancel(ModelAndView mv, int rtNo) {

		
		int result = adContentService.deleteReport(rtNo);
		
		
		if(result > 0) {
			return "redirect:report.do";
		}else {
			throw new AdUserException("허위 신고 처리 실패"); 
		}
		

	}
	
	
	// 회원 정지 시키면서 신고목록 N 으로 바꿔주기
	@RequestMapping("reportUpdate.do")
	public String reportUpdate(ModelAndView mv, int rtNo) {
		Report r = adContentService.selectReport(rtNo);
		
		Product p = adContentService.SelectProduct(r.getRtNum());
		
		
		// 신고목록 N으로
		int result = adContentService.deleteReport(rtNo);
		
		// 회원 정지
		int result1 = adContentService.updateCustomer(p.getcNo());
		
		// 사업자 정지
		int result2 = adContentService.updateBusinessInfo(p.getcNo());
		
		int result3 = adContentService.updateProduct(p.getcNo());
		
		if(result > 0 || result1 > 0 || result2 >0 || result3 > 0) {
			return "redirect:report.do";
			
		}else {
			throw new AdUserException("신고처리 실패"); 
		}
		
		
		
	}
	
	// 회원 정지만 해제
	@RequestMapping("reportUpdate2.do")
	public String reportUpdate2(ModelAndView mv, int rtNo) {
		
		Report r = adContentService.selectReport(rtNo);
		
		Product p = adContentService.SelectProduct(r.getRtNum());
		
		
		int result = adContentService.updateCustomer2(p.getcNo());
		

		
		if(result >  0) {
			return "redirect:report.do";
			
		}else {
			throw new AdUserException("신고처리 실패"); 
		}
		
		
		
	}

	// 메일 전송 (답변 날짜)
	@RequestMapping("mailSending.do")
	public String mailSending(RedirectAttributes redirect, HttpServletRequest request, int qNo) {



		int result = adContentService.updateQna(qNo);

		String setfrom = "xotn4400@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일

		
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		
	

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			// messageHelper.setText(content); // 메일 내용
			
			
			
			messageHelper.setText("<html><body> "+content+" <br><br> "
					+ "<a href='http://192.168.10.35:8800/myL'><img src='https://postfiles.pstatic.net/MjAyMDAyMDRfMTc1/MDAxNTgwNzk1Nzk5NTU3.ilwY0Q1Ib2EAJ9_dwZE5DnQ-8RYzvErH9oDM6kmBwhAg.Hwg63mxdjqBKpxQ2f33TDqJ6SlVJQR-jRQs2NBjOIgQg.PNG.hedystarr/slider-01-img-01.png?type=w580'></a></body></html>", true);

			
/*
			FileSystemResource res = new FileSystemResource(new File("c:/Sample.jpg"));
			helper.addInline("identifier1234", res);*/
			
			
			mailSender.send(message);
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:qnaCount.do";
	}

}
