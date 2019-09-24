package com.spring.blog.controller;
 
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blog.dto.CommentDto;
import com.spring.blog.repository.AccountRepository;
import com.spring.blog.service.CommentService;
 
@Controller
@RequestMapping("/comment")
public class CommentController {
 
    @Resource(name="com.spring.blog.service.CommentService")
    CommentService commentService;
    
    @Autowired
	AccountRepository accountRepository;
    
    @RequestMapping(value ="/commentlist", method = RequestMethod.POST) //댓글 리스트
    @ResponseBody
    private List<CommentDto> commentListService(Model model) throws Exception{
    	model.addAttribute("user", accountRepository.findMe());
        return commentService.commentListService();
    }
    
    @RequestMapping(value ="/commentInsert", method = RequestMethod.POST) //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(HttpServletRequest request) throws Exception{
        
        CommentDto commentDto = new CommentDto();
        
        commentDto.setCommentNum(Integer.parseInt(request.getParameter("commentNum")));
        commentDto.setCommentContents(request.getParameter("commentContents"));
        commentDto.setCommentContents(request.getParameter("commentContents"));
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
        commentDto.setCommentAuthor(request.getParameter("name"));  
        
        return commentService.commentInsertService(commentDto);
    }
    
    @RequestMapping(value ="/commentUpdate", method = RequestMethod.POST) //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int commentNum, @RequestParam String commentContent) throws Exception{
        
    	CommentDto commentDto = new CommentDto();
    	commentDto.setCommentNum(commentNum);
    	commentDto.setCommentContents(commentContent);
        
        return commentService.commentUpdateService(commentDto);
    }
    
    @RequestMapping(value = "/commentDelete/{commentNum}", method = RequestMethod.POST) //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int commentNum) throws Exception{
        return commentService.commentDeleteService(commentNum);
    }
    
}
