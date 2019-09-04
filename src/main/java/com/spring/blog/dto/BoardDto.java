package com.spring.blog.dto;

import java.util.Date;

public class BoardDto {
    private int num;
    private String kategorie;
    private String title;
    private String name;
    private Date createdDate;
    private Date updatedDate;
    private int viewCount;
    private String contents;
    
    
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BoardDto(int num, String kategorie, String title, String name, Date createdDate, Date updatedDate,
			int viewCount, String contents) {
		super();
		this.num = num;
		this.kategorie = kategorie;
		this.title = title;
		this.name = name;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.viewCount = viewCount;
		this.contents = contents;
	}
	
	
	@Override
	public String toString() {
		return "BoardDto [num=" + num + ", kategorie=" + kategorie + ", title=" + title + ", name=" + name
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", viewCount=" + viewCount
				+ ", contents=" + contents + "]";
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKategorie() {
		return kategorie;
	}
	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
    
    
    
 
}
 
