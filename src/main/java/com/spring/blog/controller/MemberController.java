package com.spring.blog.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blog.domain.Account;
import com.spring.blog.dto.AccountKeyDto;
import com.spring.blog.dto.TempKey;
import com.spring.blog.service.MailServiceImpl;
import com.spring.blog.service.MemberService;

@Controller
public class MemberController {
   
   @Resource(name="com.spring.blog.service.MemberService")
   @Autowired
    MemberService memberService;
   @Autowired
   JavaMailSender javaMailSender;
   
   @RequestMapping("/find/{email}")
   @ResponseBody
   private Account findMemberByEmail(@PathVariable String email) throws Exception {
      Account existmem = memberService.findMemberByEmail(email);
      return existmem;
   }
   
   
   @RequestMapping(value = "/emailConfirm/{email}", method = RequestMethod.POST)
   @ResponseBody
   public String sendMailAuth(@PathVariable String email) throws MessagingException, UnsupportedEncodingException {
      MailServiceImpl sendmail = new MailServiceImpl(javaMailSender);
      
      String key = new TempKey().getKey(50,false);
      
      AccountKeyDto actkey = new AccountKeyDto();
      actkey.setEmail(email);
      actkey.setAuthkey(key);
      
      memberService.insertKey(actkey);

      sendmail.setSubject("[이메일 인증]");
      sendmail.setText(
               new StringBuffer().append("<h1>메일인증</h1>")
               .append("<a href='http://localhost:8080/emailConfirm?email=")
               .append(email)
               .append("&authKey=").append(key)
               .append("' target='_blank'>이메일 인증 확인</a>").toString());      
      sendmail.setFrom("fffff4324@gmail.com", "projectDuo");
      sendmail.setTo(email);
      sendmail.send();
      return "/";
   }
   
   @RequestMapping(value = "/emailConfirm/", method = RequestMethod.GET)
   @ResponseBody
   public String confirmMember(@PathVariable String email, @PathVariable String authkey) throws Exception {
      String userkey = memberService.findKey(email);
      if(userkey.equals(authkey)) {
         System.out.println("인증 성공!!!");
         memberService.changeRole(email);
      }else {
         
      }
      return "/";
   }
   
}