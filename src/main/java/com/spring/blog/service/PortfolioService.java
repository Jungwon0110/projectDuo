package com.spring.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.dto.PortfolioDto;
import com.spring.blog.mapper.BoardMapper;
import com.spring.blog.mapper.PortfolioMapper;

@Service("com.spring.blog.service.PortfolioService")
public class PortfolioService {

	@Resource(name = "com.spring.blog.mapper.PortfolioMapper")
	PortfolioMapper portfolioMapper;

	public int portfolioCount() throws Exception {
		return portfolioMapper.portfolioCount();
	}

	public List<PortfolioDto> portfolioListService() throws Exception {
		return portfolioMapper.portfolioList();
	}
	
	public void portfolioInsertService(PortfolioDto portfolioDto) throws Exception {
		portfolioMapper.portfolioInsertProc(portfolioDto);
	}
}
