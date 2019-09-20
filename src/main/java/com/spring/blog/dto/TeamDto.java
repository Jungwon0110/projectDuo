package com.spring.blog.dto;

public class TeamDto {

    // portfolioNum 
    private int portfolioNum;

    // member 
    private String member;

    public int getPortfolioNum() {
        return portfolioNum;
    }

    public void setPortfolioNum(Integer portfolioNum) {
        this.portfolioNum = portfolioNum;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    // Team 모델 복사
    public void CopyData(TeamDto param)
    {
        this.portfolioNum = param.getPortfolioNum();
        this.member = param.getMember();
    }
}