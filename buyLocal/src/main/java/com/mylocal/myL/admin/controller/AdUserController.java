package com.mylocal.myL.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mylocal.myL.admin.model.exception.AdUserException;
import com.mylocal.myL.admin.model.service.AdUserService;
import com.mylocal.myL.admin.model.vo.Customer;
import com.mylocal.myL.admin.model.vo.Deal;


@Controller
public class AdUserController {
	@Autowired
	AdUserService adUserService;

	// 회원 관리 메뉴(수정 완료)
	@RequestMapping("user.do")
	public String UserMenu() {
		return "admin/user";
	}

	// 일반 회원 메뉴(수정완료)
	@RequestMapping("normalUser.do")
	public String NormalUserMenu() {
		return "admin/normalUser";
	}

	// 일반 회원 정보 리스트
	@RequestMapping("normalUserInfo.do")
	public ModelAndView NormalUserInfo(ModelAndView mv) {
		ArrayList<Customer> list = adUserService.NormalUserInfoList();

		System.out.println(list);
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/normalUserInfo");
		}else {
			throw new AdUserException("일반회원 정보 조회 실패!");
		}
		

		return mv;
	}

	// 일반 회원 구매정보
	@RequestMapping("adNormalUserBuy.do")
	public ModelAndView adNormalUserBuy(ModelAndView mv) {
		ArrayList<Deal> list = adUserService.NormalUserBuyList();
		
		System.out.println(list);
		
		mv.addObject("list", list);
		mv.setViewName("admin/normalUserBuy");

		return mv;
	}
	
	// 상세보기 페이지로 이동
	@RequestMapping("normalUserReportDetail.do")
		public ModelAndView normalUserReportDetail(ModelAndView mv, int cNo) {

			Customer customer = null;

			
			customer = adUserService.selectNormalCustomer(cNo);
			

			if (customer != null) {
				mv.addObject("customer", customer);
				mv.setViewName("admin/reportNormalUserUpdate");

			} else {
				throw new AdUserException("일반회원 블랙 업데이트 화면 요청 실패!");
			}

			return mv;
		}
		
	

	// 일반 회원 블랙 처리 해결(업데이트) status를 취소시켜주는것 'Y'로 변경해주자
	@RequestMapping("normalUserReport")
	public ModelAndView adNormalUserReport(ModelAndView mv, Customer cu,
										@RequestParam("cStatus") String cStatus) {		
		cu.setcStatus(cStatus);
		
		
		int result = adUserService.UpdateNormalUser(cu);
		
		if(result > 0) {
			mv.setViewName("admin/businessUserGrade");
		}else {
			throw new AdUserException("회원 탈퇴/철회  실패!");
		}

		return mv;
	}

	// 사업자 회원 메뉴(수정완료)
	@RequestMapping("businessUser.do")
	public String BusinessUserMenu() {
		return "admin/businessUser";
	}

	// 사업자 정보 리스트들 보기(사업자로 인증된 사람들만 보자)
	@RequestMapping("businessUserInfo.do")
	public ModelAndView BusinessUserInfo(ModelAndView mv) {
		
		// 정상적인 사업자 리스트
		ArrayList<Customer> list = adUserService.BusinessUserInfoSelectList();
		
		

		// 신고된 사업자 리스트
		ArrayList<Customer> list2 = adUserService.BusinessUserInfoSelectList2();

		if (list != null || list2 != null) {
			mv.addObject("list", list);
			mv.addObject("list2", list2);
			mv.setViewName("admin/businessUserInfo");
		} else {
			throw new AdUserException("사업자 리스트 조회 실패!");
		}

		return mv;
	}

	// 사업자 정보 상세보기(통계로 보는용 거래량등)
	@RequestMapping("businessUserInfoDetail.do")
	public ModelAndView businessUserInfoDetail(ModelAndView mv, int sNo) {

		Customer customer = adUserService.selectCustomer(sNo);

		return mv;

	}

	// 사업자 정보(등급 관리) 리스트
	@RequestMapping("businessUserGrade.do")
	public ModelAndView BusinessUserGrade(ModelAndView mv) {
		ArrayList<Customer> list = adUserService.BusinessUserGradeSelectList();

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/businessUserGrade");
		} else {
			throw new AdUserException("사업자 등급 조회 실패!");
		}

		return mv;

	}

	// 사업자 등급관리 리스트
	@RequestMapping("businessUserShopNo.do")
	public ModelAndView BusinessUserDetail(ModelAndView mv, int cNo) {

		Customer customer = adUserService.selectCustomer(cNo); // 같은거 써도 상관없을듯 셀렉만 다른거니

		return mv;

	}

	// 사업자 등급 관련 폼 디테일폼
	@RequestMapping("register.do")
	public ModelAndView register(ModelAndView mv, int cNo) {

		Customer customer = null;

		customer = adUserService.selectCustomer(cNo);

		if (customer != null) {
			mv.addObject("customer", customer);
			mv.setViewName("admin/register");

		} else {
			throw new AdUserException("사업자 등급 조회 실패!");
		}

		return mv;
	}

	// 사업자 등급 변경
	@RequestMapping("businessUserGradeUpdate.do")
	public ModelAndView BusinessUserGradeUpdate(ModelAndView mv, Customer cu) {

		int result = adUserService.updateBusiness(cu);
		
		int result2 = adUserService.updateBusiness2(cu);

		if (result > 0 || result2>0) {
			mv.setViewName("admin/businessUserGrade");
			mv.addObject("msg", "사업자 등록이 완료되었습니다.");
		} else {
			throw new AdUserException("사업자 등급 변경 실패!");
		}
		return mv;
	}
	
	// 사업자 등록 취소
	@RequestMapping("gradeCancel.do")
	public String gradeCancel(ModelAndView mv, int cNo) {

		
		int result = adUserService.deleteGrade(cNo);
		
		
		if(result > 0) {
			return "redirect:businessUserGrade.do";
		}else {
			throw new AdUserException("허위 신고 처리 실패"); 
		}
		

	}

	// 사업자 블랙 취소 (업데이트)
	@RequestMapping("businessUserReport.do")
	public String BusinessUserReport(ModelAndView mv, Customer cu) {

		int result = adUserService.updateBusinessReport(cu);
		
		if(result > 0) {
			return "redirect:businessUserInfo.do";
		}else {
			throw new AdUserException("회원 탈퇴/철회  실패!");
		}

	}
	

}
