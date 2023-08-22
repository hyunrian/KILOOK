package com.kh.teampro.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {
	
	@RequestMapping("/error404")
    public String error404() {
        return "exception/error404";
    }

    @RequestMapping("/error405")
    public String error405() {
        return "exception/error405";
    }

    @RequestMapping("/error500")
    public String error500() {
        return "exception/error500";
    }
    
    @RequestMapping("/error")
    public String error() {
    	return "exception/error";
    }
	
}
