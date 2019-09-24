package com.spring.blog.dto;

import java.util.Date;

public class AgileBoardDto {

    private int agileBoardNum;
    private int portfolioNum;
    private String agileTitle;
    private String status;
    private Date updatedTime;
    private String description;
    private String pic;
    
	public AgileBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AgileBoardDto(int agileBoardNum, int portfolioNum, String agileTitle, String status, Date updatedTime, String description, String pic) {
		super();
		this.agileBoardNum = agileBoardNum;
		this.portfolioNum = portfolioNum;
		this.agileTitle = agileTitle;
		this.status = status;
		this.updatedTime = updatedTime;
		this.description = description;
		this.pic = pic;
	}
	
	@Override
	public String toString() {
		return "AgileBoardDto [agileBoardNum=" + agileBoardNum + ", portfolioNum=" + portfolioNum + ", agileTitle=" + agileTitle + ", status=" + status + ", updatedTime=" + updatedTime + ", description=" + description + ", pic=" + pic + "]";
	}
	public int getAgileBoardNum() {
		return agileBoardNum;
	}
	public void setAgileBoardNum(int agileBoardNum) {
		this.agileBoardNum = agileBoardNum;
	}
	public int getPortfolioNum() {
		return portfolioNum;
	}
	public void setPortfolioNum(int portfolioNum) {
		this.portfolioNum = portfolioNum;
	}
	public String getAgileTitle() {
		return agileTitle;
	}
	public void setAgileTitle(String agileTitle) {
		this.agileTitle = agileTitle;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

    
    
}