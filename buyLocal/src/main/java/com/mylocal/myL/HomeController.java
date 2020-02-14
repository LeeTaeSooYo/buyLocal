package com.mylocal.myL;

import java.text.DateFormat;
import java.util.ArrayList;
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

import com.mylocal.myL.admin.model.service.AdContentService;
import com.mylocal.myL.admin.model.service.AdminService;
import com.mylocal.myL.admin.model.vo.Notice;
import com.mylocal.myL.admin.model.vo.QnA;
import com.mylocal.myL.common.SearchList;
import com.mylocal.myL.share.model.vo.ShareBoard;
import com.mylocal.myL.share.service.ShareService;
import com.mylocal.myL.shop.hotDeal.model.service.hotDealService;
import com.mylocal.myL.shop.hotDeal.model.vo.Product;
import com.mylocal.myL.shop.ttang.model.service.ttangService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@Autowired
	private hotDealService hotdealService;
	@Autowired
	private ttangService ttangService;
	@Autowired
	private ShareService shareService;
	@Autowired
	private AdminService adService;
	@Autowired
	private AdContentService adContentService;
	
	
   @RequestMapping("main.do")
   public String main(Model model) {
      ArrayList<Product> list = hotdealService.selectList(1);
      ArrayList<com.mylocal.myL.shop.ttang.model.vo.Product> list2 = ttangService.selectList(1);
      ArrayList<ShareBoard> list3 = shareService.selectList(1);
      ArrayList<Notice> list4 = adService.NoticeSelectList(1);
      
      ArrayList<SearchList> searchList = hotdealService.selectSearchList();
      model.addAttribute("list", list);
      model.addAttribute("list2", list2);
      model.addAttribute("list3", list3);
      model.addAttribute("list4", list4);
      model.addAttribute("searchList", searchList);
      
      return "common/main";
   }
	
	@RequestMapping("totalSearch.do")
	public String search(HttpServletRequest request, Model model) {
		String searchStr = request.getParameter("popup-search");
		
		ArrayList<Product> listH = hotdealService.searchList(searchStr);
		ArrayList<Product> listT = ttangService.searchList(searchStr);
		ArrayList<ShareBoard> listN = shareService.searchList(searchStr);
		ArrayList<Notice> listS = adService.NoticeSelectList(1);
		ArrayList<QnA> listQ = adContentService.QnASelectList();
 		
		model.addAttribute("listH", listH);
		model.addAttribute("listT", listT);
		model.addAttribute("listN", listN);
		model.addAttribute("listS", listS);
		model.addAttribute("listQ", listQ);
		model.addAttribute("searchStr", searchStr);
		
		return "common/mainSearchResult";
	}
}
