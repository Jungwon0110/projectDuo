package com.spring.blog.mapper;
 
import java.util.List;

import com.spring.blog.dto.TestDTO;
 
public interface DbMapper {
    public List<TestDTO> getList() throws Exception;
}