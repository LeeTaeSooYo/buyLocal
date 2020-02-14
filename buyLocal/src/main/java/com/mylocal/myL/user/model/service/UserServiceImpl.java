package com.mylocal.myL.user.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mylocal.myL.common.Deal;
import com.mylocal.myL.user.model.dao.UserDao;
import com.mylocal.myL.user.model.vo.BusinessInfo;
import com.mylocal.myL.user.model.vo.Customer;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	// 비밀번호 암호화 처리를 위한 encoder를 필드에 선언해 줌
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public Customer loginCustomer(Customer c) {
		return userDao.selectCustomer(c);
	}


	@Override
	public int insertCustomer(Customer c) {
		return userDao.insertCustomer(c);
	}

	@Override
	public int insertBusinessInfo(BusinessInfo bi) {
		return userDao.insertBusinessInfo(bi);
	}

	@Override
	public int updateCustomer(Customer c) {
		return userDao.updateCustomer(c);
	}
	
	// 회원 탈퇴
	@Override
	public int deleteCustomer(String cId) {
		return userDao.deleteCustomer(cId);
	}
	
	// 사업자 거래 내역 조회
	@Override
	public ArrayList<Deal> selectDealList(int cNo) {
		return userDao.selectDealList(cNo);
	}


	@Override
	public int checkRcv(Deal d) {
		return userDao.updateRcv(d);
	}

	// 아이디 중복 검사 (ajax)
	@Override
	public void checkId(String cId, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(userDao.checkId(cId));
		out.close();
	}

	// 이메일 중복 검사 (ajax)
	@Override
	public void checkEmail(String cEmail, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		System.out.println("서비스 단에 넘어온 email 값 : " + cEmail);
		// 안넘어옴
		out.println(userDao.checkEmail(cEmail));
		out.close();
	}
	
	// 비밀번호 변경
	@Override
	public int updatePwd(Customer c) {
		return userDao.updatePwd(c);
	}
	
	// 이메일 발송
	public int sendMail(Customer c, String div, String temPwd) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "hedystarr@naver.com";
		String hostSMTPpwd = "thakd0256";
		
		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "hedystarr@naver.com";
		String fromName = "BUY LOCAL";
		String subject = "";
		String msg = "";
		
		if(div.equals("findPwd")) {
			subject = "[BUY LOCAL] 임시 비밀번호를 보내드립니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue'>";
			msg += c.getcId() + "님의 임시 비밀번호입니다. 비밀번호를 변경하여 사용하세요. </h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += temPwd + "</p></div>";
		}
		
		// 받는 사람 Email 주소
		String toMail = c.getcEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(toMail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			return 1;
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	// 비밀번호 찾기 
	/*@Override
	public void findPwd(HttpServletResponse response, Customer c) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(userDao.checkId(c.getcId()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!c.getcEmail().equals(userDao.selectCustomer(c).getcEmail())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String temPwd = "";
			for (int i = 0; i < 12; i++) {
				temPwd += (char) ((Math.random() * 26) + 97);
			}
			// 비밀번호 변경
			c.setcPwd(bcryptPasswordEncoder.encode(temPwd));
			// 비밀번호 변경 메일 발송
			userDao.updatePwd(c);
			
			sendMail(c, "findPwd", temPwd); 
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}*/
	
	
	// 일반 회원 구매내역 건수 조회 
	@Override
	public int countDeal(int cNo) {
		return userDao.countDeal(cNo);
	}


	// 범석
	@Override
	public ArrayList<Deal> selectDealList2(int cNo) {
		return userDao.selectDealList2(cNo);
	}

	
	// 사업자 회원 거래내역 건수 조회
	@Override
	public int countBusiness(int cNo) {
		return userDao.countBusiness(cNo);
	}

	// 사업자 번호 중복 체크
	@Override
	public void checkShopNo(String bShopNo, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(userDao.checkShopNo(bShopNo));
		out.close();
	}


}
