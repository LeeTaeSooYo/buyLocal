package com.mylocal.myL.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mylocal.myL.admin.model.vo.Customer;
import com.mylocal.myL.admin.model.vo.Deal;



@Repository("adUserDao")
public class AdUserDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	
	// 사업자 등급 관리 리스트
		public ArrayList<Customer> BusinessUserGradeSelectList() {
			return (ArrayList)sqlSession.selectList("adUserMapper.BusinessUserGradeSelectList");
		}

		// 사업자 정보 리스트
		public ArrayList<Customer> BusinessUserInfoSelectList() {
			return (ArrayList)sqlSession.selectList("adUserMapper.BusinessUserInfoSelectList");
		}
		
		// 사업자 정보 리스트(신고된 리스트)
		public ArrayList<Customer> BusinessUserInfoSelectList2() {
			return (ArrayList)sqlSession.selectList("adUserMapper.BusinessUserInfoSelectList2");
		}
		
		
		// 일반 회원 정보
		public ArrayList<Customer> NormalUserInfoList() {
			return (ArrayList)sqlSession.selectList("adUserMapper.NormalUserInfoList");
		}

		// 일반 회원 구매 리스트
		public ArrayList<Deal> NormalUserBuyList() {
			return (ArrayList)sqlSession.selectList("adUserMapper.NormalUserBuyList");
		}


		// 일반회원 상세보기
		

		// 사업자 정보 상세보기
		public Customer SelectCustomer(int cNo) {
			return sqlSession.selectOne("adUserMapper.selectCustomer", cNo);
		}


		// 사업자 등급 업데이트
		public int UpdateBusinessGrade(Customer cu) {
			return sqlSession.update("adUserMapper.updateBusinessGrade", cu);
		}
		
		// 사업자 등급 업데이트 business info도
		public int UpdateBusinessGrade2(Customer cu) {
			return sqlSession.update("adUserMapper.updateBusinessGrade2", cu);
		}


		// 일반 회원 블랙/정지 처리 취소
		public int UpdateNormalUser(Customer cu) {
			return sqlSession.update("adUserMapper.updateNormalUser", cu);
		}

		// 사업자회원 블랙처리(아직 안만듬)
		public int UpdateBusinessReport(Customer cu) {
			return sqlSession.update("adUserMapper.updateBusinessReport", cu);
		}

		// 일반 회원 정보 상세보기
		public Customer selectNormalCustomer(int cNo) {
			return sqlSession.selectOne("adUserMapper.selectNormalCustomer", cNo);
		}

		// 등급 리스트 제외
		public int UpdateGradeCancel(int cNo) {
			return sqlSession.update("adUserMapper.updateGradeCancel", cNo);
		}



		
	
}
