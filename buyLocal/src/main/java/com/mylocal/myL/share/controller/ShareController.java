package com.mylocal.myL.share.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mylocal.myL.common.PageInfo;
import com.mylocal.myL.share.exception.ShareBoardException;
import com.mylocal.myL.share.model.vo.Category;
import com.mylocal.myL.share.model.vo.Local;
import com.mylocal.myL.share.model.vo.Pagination;
import com.mylocal.myL.share.model.vo.Reply;
import com.mylocal.myL.share.model.vo.SearchCondition;
import com.mylocal.myL.share.model.vo.ShareBoard;
import com.mylocal.myL.share.service.ShareService;
import com.mylocal.myL.user.model.vo.Customer;
@Controller
public class ShareController {
	@Autowired
	private ShareService shareService;
	
	//나눔게시글 작성
	@RequestMapping("shareInsertForm.do")
	public String shareInser() {
		
		return "share/shareInsert";
	}
	
	//나눔게시글 목록조회
		@RequestMapping("shareboard.do")
		public ModelAndView sharingboard(ModelAndView mv, 
										@RequestParam(value="page", required=false) Integer page,
										HttpServletRequest request, HttpSession session) {
			int currentPage = page!= null ? page : 1;
			
			ArrayList<String> todayCheckList = new ArrayList<>();
			
			
			Cookie[] cookieArray = request.getCookies();
			
			
			if(cookieArray != null) {
				for(int i = 0; i <cookieArray.length; i++) {
					if(cookieArray[i].getName().startsWith("today")) {   
						todayCheckList.add(cookieArray[i].getValue());
					}
				}
			}
			
			 ArrayList<ShareBoard> list = shareService.selectList(currentPage);
			  if(list != null) {
			         mv.addObject("list", list);
			         mv.addObject("pi", Pagination.getPageInfo());
			         mv.addObject("todayCheckList",todayCheckList);
			         mv.setViewName("share/shareboard");
			         
			      }else {
			         throw new ShareBoardException("나눔게시글 전체 조회 실패!");
			      }
			return mv;
		}
	
	@RequestMapping("shareInsert.do") 
	public String shareInsert(ShareBoard sb ,HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value="uploadFile", required=false) MultipartFile file,
			HttpSession session) {
		
	      if(!file.getOriginalFilename().equals("")) {
		         String renameFileName = saveFile(file, request);
		         
		         if(renameFileName != null) {
		            sb.setOriginalFileName(file.getOriginalFilename()); // 사용자가 올린 파일명
		            sb.setRenameFileName(renameFileName); // 새롭게 바뀐 파일명
		            
		            
		         }
		      }
	      sb.setSbContent(sb.getSbContent().replace("\n", "<br>"));
		
		
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		sb.setcNo(loginUser.getcNo());
		
		String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
		sb.setlName(location);
		
		int currentPage = page != null ? page : 1;
		ArrayList<ShareBoard> list = new ArrayList<>();
		list = shareService.selectListAddress(currentPage, location);
		System.out.println("들어가는 sb값" +sb);
		Local lc = new Local();
		lc.setlCode(sb.getlCode());
		
		ArrayList<Local> Llist = shareService.localSelectList(lc);
		 System.out.println("Llist값은"+Llist);
		
	      int result = shareService.insertBoard(sb);
	      
	      if(result > 0 ) { 
	    	  System.out.println("게시글등록성공");
	      }else {
	    	  throw new ShareBoardException("나눔게시글 등록 실패!");
	      }
	      
		return "redirect:shareboard.do";
	}
	
	//파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\shareuploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// rename 과정을 거쳐서 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.util.Date()) + "." 
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
			try {
				file.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
				e.printStackTrace();
			}
		
		
		return renameFileName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 나눔게시글 상세보기
		@RequestMapping("sbdetail.do")
		public ModelAndView shareDatil(ModelAndView mv, ShareBoard sbno,
										@RequestParam(value = "page", required =false) Integer page,
										 HttpServletRequest request, HttpServletResponse response,HttpSession session) {
			
			int currentPage = page != null ? page : 1;
			
			ShareBoard shareboard = null;
			
			boolean flag = false;
			
			
			
			
			//조회수확인용 쿠키저장
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					if(c.getName().equals("sbNo" + sbno)) {
						flag = true; // 해당 게시글에 대한 쿠키 존재(이미 읽은 게시판)
					}
				}
			}
			
			if(flag) {
				Cookie c = new Cookie("sbno" + sbno, String.valueOf(sbno));
				c.setComment("회원번호");
				c.setMaxAge(1 * 24 * 60 * 60);
				response.addCookie(c);
			}
			
			
			shareboard = shareService.detailBoard(sbno, flag);
			
			
			//최근본게시글 쿠키저장
			String cookievalue = Integer.toString(shareboard.getSbNo());
			String cookietitle = shareboard.getSbTitle();
			cookietitle = cookietitle.replaceAll(" ", "");
			cookietitle = cookietitle.replaceAll(",", "");
			
			Cookie todayCheck = new Cookie("today"+cookievalue, cookietitle);
			todayCheck.setMaxAge(60*60*24);
			
			System.out.println("쿠키키값" +cookievalue);
			System.out.println("쿠키저장 value값"+cookievalue);
			
			 System.out.println("shareboard 값은 가져오니?" + shareboard);
			 
			  if(shareboard != null) {
				  	session.setAttribute("sb", shareboard);
			         mv.addObject("currentPage",currentPage);
			         mv.setViewName("share/shareDetail");
			         session.setAttribute("cookies", cookies);
			         System.out.println("들어온값은? = " + shareboard);
			         response.addCookie(todayCheck);
			      }else {
			         throw new ShareBoardException("게시글 상세조회 실패!!");
			      }
			  return mv;
		}
	
	//모든쿠키삭제 버튼클릭시
	@RequestMapping("reset.do")
	public ModelAndView cookieReset(HttpServletRequest request,
							HttpServletResponse response,HttpSession session,
							@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		
//		Customer loginUser = (Customer)session.getAttribute("loginUser");
//		String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
		
		Cookie[] cookie = request.getCookies();
		
		if(cookie != null)  {
			for(int i=0; i<cookie.length; i++) {
				cookie[i].setMaxAge(0);
				response.addCookie(cookie[i]);
				
			}
			int currentPage = page!= null ? page : 1;
			 ArrayList<ShareBoard> list = shareService.selectList(currentPage);
			 
			  if(list != null) {
			         mv.addObject("list", list);
			         mv.addObject("pi", Pagination.getPageInfo());
			         mv.setViewName("share/shareboard");
			         
			      }
		}
		
		return mv;
	}
	//삭제
	@RequestMapping("shareDelete.do")
	public String shareDelete( HttpSession session) {
		ShareBoard sbNo = (ShareBoard)session.getAttribute("sb");
		int result = shareService.deleteBoard(sbNo);
		if(result > 0 ) {
			
			return "redirect:shareboard.do";	
		}else {
			throw new ShareBoardException("게시글삭제실패");
		}
		
		
	}
	
	//나눔게시글 수정이동
	@RequestMapping("shareUpdateForm.do")
	public String shareUpdateForm(Model model, Integer sbNo, ShareBoard sb,HttpServletResponse response) {
		sb = shareService.selectOne(sbNo);
		sb.setSbContent(sb.getSbContent().replace("<br>","\n" ));
		
		sb.setSbNo(sb.getSbNo());
	
		model.addAttribute("sb" , sb);
		return "share/shareUpdateForm";
	}
	//나눔게시글 수정완료
	@RequestMapping("shareUpdate.do")
	public ModelAndView shareUpdate (HttpServletRequest request, ShareBoard sb,ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			 @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {
		 
			
	      // 새로 업로드 된 파일이 있다면
	      if(reloadFile != null && !reloadFile.isEmpty()) {
	         
	         // 기존 파일이 존재 하는 경우 기존 파일을 삭제해주어야 함
	         if(sb.getOriginalFileName() != null) {
	            // 공지사항 삭제의 경우에도 파일을 지워야 하므로 따로 빼서 작업해둔다!
	            deleteFile(sb.getOriginalFileName(), request);
	         }
	         
	         // 새로 업로드 된 파일은 새로 저장
	         String savePath = saveFile(reloadFile, request);
	         
	         // 잘 저장 되었다면
	         if(savePath != null) {
	            sb.setOriginalFileName(reloadFile.getOriginalFilename());
	            sb.setRenameFileName(savePath);
	            
	         }
	         
	      }
	      
	      System.out.println("리네임되는지"+sb.getRenameFileName());
	      System.out.println("update되기전sb값"+sb);
		int result = shareService.updateBoard(sb); 
		
		int currentPage = page!= null ? page : 1;
		
		ArrayList<ShareBoard> list = shareService.selectList(currentPage);
		if(result >= 0 ) {
		  if(list != null) {
			 mv.addObject("list", list);
			 mv.addObject("pi", Pagination.getPageInfo());
			 mv.setViewName("redirect:shareboard.do");
			}else {
				throw new ShareBoardException("게시글 목록조회 실패");
			}
		}else {
			throw new ShareBoardException("게시글 수정 실패");
		}
		return mv;
	}
	
	   public void deleteFile(String fileName, HttpServletRequest request) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\shareuploadFiles";
		      
		      File deleteFile = new File(savePath + "\\" + fileName);
		      
		      
		      if(deleteFile.exists()) {
		         deleteFile.delete();
		      }
		   }
	   
	@RequestMapping(value="search.do")
	public ModelAndView shareSearch(ModelAndView mv,
							  @RequestParam(name="searchCondition") String condition,
							  @RequestParam(value="searchValue") String value,
							  @RequestParam(value="page", required=false) Integer page) {
		SearchCondition sc = new SearchCondition();
		
		if(condition.equals("writer")) {
			sc.setWriter(value);
		}else if(condition.equals("title")) {
			sc.setTitle(value);
		}else if(condition.equals("content")) {
			sc.setContent(value);
		}else if(condition.equals("all")) {
			sc.setAll(value);
		}
		// 검색 결과에 해당되는 게시물 개수 조회
		int listCount = shareService.getSearchResultListCount(sc);
		
		System.out.println("listCount == ? " + listCount);
		System.out.println("getWriter == ? " + sc.getWriter());
		System.out.println("getContent == ? " + sc.getContent());
		System.out.println("getAll == ? " + sc.getAll());
		int currentPage = page!= null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 검색 결과에 해당하는 게시물 목록들 조회
		ArrayList<ShareBoard> list = shareService.selectSearchResultList(sc, pi);
		System.out.println("list == ? " + list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", condition);
			mv.addObject("searchValue", value);
			mv.setViewName("share/shareboard");
		}
		return mv;
	}
	
	@RequestMapping("categorySearch.do")
	public ModelAndView categorySearch(ModelAndView mv,
						@RequestParam(name="Category") String Category,
						@RequestParam(value="page", required=false)Integer page) {
		Category cg = new Category();
		if(Category.equals("sell")) {
			cg.setSell("팝니다");
		}else if(Category.equals("buy")) {
			cg.setBuy("삽니다");
		}else if(Category.equals("share")) {
			cg.setShare("나눕니다");
		}else if(Category.equals("information")) {
			cg.setInformation("정보공유");
		}else if(Category.equals("etc")) {
			cg.setEtc("기타");
		}if(Category.equals("sell") || Category.equals("buy") || Category.equals("share") || Category.equals("information") 
				|| Category.equals("etc")) {
			cg.setAllresult("전체");
		}
		
		int listCount = shareService.getCGSearchResultListCount(cg);
		
		System.out.println("팝니다"+cg.getSell());
		System.out.println("삽니다"+ cg.getBuy());
		System.out.println("나눕니다"+ cg.getShare());
		System.out.println("정보공유"+cg.getInformation());
		System.out.println("기타"+cg.getEtc());
		System.out.println("전체"+cg.getAllresult());
		
		System.out.println("listCount잘가져오니" + listCount);
		int currentPage = page!= null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("pi는가져오나" + pi);
		// 검색 결과에 해당하는 게시물 목록들 조회
		ArrayList<ShareBoard> list = shareService.selectCGSearchResultList(cg, pi);
		System.out.println("categorylist == ? " + list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("Category", Category);
			mv.setViewName("share/shareboard");
		
	}
		return mv;
  }	
	
	@RequestMapping("addReply.do")
	@ResponseBody
	public 	String addReply(HttpSession session,
					@ModelAttribute Reply r) {
		
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		r.setcNo(loginUser.getcNo());
		r.setRefRno(r.getrNo());
		
		System.out.println("rNo값은 == " + r.getrNo());
		
		System.out.println("회원번호는 == " + r.getcNo() + "입니다");
		
		System.out.println("나의 아이디는 == " + loginUser.getcId());
		
		int result = shareService.insertReply(r);
		
		System.out.println("result 1 맞는지 == " + result);
		System.out.println("r이 값이 뭔지알면댐 == " + r);
		
		if(result > 0 ) {
			return "success";
		}else {
			throw new ShareBoardException("댓글 등록 실패!");
		}
	}
	
	
	@RequestMapping(value="rList.do", produces="applica52tion/json; charset=utf-8")
	@ResponseBody
	public String getReplyList(int sbNo, HttpServletResponse response
			,@ModelAttribute Reply r, Model model) {
		
		ArrayList<Reply> rList = shareService.selectReplyList(sbNo);
		
		System.out.println("rList == " + rList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy'/'MM'/'dd' 'HH'시'mm'분'ss'초'").create();
		
		return gson.toJson(rList);
	}
	
	@RequestMapping(value="rUpdate.do")
	public String replyUpdate(Reply r) {
		System.out.println(r);
		
		int result = shareService.updateReply(r);
		System.out.println("result값"+result);
		
		return "success";
	}
	
	@RequestMapping("rDelete.do")
	@ResponseBody
	public String replyDelete(Reply r, int rNo) {
		System.out.println("r의 시작값"+r);
		
		r.setrNo(r.getrNo());
		r = shareService.selectReply(rNo); 
		
		System.out.println("r값"+r);
		System.out.println(rNo);
		
		int result = shareService.deleteReply(r);
		System.out.println("r값은?"+r);
		System.out.println("result1인지?"+result);
		

		if(result > 0 ) {
			return "success";
		}else {
			throw new ShareBoardException("댓글 삭제 실패!");
		}
		
	}
	
	
}
