package com.mylocal.myL.shop.ttang.controller;

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
import com.mylocal.myL.shop.ttang.model.vo.Product;
import com.mylocal.myL.user.model.vo.Customer;
import com.mylocal.myL.shop.ttang.model.service.*;

@Controller
public class ttangController {
	
	@Autowired
	private ttangService ttangService;
	
	
	@RequestMapping("ttangMain.do")
	public String ttangMenu(HttpSession session, Model model, @RequestParam(value = "page", required = false) Integer page, 
			@RequestParam(value = "msg", required = false) String msg, @RequestParam(value = "optionArray", required = false) String optionArray,
			@RequestParam(value = "category", required = false) String category) {		
		
		
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		if(loginUser != null) {
			int currentPage = page != null ? page : 1;
			
			if(optionArray == null) {
				String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
				ArrayList<Product> list = new ArrayList<>();
				if(category == null) {
					list = ttangService.selectList(currentPage, location);
				}else {
					list = ttangService.selectListCategory(currentPage, location, category);
				}
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}else {
				switch(optionArray) {
				case "1":
					optionArray = "이름순(A-Z)";
					break;
				case "2":
					optionArray = "이름순(Z-A)";
					break;
				case "3":
					optionArray = "가격순(low to high)";
					break;
				case "4":
					optionArray = "가격순(high to low)";
					break;
				}
				
				String location = (loginUser.getcAddress().split(",")[1]).split(" ")[1];
				ArrayList<Product> list = ttangService.selectList(currentPage, location, optionArray);
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}
		}else {
			if(optionArray == null) {
				int currentPage = page != null ? page : 1;
				ArrayList<Product> list = new ArrayList<>();
				
				if(category == null) {
					list = ttangService.selectList(currentPage);
				}else {
					list = ttangService.selectListCategory(currentPage, category);
				}
				
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}else {
				switch(optionArray) {
				case "1":
					optionArray = "이름순(A-Z)";
					break;
				case "2":
					optionArray = "이름순(Z-A)";
					break;
				case "3":
					optionArray = "가격순(low to high)";
					break;
				case "4":
					optionArray = "가격순(high to l0ow)";
					break;
				}
				int currentPage = page != null ? page : 1;
				ArrayList<Product> list = ttangService.selectList(currentPage, optionArray);
				model.addAttribute("list", list);
				model.addAttribute("pi", Pagination.getPageInfo());
			}
		}
		
		
		if(msg != null) {
			model.addAttribute("msg", msg);
		}

		return "ttang/ttangMain";
	}

	
	
	@RequestMapping("ttangDetail.do")
	public ModelAndView ttangDetail(ModelAndView mv, int pNo, 
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="divide", required=false) String str,
			HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		
		// System.out.println("pNo(컨트롤러) : " + pNo);
		
		int currentPage = page != null ? page : 1;
		
		Product product = null;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("pNo" + pNo)) {
					flag = true; // 해당게시글에 대한 쿠키 존재(이미 읽은 게시물)
				}
			}
		}
		
		if(!flag) {
			Cookie c = new Cookie("pNo" + pNo, String.valueOf(pNo));
			c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 쿠키 저장
			response.addCookie(c);
		}
		product = ttangService.selectBoard(pNo, flag);
		// ArrayList<Review> review = ttangService.selectReviewList(pNo);
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		ArrayList<Product> list = new ArrayList<>();
		
		System.out.println("list = " + list);
		
		if(loginUser != null) {
			list = ttangService.selectListCategory(currentPage, (loginUser.getcAddress().split(",")[1]).split(" ")[1], product.getCgName());
		}else {
			list = ttangService.selectListCategory(currentPage, product.getCgName());
		}
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getpNo() == product.getpNo()) {
				list.remove(i);
			}
		}
		
		if(str == null) {
			mv.addObject("ttangDetail", product).addObject("currentPage", currentPage);
			mv.addObject("list", list);
			mv.setViewName("ttang/ttangDetail");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(product.getpDate());
			product.setpDate(null);
			map.put("date", date);
			map.put("ttangDetail", product);
			map.put("currentPage", currentPage);
			mv.addAllObjects(map);
			mv.setViewName("jsonView");
			response.setContentType("application/json; charset=utf-8");
		}
		
		return mv;
	}
	
	
	
	// 장바구니 담기
	@RequestMapping("ttangAddCart.do")
	public String ttangAddCart(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		
		Cart c = new Cart();
		
		int qty = 1;
		
		if(request.getParameter("qty") != null) {
			System.out.println(qty);
			qty = Integer.parseInt(request.getParameter("qty"));
			System.out.println("qty : " + qty); // x
		}
		 
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		System.out.println("pNo  : " + pNo);
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		c.setcNo(cNo); c.setpNo(pNo); c.setQuantity(qty);
		
		System.out.println("CART(컨트롤러) : " + c );
		
		int result = ttangService.AddCart(c);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:ttangBuyForm.do";
		}else {
			return "ttang/ttangMain";
		}
	}
	

	@RequestMapping("ttangBuyForm.do")
	public String ttangBuyForm(Model model, int cNo) {
		ArrayList<Cart> list = ttangService.getMyCart(cNo);
		int total = 0;
		for(int i = 0; i < list.size(); i++) {
			total += (list.get(i).getpFinalPrice() * list.get(i).getQuantity());
		}
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
		return "user/buyForm";
	}
	

	@RequestMapping("ttangCheckOutForm.do")
	public String ttangCheckOutForm(Model model, HttpSession session, int total, ArrayList<Cart> list) {
		Customer loginUser = (Customer)session.getAttribute("loginUser");
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("loginUser", loginUser);
		return "user/checkOutForm";
	}
	

	@RequestMapping("ttangAddWishList.do")
	public String ttangAddWishList(RedirectAttributes redirectAttributes, Model model, int pNo, int cNo) {
		
		System.out.println("pNo : " + pNo);
		Favorite f = new Favorite();
		
		System.out.println("f : " + f);
		f.setcNo(cNo); f.setpNo(pNo);
		
		try {
			int result = ttangService.AddWishList(f);
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:ttangWishList.do";
		}catch(Exception e) {
			redirectAttributes.addAttribute("msg", "이미 존재하는 상품이거나 찜등록에 실패하였습니다.");
			return "redirect:ttangMain.do";
		}
		
	}
	
	// 위시리스트
	@RequestMapping("ttangWishList.do")
	public String ttangWishList(Model model, int cNo) {
		ArrayList<Favorite> list = ttangService.getMyWishList(cNo);
		model.addAttribute("list", list);
		return "user/wishList";
	}
	
	@RequestMapping("ttangBuyProduct.do")
	public String ttangBuyProduct(RedirectAttributes redirectAttributes, int cNo, String uId) {
		ArrayList<Cart> list = ttangService.getMyCart(cNo);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("cNo", cNo);
		map.put("method", "카드");
		map.put("pageInfo", "땡처리");
		map.put("uId", uId);
		System.out.println("UID: " + uId);
		
		redirectAttributes.addFlashAttribute("map", map);
		return "redirect:ttangReceiveInfo.do";
		
	}
	
	@RequestMapping("completeReceive1.do")
	public String ttangcompleteReceive(int cNo, String receiver, String method, String uId) {
		ArrayList<Cart> list = ttangService.getMyCart(cNo);
		ArrayList<Deal> lists = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Deal d = new Deal();
			d.setcNo(cNo); 			       d.setdAmount(list.get(i).getQuantity());
			d.setdMethod(method);          d.setdPrice(list.get(i).getpFinalPrice());
			d.setdReceiver(receiver);      d.setdRevCheck("미수령"); 
			d.setpNo(list.get(i).getpNo());d.setdStatus("Y");
			d.setdUid(uId);
			
			ttangService.insertDeal(d);
			lists.add(d);
		}
		

		int result = ttangService.buyProduct(cNo);
		
		return "redirect:myProfile.do";
	}
	
	@RequestMapping("ttangReceiveInfo.do")
	public String ttangReceiveInfo(Model model, @ModelAttribute("map") HashMap<String, Object> map) {
		ArrayList<Cart> list = (ArrayList<Cart>) map.get("list");
		int cNo = (int) map.get("cNo");
		
		model.addAttribute("list", list);
		model.addAttribute("cNo", cNo);
		model.addAttribute("method", map.get("method"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		model.addAttribute("uId", map.get("uId"));
		return "common/receiveInfo";
	}
	
	
	@RequestMapping("deleteWishlist1.do")
	public String deleteWishlist(RedirectAttributes redirectAttributes, int pNo, int cNo) {
		Favorite f = new Favorite();
		f.setcNo(cNo); f.setpNo(pNo);
		int result = ttangService.deleteWishList(f);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:ttangWishList.do";
		}else {
			redirectAttributes.addAttribute("msg", "해당 찜목록 삭제에 실패하였습니다.");
			return "redirect:ttangWishList.do";
		}
	}
	
	@RequestMapping("deleteCart1.do")
	public String deleteCart(RedirectAttributes redirectAttributes, int pNo, int cNo) {
		Cart c = new Cart();
		c.setcNo(cNo); c.setpNo(pNo);
		int result = ttangService.deleteCart(c);
		if(result > 0) {
			redirectAttributes.addAttribute("cNo", cNo);
			return "redirect:ttangBuyForm.do";
		}else {
			redirectAttributes.addAttribute("msg", "해당 장바구니목록 삭제에 실패하였습니다.");
			return "redirect:ttangBuyForm.do";
		}
	}
	
	
	

		
	
	
	
	
	
	
	
	
	
	
	
}
