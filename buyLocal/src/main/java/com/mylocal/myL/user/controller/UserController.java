package com.mylocal.myL.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mylocal.myL.common.Cart;
import com.mylocal.myL.common.Deal;
import com.mylocal.myL.common.Favorite;
import com.mylocal.myL.shop.hotDeal.model.service.hotDealService;
import com.mylocal.myL.user.model.dao.UserDao;
import com.mylocal.myL.user.model.exception.UserException;
import com.mylocal.myL.user.model.service.UserService;
import com.mylocal.myL.user.model.vo.BusinessInfo;
import com.mylocal.myL.user.model.vo.Customer;
import com.mylocal.myL.user.model.vo.NaverLoginApi;
import com.mylocal.myL.user.model.vo.NaverLoginBO;

@SessionAttributes("loginUser")
@Controller
public class UserController {

   @Autowired
   private UserService userService;
   @Autowired 
   private hotDealService hotdealService;
   @Autowired 
   private UserDao userDao;
   

/*    NaverLoginBO 
   @Autowired 
   private NaverLoginBO naverLoginBO;
   @Autowired 
   private NaverController naverLoginDTO;

    NaverLoginBO 
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO){
      this.naverLoginBO = naverLoginBO;
   }
   */
   
   private Logger logger = LoggerFactory.getLogger(UserController.class);
   
   // 비밀번호 암호화 처리를 위한 encoder를 필드에 선언해 줌
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   // 로그인 페이지 이동 처리
   @RequestMapping("userLogin.do")
   public String userLogin() {
      return "user/userLogin";
      }
   
   // 회원가입 전 회원 구분 페이지 이동 처리
   @RequestMapping("userType.do")
   public String userType() {
      return "user/userType";
      }
   
   // 일반 회원용 가입 폼 페이지 이동 처리 
   @RequestMapping("userSignUp.do")
   public String userSignUp() {
      return "user/userSignUp";
      }
   
   // 사업자 회원용 가입 폼 페이지 이동 처리 
   @RequestMapping("sellerSignUp.do")
   public String sellerSignUp() {
      return "user/sellerSignUp";
      }
   
   // 로그인 후 마이페이지 이동 처리  
   @RequestMapping("myProfile.do")
   public ModelAndView myProfile(ModelAndView mv, HttpSession session) {
      Customer loginUser = (Customer)session.getAttribute("loginUser");
      int cNo = loginUser.getcNo();
      
      // 일반 회원의 경우 구매내역 카운트 가지고 이동 
      if(loginUser.getcLevel().equals("일반")) { 
         int dCount = userService.countDeal(cNo);
         session.setAttribute("dCount", dCount);
         mv.addObject("dCount", dCount);
         mv.setViewName("user/myProfile");
         
      // 사업자 회원의 경우 거래내역 카운트 가지고 이동 
      } else {
         int bCount = userService.countBusiness(cNo);
         session.setAttribute("bCount", bCount);
         mv.addObject("bCount", bCount);
         mv.setViewName("user/myProfile");
      }
      return mv;
      }
   
   // 마이페이지에서 정보수정 페이지 이동 처리
   @RequestMapping("myInfo.do")
   public String myInfo() {
      return "user/myInfo";
      }
   
   // 마이페이지에서 구매내역 페이지 이동 처리 (범석수정)
   @RequestMapping("myOrderList.do")
      public String myOrderList(HttpSession session, Model model) {
         Customer loginUser = (Customer)session.getAttribute("loginUser");
         int cNo = loginUser.getcNo();
         
         
         ArrayList<Deal> list = userService.selectDealList2(cNo);
         model.addAttribute("list", list);
         
         return "user/myOrderList";
         }
   
   // 마이페이지에서 장바구니 페이지 이동 처리
      @RequestMapping("myCart.do")
      public String myCart(Model model, int cNo) {
         ArrayList<Cart> list = hotdealService.getMyCart(cNo);
         int total = 0;
         for(int i = 0; i < list.size(); i++) {
            total += (list.get(i).getpFinalPrice() * list.get(i).getQuantity());
         }
         model.addAttribute("total", total);
         model.addAttribute("list", list);
         
         return "user/buyForm";
         }
   
   // 마이페이지에서 사업자 회원 거래내역 페이지 이동처리
   @RequestMapping("myBusiness.do")
   public String myBusiness(Model model, HttpSession session) {   
      
      Customer loginUser = (Customer)session.getAttribute("loginUser");
      
      int cNo = loginUser.getcNo();
      
      ArrayList<Deal> dlist = userService.selectDealList(cNo);
      model.addAttribute("dlist", dlist);
   
   
      if(dlist != null) {
         return "user/myBusiness";
      } else {
         model.addAttribute("msg", "거래 내역 조회에 실패했습니다.");
         return "user/myBusiness";
      }
      
   }
   
   // 네비바에서 하트 누르면 찜 페이지 이동 처리
   @RequestMapping("myFavorite.do")
   public String myFavorite(Model model, int cNo) {
      ArrayList<Favorite> list = hotdealService.getMyWishList(cNo);
      model.addAttribute("list", list);
      
      return "user/wishList";
      }
   

   
   // 일반 회원 가입 폼 작성 후 요청 처리 컨트롤러
   @RequestMapping("cinsert.do")
   public String insertCustomer(Customer c,
                        @RequestParam("post") String post,
                        @RequestParam("address1") String address1,
                        @RequestParam("address2") String address2,
                        Model model) {
//      System.out.println(c);
//      String encPwd = bcryptPasswordEncoder.encode(c.getcPwd());
      c.setcPwd(bcryptPasswordEncoder.encode(c.getcPwd())); // setter를 통해 암호화 된 비밀번호로 변경 처리
      c.setcAddress(post + "," + address1 + ", " + address2); // 주소 문자열로 처리 
      System.out.println(c);
      
      int result = userService.insertCustomer(c);
      
      if(result > 0) {
         model.addAttribute("msg", "회원 가입이 완료되었습니다."); // 왜 안뜨지?
         return "redirect:main.do";
      } else {
         model.addAttribute("msg", "회원 가입에 실패했습니다.");
         return "redirect:main.do";
      }
      
      
       
   }
   
   // 암호화 처리 후 로그인 (일반 회원)
   @RequestMapping(value="login.do", method=RequestMethod.POST)
   public String loginCustomer(Customer c, Model model, HttpSession session) {
      
      Customer loginUser = userService.loginCustomer(c);
      
      System.out.println("loginUser" + loginUser);
      
//      boolean flag = bcryptPasswordEncoder.matches(c.getcPwd(), loginUser.getcPwd());
//      System.out.println("비밀번호 일치 여부? " + flag);
      
      if(loginUser != null && bcryptPasswordEncoder.matches(c.getcPwd(), loginUser.getcPwd())) {
         model.addAttribute("loginUser", loginUser);
         
         // 로그인 시 로그인 유저의 장바구니 불러오기
         ArrayList<Cart> list = hotdealService.getMyCart(loginUser.getcNo());
         int total = 0;
         for(int i = 0; i < list.size(); i++) {
            total += (list.get(i).getpFinalPrice() * list.get(i).getQuantity());
         }
         
         /*model.addAttribute("total", total);
         model.addAttribute("list", list);*/
         
         session.setAttribute("total", total);
         session.setAttribute("buylist", list);
         return "redirect:main.do";
      } else {
         model.addAttribute("msg", "로그인 정보가 일치하지 않습니다.");
         return "user/userLogin";
      }
      
   }
   
   // 로그아웃
   @RequestMapping("logout.do")
   public String logout(SessionStatus status) {
      
      status.setComplete();
      return "common/main";
   }
   
   
   // 아이디 중복 확인
   @RequestMapping(value = "checkId.do", method = RequestMethod.POST)
   public void checkId(@RequestParam("cId") String cId, HttpServletResponse response) throws Exception {
      userService.checkId(cId, response);
   }
   
   // 이메일 중복 확인 
   @RequestMapping(value = "checkEmail.do", method = RequestMethod.POST)
   public void checkEmail(@RequestParam("cEmail") String cEmail, HttpServletResponse response) throws Exception {
      System.out.println("넘어온 이메일 값 : " + cEmail);
      userService.checkEmail(cEmail, response);
   }
   
   
   // 회원 정보 수정 
   @RequestMapping("cupdate.do")
   public String updateCustomer(Customer c, Model model,
                        @RequestParam("post") String post,
                        @RequestParam("address1") String addr1,
                        @RequestParam("address2") String addr2, HttpSession session) {
      
      c.setcAddress(post+","+addr1+","+addr2);
      
      int result = userService.updateCustomer(c);
      
      if(result > 0) {
         session.setAttribute("msg", "회원 정보가 수정되었습니다.");
         session.setAttribute("loginUser", c);
         return "user/myProfile";
      } else {
         session.setAttribute("msg", "회원 정보 수정 실패!");
         return "user/myProfile";
      }
      
   }
   
   
   // 사업자 회원 가입
   @RequestMapping("binsert.do")
   public String insertBusinessInfo(Customer c, BusinessInfo bi,
                           @RequestParam("post") String post,
                           @RequestParam("address1") String addr1,
                           @RequestParam("address2") String addr2,
                           @RequestParam("bPost") String bPost,
                           @RequestParam("bAddress1") String bAddr1,
                           @RequestParam("bAddress2") String bAddr2,
                           Model model) {
      
      
      c.setcPwd(bcryptPasswordEncoder.encode(c.getcPwd()));
      c.setcAddress(post+","+addr1+","+addr2);
      bi.setbShopAddress(bPost+","+bAddr1+","+bAddr2);
      
      System.out.println(c);
      System.out.println(bi);
      
      int result1 = userService.insertCustomer(c);
      
      if(result1 > 0) {
         
         int result2 = userService.insertBusinessInfo(bi);
         
         if(result2 > 0) {
            model.addAttribute("msg", "회원 가입이 완료되었습니다.");
            return "redirect:main.do";
         } else {
            model.addAttribute("msg", "회원 가입에 실패했습니다.");
            return "redirect:main.do";
         }
       
      } else {
         model.addAttribute("msg", "회원 가입에 실패했습니다.");
         return "redirect:main.do";
      }
   
   }
   
   
   // 사업자 거래 내역 조회 페이지에서 상품 수령 체크
   @RequestMapping("checkRcv.do")
   public ModelAndView checkRcv(Deal d, @RequestParam("dRevCheck") String dRevCheck,
                     @RequestParam("dNo") int dNo, ModelAndView mv, HttpSession session) {
   
      if(dRevCheck.equals("미수령")) {
         d.setdRevCheck("수령");
      } else {
         d.setdRevCheck("미수령");
      }
      
      int result = userService.checkRcv(d);
      
      if(result > 0) {
         mv.addObject("deal", d);
         mv.addObject("msg", "수령 현황 변경 완료");
         mv.setViewName("redirect:myBusiness.do");
      } else {
         mv.addObject("msg", "수령 현황 변경 실패");
         mv.setViewName("redirect:myBusiness.do");
      }
      
      return mv;
   }
   
   // 비밀번호 찾기 
   @RequestMapping(value="findPwd.do", method=RequestMethod.POST)
   public String findPwd(Model model, Customer findUser) throws Exception {
      // 비밀번호 찾으려는 유저 정보 불러오기
      Customer c = userService.loginCustomer(findUser);
      
      if (c != null) {
         // 임시 비밀번호 생성
         String temPwd = "";
         for (int i = 0; i < 12; i++) {
            temPwd += (char) ((Math.random() * 26) + 97);
         }
         // 비밀번호 변경
         c.setcPwd(bcryptPasswordEncoder.encode(temPwd));
         userService.updatePwd(c);
         // 비밀번호 변경 메일 발송
         int mailResult = userService.sendMail(c, "findPwd", temPwd);
         
         if(mailResult > 0) {
            model.addAttribute("msg", "이메일로 임시 비밀번호를 발송하였습니다.");
            return "user/userLogin";
         } else {
            model.addAttribute("msg", "메일 전송 실패");
            return "user/userLogin";
         }
         
      } else {
         model.addAttribute("msg", "일치하는 회원이 없습니다. 입력 정보를 다시 한번 확인해주세요.");
         return "user/userLogin";
      }
      
   }
   

   // 마이페이지에서 비밀번호 변경 페이지 이동 처리
   @RequestMapping("myPassword.do")
   public String myPassword() {
      return "user/updatePwdForm";
   }
   
   // 비밀번호 변경
   @RequestMapping("updatePwd.do")
   public String updatePwd(Model model, Customer c, HttpSession session) {
      
      System.out.println("넘어온 로그인 유저 : " + c);
      
      Customer loginUser = (Customer)session.getAttribute("loginUser");
      loginUser.setcPwd(bcryptPasswordEncoder.encode(c.getcPwd()));
      
      int result = userService.updatePwd(loginUser);
      
      if(result > 0) {
         model.addAttribute("loginUser", loginUser);
         model.addAttribute("msg", "비밀번호 변경이 완료되었습니다.");
         return "redirect:myProfile.do";
      } else {
         model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
         return "redirect:myProfile.do";
      }
   }

   
   // 회원 탈퇴
   @RequestMapping("cdelete.do") 
   public String deleteCustomer(String cId, HttpSession session) {
      
      int result = userService.deleteCustomer(cId);
      
      if(result > 0) {
         session.setAttribute("msg", "회원 탈퇴가 완료되었습니다.");
         return "redirect:logout.do";
      } else {
         session.setAttribute("msg", "회원 탈퇴에 실패했습니다.");
         return "redirect:cupdate.do";
      }
      
   }
   
   
   // 사업자 번호 중복 확인
   @RequestMapping(value = "checkShopNo.do", method = RequestMethod.POST)
   public void checkShopNo(@RequestParam("bShopNo") String bShopNo, HttpServletResponse response) throws Exception {
      userService.checkShopNo(bShopNo, response);
   }
   
}   
      
   
   
   