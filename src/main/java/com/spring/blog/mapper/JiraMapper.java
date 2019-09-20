package com.spring.blog.mapper;
	
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.blog.dto.AgileBoardStartDto;

@Repository("com.spring.blog.mapper.JiraMapper")
public interface JiraMapper {

	public void jiraMake(AgileBoardStartDto agileBoardStartDto) throws Exception;
	
	public List<AgileBoardStartDto> jiraList() throws Exception;
	
	public AgileBoardStartDto jiraDetail_1(int agileNum) throws Exception;

}
