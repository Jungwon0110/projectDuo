package com.spring.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.dto.AgileBoardStartDto;
import com.spring.blog.dto.BoardDto;
import com.spring.blog.mapper.BoardMapper;
import com.spring.blog.mapper.JiraMapper;

@Service("com.spring.blog.service.JiraService")
public class JiraService {

	
	@Resource(name = "com.spring.blog.mapper.JiraMapper")
	JiraMapper jiraMapper;
	
	public void jiraMakeService(AgileBoardStartDto agileBoardStartDto) throws Exception {
		jiraMapper.jiraMake(agileBoardStartDto);
	}

	public List<AgileBoardStartDto> jiraListService() throws Exception {
		return jiraMapper.jiraList();
	}
	
	public AgileBoardStartDto jiraDetailService(int agileNum) throws Exception {
		return jiraMapper.jiraDetail_1(agileNum);
	}
}
