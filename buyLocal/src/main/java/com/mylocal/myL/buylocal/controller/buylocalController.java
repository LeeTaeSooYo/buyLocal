package com.mylocal.myL.buylocal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class buylocalController {

	// 사이트 소개
	@RequestMapping("introduction.do")
	public String introduction() {
		return "buylocal/introduction";
	}
	
	// 홀리몰리
	@RequestMapping("holymoly.do")
	public String holymoly() {
		return "buylocal/holymoly";
	}
}
