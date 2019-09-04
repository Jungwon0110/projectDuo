package com.spring.blog.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;

@Repository("com.spring.blog.mapper.BoardMapper")
public interface BoardMapper {

	// 게시글 개수
	public int boardCount() throws Exception;

	// 게시글 목록
	public List<BoardDto> boardList() throws Exception;

	// 게시글 상세
	public BoardDto boardDetail(int boardNum) throws Exception;

	// 게시글 작성
	public void boardInsert(BoardDto board) throws Exception;

	// 게시글 수정
	public void boardUpdate(BoardDto board) throws Exception;

	// 게시글 삭제
	public void boardDelete(int boardNum) throws Exception;

	// 파일 업로드
	public void fileInsert(FileDto filedto) throws Exception;
	 
}
