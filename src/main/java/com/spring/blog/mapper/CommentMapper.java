package com.spring.blog.mapper;
 
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.blog.dto.CommentDto;
 
@Repository("com.spring.blog.mapper.CommentMapper")
public interface CommentMapper {
    // 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<CommentDto> commentList() throws Exception;
 
    // 댓글 작성
    public int commentInsert(CommentDto commentDto) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(CommentDto commentDto) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int commentNum) throws Exception;
 
}
