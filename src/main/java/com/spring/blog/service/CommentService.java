package com.spring.blog.service;
 
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.dto.CommentDto;
import com.spring.blog.mapper.CommentMapper;
 
@Service("com.spring.blog.service.CommentService")
public class CommentService {
 
    @Resource(name="com.spring.blog.mapper.CommentMapper")
    CommentMapper commentMapper;
    
    public List<CommentDto> commentListService() throws Exception{
        
        return commentMapper.commentList();
    }
    
    public int commentInsertService(CommentDto commentDto) throws Exception{
        
        return commentMapper.commentInsert(commentDto);
    }
    
    public int commentUpdateService(CommentDto commentDto) throws Exception{
        
        return commentMapper.commentUpdate(commentDto);
    }
    
    public int commentDeleteService(int commentNum) throws Exception{
        
        return commentMapper.commentDelete(commentNum);
    }
}

