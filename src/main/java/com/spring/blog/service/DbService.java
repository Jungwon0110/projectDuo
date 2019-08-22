package com.spring.blog.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blog.dao.DbMapper;
import com.spring.blog.dto.TestDTO;
 
@Service
public class DbService {
    
    @Autowired
    DbMapper dbmapper;
    
    public List<TestDTO> getList() throws Exception{
        
        return dbmapper.getList();
        
    }
}