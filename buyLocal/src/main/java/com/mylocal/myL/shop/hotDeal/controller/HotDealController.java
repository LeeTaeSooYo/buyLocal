package com.mylocal.myL.shop.hotDeal.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.common.Pagination;
import com.mylocal.myL.shop.hotDeal.model.service.hotDealService;
import com.mylocal.myL.shop.hotDeal.model.vo.Product;
import com.mylocal.myL.shop.hotDeal.model.vo.Review;
import com.mylocal.myL.user.model.vo.Customer;


@Controller
public class HotDealController {
	@Autowired
	private hotDealService hotdealService;

	@RequestMapping("hotDealMenu.do")
	public String hotDealMenu(HttpSession session, Model model, @RequestParam(value = "page", required = false) Integer page, 
			@RequestParam(value = "msg", required = false) String msg, @RequestParam(value = "optionArray", required = false) String optionArray,
			@RequestParam(value = "category", required = false) String category) {		
		
		
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		if(loginUser != null) {
			int currentPage = page != null ? page : 1;
			
			if(optionArray == null) {
				String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
				ArrayList<Product> list = new ArrayList<>();
				if(category == null) {
					list = hotdealService.selectList(currentPage, location);
				}else {
					list = hotdealService.selectListCategory(currentPage, location, category);
				}
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}else {
				switch(optionArray) {
				case "1":
					optionArray = "별점순(high to low)";
					break;
				case "2":
					optionArray = "신상품순";
					break;
				case "3":
					optionArray = "가격순(low to high)";
					break;
				case "4":
					optionArray = "가격순(high to low)";
					break;
				}
				String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
				ArrayList<Product> list = hotdealService.selectList(currentPage, location, optionArray);
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}
		}else {
			if(optionArray == null) {
				int currentPage = page != null ? page : 1;
				ArrayList<Product> list = new ArrayList<>();
				
				if(category == null) {
					list = hotdealService.selectList(currentPage);
				}else {
					list = hotdealService.selectListCategory(currentPage, category);
				}
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}else {
				switch(optionArray) {
				case "1":
					optionArray = "별점순(high to low)";
					break;
				case "2":
					optionArray = "신상품순";
					break;
				case "3":
					optionArray = "가격순(low to high)";
					break;
				case "4":
					optionArray = "가격순(high to low)";
					break;
				}
				int currentPage = page != null ? page : 1;
				ArrayList<Product> list = hotdealService.selectList(currentPage, optionArray);
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}
		}
		
		
		
		if(msg != null) {
			model.addAttribute("msg", msg);
		}

		return "hotDeal/hotDealMain";
	}

	@RequestMapping("hotDealDetail.do")
	public ModelAndView hotDealDetail(ModelAndView mv, int pNo, @RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="divide", required=false) String str, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			int currentPage = page != null ? page : 1;
	
			Product product = null;
	
			boolean flag = false;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("pNo" + pNo)) {
						flag = true; // 해당 게시글에 대한 쿠키 존재 (이미 읽은 게시물)
					}
				}
			}
			if (!flag) {
				// 처음 읽은 게시물 일 때
				Cookie c = new Cookie("pNo" + pNo, String.valueOf(pNo));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 쿠키 저장
				response.addCookie(c);
			}
			product = hotdealService.selectBoard(pNo, flag);
			ArrayList<Review> review = hotdealService.selectReviewList(pNo);
			Customer loginUser = (Customer)session.getAttribute("loginUser");
			ArrayList<Product> list = new ArrayList<>();
			if(loginUser != null) {
				list = hotdealService.selectListCategory(currentPage, (loginUser.getcAddress().split(",")[1]).split(" ")[1], product.getCgName());
			}else {
				list = hotdealService.selectListCategory(currentPage, product.getCgName());
			}
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getpNo() == product.getpNo()) {
					list.remove(i);
				}
			}
			if(str == null) {
				
				mv.addObject("hotdealDetail", product).addObject("currentPage", currentPage);
				mv.addObject("review", review);
				mv.addObject("list", list);
				mv.setViewName("hotDeal/hotDealDetail");
			
			}else {
				Map<String, Object> map = new HashMap<String, Object>();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String date = sdf.format(product.getpDate());
				product.setpDate(null);
				
				map.put("date", date);
				map.put("hotdealDetail", product);
				map.put("currentPage", currentPage);
				map.put("review", review);
				mv.addAllObjects(map);
				mv.setViewName("jsonView");
				response.setContentType("application/json; charset=utf-8"); 
			}
			
			return mv;
		
	}

	// mapping 겹쳐서 주석처리함 
/*	@RequestMapping("insertHotDeal.do")
	public String insertHotDeal() {
		return "hotDeal/insertHotDealForm";
	}
*/

	@RequestMapping("hotDealQnA.do")
	public String hotDealQnA() {
		return "hotDeal/hotDealQnA";
	}

	@RequestMapping("hotDealAddCart.do")
	public String hotDealAddCart(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		Cart c = new Cart();
		int qty = 1;
		if(request.getParameter("qty") != null) {
			qty = Integer.parseInt(request.getParameter("qty"));
		}
		 
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		c.setcNo(cNo); c.setpNo(pNo); c.setQuantity(qty);
		int result = hotdealService.AddCart(c);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:hotDealBuyForm.do";
		}else {
			return "hotDeal/hotDealMain";
		}
	}

	@RequestMapping("hotDealBuyForm.do")
	public String hotDealBuyForm(Model model, int cNo) {
		ArrayList<Cart> list = hotdealService.getMyCart(cNo);
		int total = 0;
		for(int i = 0; i < list.size(); i++) {
			total += (list.get(i).getpFinalPrice() * list.get(i).getQuantity());
		}
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
		return "user/buyForm";
	}

	@RequestMapping("hotDealCheckOutForm.do")
	public String hotDealCheckOutForm(Model model, HttpSession session, int total, ArrayList<Cart> list) {
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("loginUser", loginUser);
		return "user/checkOutForm";
	}
	@RequestMapping("hotDealAddWishList.do")
	public String hotDealAddWishList(RedirectAttributes redirectAttributes, Model model, int pNo, int cNo) {
		Favorite f = new Favorite();
		f.setcNo(cNo); f.setpNo(pNo);
		
		try {
			int result = hotdealService.AddWishList(f);
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:hotDealWishList.do";
		}catch(Exception e) {
			redirectAttributes.addAttribute("msg", "이미 존재하는 상품이거나 찜등록에 실패하였습니다.");
			return "redirect:hotDealMenu.do";
		}
		
	}

	@RequestMapping("hotDealWishList.do")
	public String hotDealWishList(Model model, int cNo) {
		ArrayList<Favorite> list = hotdealService.getMyWishList(cNo);
		model.addAttribute("list", list);
		
		return "user/wishList";
	}

	@RequestMapping("hotDealInsertForm.do")
	public String hotDealInsert() {
		return "hotDeal/hotDealInsertForm";
	}
	
	@RequestMapping("hotDealBuyProduct.do")
	public String hotDealBuyProduct(RedirectAttributes redirectAttributes, int cNo, String uId, String method) {
		ArrayList<Cart> list = hotdealService.getMyCart(cNo);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("cNo", cNo);
		map.put("method", method);
		map.put("pageInfo", "핫딜");
		map.put("uId", uId);
		System.out.println("UID: " + uId);
		
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:hotDealReceiveInfo.do";
		
	}
	
	@RequestMapping("completeReceive.do")
	public String hotDealcompleteReceive(int cNo, String receiver, String method, String uId) {
		ArrayList<Cart> list = hotdealService.getMyCart(cNo);
		ArrayList<Deal> lists = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Deal d = new Deal();
			d.setcNo(cNo); 			       d.setdAmount(list.get(i).getQuantity());
			d.setdMethod(method);          d.setdPrice(list.get(i).getpFinalPrice());
			d.setdReceiver(receiver);      d.setdRevCheck("미수령"); 
			d.setpNo(list.get(i).getpNo());d.setdStatus("Y");
			d.setdUid(uId);
			
			hotdealService.insertDeal(d);
			lists.add(d);
		}
		

		int result = hotdealService.buyProduct(cNo);
		
		return "redirect:myProfile.do";
	}
	
	@RequestMapping("hotDealReceiveInfo.do")
	public String hotDealReceiveInfo(Model model, @ModelAttribute("map") HashMap<String, Object> map) {
		ArrayList<Cart> list = (ArrayList<Cart>) map.get("list");
		int cNo = (int) map.get("cNo");
		
		model.addAttribute("list", list);
		model.addAttribute("cNo", cNo);
		model.addAttribute("method", map.get("method"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		model.addAttribute("uId", map.get("uId"));
		return "common/receiveInfo";
	}
	
	@RequestMapping("hotDealReview.do")
	public String hotDealReview(Model model, int dNo) {
		Deal d = hotdealService.selectDeal(dNo);
		
		model.addAttribute("d", d);
		return "hotDeal/hotDealReview";
	}
	
	@RequestMapping("deleteWishlist.do")
	public String deleteWishlist(RedirectAttributes redirectAttributes, int pNo, int cNo) {
		Favorite f = new Favorite();
		f.setcNo(cNo); f.setpNo(pNo);
		int result = hotdealService.deleteWishList(f);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:hotDealWishList.do";
		}else {
			redirectAttributes.addAttribute("msg", "해당 찜목록 삭제에 실패하였습니다.");
			return "redirect:hotDealWishList.do";
		}
	}
	@RequestMapping("deleteCart.do")
	public String deleteCart(RedirectAttributes redirectAttributes, int cartNo, int cNo) {
		Cart c = new Cart();
		c.setcNo(cNo); c.setCartNo(cartNo);
		int result = hotdealService.deleteCart(c);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:hotDealBuyForm.do";
		}else {
			redirectAttributes.addAttribute("msg", "해당 장바구니목록 삭제에 실패하였습니다.");
			return "redirect:hotDealBuyForm.do";
		}
	}
	
	@RequestMapping("InsertReview.do")
	public String InsertReview(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		String star = request.getParameter("starRate");
		int starRate = 0;
		switch(star) {
		case "별1":
			starRate = 1;
			break;
		case "별2":
			starRate = 2;
			break;
		case "별3":
			starRate = 3;
			break;
		case "별4":
			starRate = 4;
			break;
		case "별5":
			starRate = 5;
			break;
		}
		Review r = new Review();
		r.setRvStarRate(starRate);
		r.setRvContent(content);
		r.setpNo(pNo);
		r.setcName(name);
		r.setcNo(cNo);
		
		int result = hotdealService.AddReview(r);
		
		if(result > 0) {
			Product p = hotdealService.selectBoard(pNo, false);
			ArrayList<Review> r2 = hotdealService.selectReviewList(pNo);
			int totalStar = 0;
			for(int i = 0; i < r2.size(); i++) {
				totalStar += r2.get(i).getRvStarRate();
			}
			p.setpStarRate(totalStar / r2.size());
			int results = hotdealService.updateBoard(p);
			
			redirectAttributes.addAttribute("msg", "리뷰등록에 성공하였습니다.");
			return "redirect:hotDealMenu.do";
		}else {
			redirectAttributes.addAttribute("msg", "리뷰등록에 실패하였습니다.");
			return "redirect:hotDealMenu.do";
		}
	}

}
