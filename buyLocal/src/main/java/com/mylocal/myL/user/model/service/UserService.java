package com.mylocal.myL.user.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.mylocal.myL.common.Deal;
import com.mylocal.myL.user.model.vo.BusinessInfo;
import com.mylocal.myL.user.model.vo.Customer;

public interface UserService {
	
	// 아이디 중복 체크 서비스
	public void checkId(String cId, HttpServletResponse response) throws Exception;
	
	// 이메일 중복 체크 서비스 
	public void checkEmail(String cEmail, HttpServletResponse response) throws Exception;
	
	// 회원 가입 서비스
	public int insertCustomer(Customer c);
	public int insertBusinessInfo(BusinessInfo bi);
		
	// 회원 로그인 서비스
	public Customer loginCustomer(Customer c);
	
	// 회원 정보 수정 서비스
	public int updateCustomer(Customer c);
	
	// 회원 탈퇴 서비스
	public int deleteCustomer(String cId);

	//  사업자 거래내역 조회 서비스
	public ArrayList<Deal> selectDealList(int cNo);
	
	// 사업자 수령 확인 서비스
	public int checkRcv(Deal d);
	
	// 이메일 발송
	/*public void sendMail(Customer c, String div, String temPwd);*/
	public int sendMail(Customer c, String div, String temPwd);
	
	
	// 비밀번호 변경
	public int updatePwd(Customer c);
	
	// 비밀번호 찾기 
	/*public int findPwd(Customer c);*/
	
	// 일반회원 구매 건수 조회
	public int countDeal(int cNo);

	// 범석
	public ArrayList<Deal> selectDealList2(int cNo);
	
	// 사업자 회원 거래 건수 조회
	public int countBusiness(int cNo);
	
	// 사업자 번호 중복 체크
	public void checkShopNo(String bShopNo, HttpServletResponse response) throws Exception;
	
	
}
