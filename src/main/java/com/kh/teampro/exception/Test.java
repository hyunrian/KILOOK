package com.kh.teampro.exception;

import java.nio.file.AccessDeniedException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Test {

	// 존재하지 않는 url을 요청하면 404 발생
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public String test() {
		String result = String.valueOf(10 / 0); // 405 발생
		return "exception/test";
	}
	
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String test2() {
		if (true) {
			throw new RuntimeException("This is a simulated 500 error.");
		}
		return "exception/test";
	}
	
	@RequestMapping("/test-forbidden")
    public String testForbidden() throws AccessDeniedException {
		throw new AccessDeniedException("You don't have permission to access this resource.");
    }
}
