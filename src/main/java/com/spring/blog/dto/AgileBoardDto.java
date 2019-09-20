package com.spring.blog.dto;

import java.util.Date;

public class AgileBoardDto {

    private Integer agileboardnum;
    private Integer portfolionum;
    private String agiletitle;
    private String status;
    private Date starttime;
    private Date endtime;
    private String description;
    private String pic;
    
	public AgileBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AgileBoardDto(Integer agileboardnum, Integer portfolionum, String agiletitle, String status, Date starttime, Date endtime, String description, String pic) {
		super();
		this.agileboardnum = agileboardnum;
		this.portfolionum = portfolionum;
		this.agiletitle = agiletitle;
		this.status = status;
		this.starttime = starttime;
		this.endtime = endtime;
		this.description = description;
		this.pic = pic;
	}
	
	@Override
	public String toString() {
		return "AgileBoardDto [agileboardnum=" + agileboardnum + ", portfolionum=" + portfolionum + ", agiletitle=" + agiletitle + ", status=" + status + ", starttime=" + starttime + ", endtime=" + endtime + ", description=" + description + ", pic=" + pic + "]";
	}
	
	public Integer getAgileboardnum() {
		return agileboardnum;
	}
	public void setAgileboardnum(Integer agileboardnum) {
		this.agileboardnum = agileboardnum;
	}
	public Integer getPortfolionum() {
		return portfolionum;
	}
	public void setPortfolionum(Integer portfolionum) {
		this.portfolionum = portfolionum;
	}
	public String getAgiletitle() {
		return agiletitle;
	}
	public void setAgiletitle(String agiletitle) {
		this.agiletitle = agiletitle;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
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
