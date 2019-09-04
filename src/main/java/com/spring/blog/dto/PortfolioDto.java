package com.spring.blog.dto;

import java.util.Date;

public class PortfolioDto {
	private int portfolioNum;
	private String portfolioTitle;
	private String teamName;
	private String leader;
	private String githubRepo;
	private String pageUrl;
	private String summary;
	private String youtubeUrl;
	private Date startTime;
	private Date EndTime;
	private String mainImage;

	public PortfolioDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PortfolioDto(int portfolioNum, String portfolioTitle, String teamName, String leader, String githubRepo, String pageUrl, String summary, String youtubeUrl, Date startTime, Date endTime, String mainImage) {
		super();
		this.portfolioNum = portfolioNum;
		this.portfolioTitle = portfolioTitle;
		this.teamName = teamName;
		this.leader = leader;
		this.githubRepo = githubRepo;
		this.pageUrl = pageUrl;
		this.summary = summary;
		this.youtubeUrl = youtubeUrl;
		this.startTime = startTime;
		EndTime = endTime;
		this.mainImage = mainImage;
	}

	@Override
	public String toString() {
		return "PortfolioDto [portfolioNum=" + portfolioNum + ", portfolioTitle=" + portfolioTitle + ", teamName=" + teamName + ", leader=" + leader + ", githubRepo=" + githubRepo + ", pageUrl=" + pageUrl + ", summary=" + summary + ", youtubeUrl=" + youtubeUrl + ", startTime=" + startTime
				+ ", EndTime=" + EndTime + ", mainImage=" + mainImage + "]";
	}

	public int getPortfolioNum() {
		return portfolioNum;
	}

	public void setPortfolioNum(int portfolioNum) {
		this.portfolioNum = portfolioNum;
	}

	public String getPortfolioTitle() {
		return portfolioTitle;
	}

	public void setPortfolioTitle(String portfolioTitle) {
		this.portfolioTitle = portfolioTitle;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getGithubRepo() {
		return githubRepo;
	}

	public void setGithubRepo(String githubRepo) {
		this.githubRepo = githubRepo;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getYoutubeUrl() {
		return youtubeUrl;
	}

	public void setYoutubeUrl(String youtubeUrl) {
		this.youtubeUrl = youtubeUrl;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return EndTime;
	}

	public void setEndTime(Date endTime) {
		EndTime = endTime;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

}
