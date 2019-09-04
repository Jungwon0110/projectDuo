package com.spring.blog.service;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.mapper.BoardMapper;
 
@Service("com.spring.blog.service.BoardService")
public class BoardService {
 
    @Resource(name="com.spring.blog.mapper.BoardMapper")
    BoardMapper boardMapper;
    
    public int boardCount() throws Exception{
		return boardMapper.boardCount();
		
    }
    
    public List<BoardDto> boardListService() throws Exception{
        return boardMapper.boardList();
    }
    
    public BoardDto boardDetailService(int num) throws Exception{
        return boardMapper.boardDetail(num);
    }
    
    public int boardInsertService(BoardDto board) throws Exception{
       return boardMapper.boardInsert(board);
    }
    
    public int boardUpdateService(BoardDto board) throws Exception{
    	return boardMapper.boardUpdate(board);
    }
    
    public int boardDeleteService(int num) throws Exception{
    	return boardMapper.boardDelete(num);
    }

	

	
}

