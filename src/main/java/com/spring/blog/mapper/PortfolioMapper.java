package com.spring.blog.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.dto.PortfolioDto;

@Repository("com.spring.blog.mapper.PortfolioMapper")
public interface PortfolioMapper {

	// 포트폴리오 개수
	public int portfolioCount() throws Exception;

	// 포트폴리오 목록
	public List<PortfolioDto> portfolioList() throws Exception;

	//포트폴리오 삽입
	public void portfolioInsertProc(PortfolioDto portfolioDto) throws Exception;

	//포트폴리오 file 삽입
	public void portfolioFileInsertProc(FileDto fileDto);
}
