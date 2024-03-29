package com.spring.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.dto.PortfolioDto;
import com.spring.blog.dto.TeamDto;
import com.spring.blog.mapper.BoardMapper;
import com.spring.blog.mapper.PortfolioMapper;

@Service("com.spring.blog.service.PortfolioService")
public class PortfolioService {

	@Resource(name = "com.spring.blog.mapper.PortfolioMapper")
	PortfolioMapper portfolioMapper;

	public int portfolioCount() throws Exception {
		return portfolioMapper.portfolioCount();
	}
	
	public int portfolioAllCount() throws Exception {
		return portfolioMapper.portfolioAllCount();
	}


	public List<PortfolioDto> portfolioListService() throws Exception {
		return portfolioMapper.portfolioList();
	}
	
	public List<PortfolioDto> wapplePortfolioService(String search) throws Exception {
		return portfolioMapper.wapplePortfolio(search);
	}
	
	public void portfolioInsertService(PortfolioDto portfolioDto) throws Exception {
		portfolioMapper.portfolioInsertProc(portfolioDto);
	}

	public void portfolioFileInsertService(FileDto fileDto) {
		// TODO Auto-generated method stub
		portfolioMapper.portfolioFileInsertProc(fileDto);
	}
	
	public int findPortfolioNum() {
		return portfolioMapper.findPortfolioNum();
	}

	public void addTeam(TeamDto teamDto) {
		portfolioMapper.addTeam(teamDto);
	}
}
