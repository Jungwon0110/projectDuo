package com.spring.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.mapper.BoardMapper;

@Service("com.spring.blog.service.BoardService")
public class BoardService {

	@Resource(name = "com.spring.blog.mapper.BoardMapper")
	BoardMapper boardMapper;

	public int boardCount() throws Exception {
		return boardMapper.boardCount();
	}

	public List<BoardDto> boardListService() throws Exception {
		return boardMapper.boardList();
	}

	public BoardDto boardDetailService(int boardNum) throws Exception {
		return boardMapper.boardDetail(boardNum);
	}

	public void boardInsertService(BoardDto board) throws Exception {
		boardMapper.boardInsert(board);
	}

	public void boardUpdateService(BoardDto board) throws Exception {
		boardMapper.boardUpdate(board);
	}

	public void boardDeleteService(int boardNum) throws Exception {
		boardMapper.boardDelete(boardNum);
	}

	public void fileInsertService(FileDto filedto) throws Exception {
		boardMapper.fileInsert(filedto);
	}
}
