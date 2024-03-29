package com.ssafy.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
private static Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	// 예외를 어떻게 처리할지 정의
	@ExceptionHandler(Exception.class)
	public String handleException(Model model, Exception e) {
		logger.error("예외 발생" , e.getCause());
		e.printStackTrace();
		return "/error/errorPage";
	}
}
