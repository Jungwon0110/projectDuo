package com.spring.blog.controller;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomErrorController implements ErrorController {

    private static final String PATH = "/error"; // configure 에서 Redirect 될 path

    @RequestMapping(value = PATH, method = RequestMethod.POST)
    public String error(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (String.valueOf(status).equalsIgnoreCase(HttpStatus.NOT_FOUND.toString())) {
            return "403"; // /WEB-INF/errors/404.jsp
        }
        return "error";
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }
}