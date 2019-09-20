package com.spring.blog.dto;

import java.util.Date;

public class AgileBoardStartDto {

    private int agileNum;
    private String agileTitle;
    private String agileAuthor;
	private Date startTime;
	
	public AgileBoardStartDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AgileBoardStartDto(int agileNum, String agileTitle, String agileAuthor, Date startTime) {
		super();
		this.agileNum = agileNum;
		this.agileTitle = agileTitle;
		this.agileAuthor = agileAuthor;
		this.startTime = startTime;
	}
	
	@Override
	public String toString() {
		return "AgileBoardStartDto [agileNum=" + agileNum + ", agileTitle=" + agileTitle + ", agileAuthor=" + agileAuthor + ", startTime=" + startTime + "]";
	}
	public int getAgileNum() {
		return agileNum;
	}
	public void setAgileNum(int agileNum) {
		this.agileNum = agileNum;
	}
	public String getAgileTitle() {
		return agileTitle;
	}
	public void setAgileTitle(String agileTitle) {
		this.agileTitle = agileTitle;
	}
	public String getAgileAuthor() {
		return agileAuthor;
	}
	public void setAgileAuthor(String agileAuthor) {
		this.agileAuthor = agileAuthor;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	
    
    
}
