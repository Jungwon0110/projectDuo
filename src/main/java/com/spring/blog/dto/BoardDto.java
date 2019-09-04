package com.spring.blog.dto;

import java.util.Date;

public class BoardDto {
    private int boardNum;
    private String kategorie;
    private String boardTitle;
    private String boardAuthor;
    private Date createdDate;
    private Date updatedDate;
    private int viewCount;
    private String boardContents;
    
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardDto(int boardNum, String kategorie, String boardTitle, String boardAuthor, Date createdDate, Date updatedDate, int viewCount, String boardContents) {
		super();
		this.boardNum = boardNum;
		this.kategorie = kategorie;
		this.boardTitle = boardTitle;
		this.boardAuthor = boardAuthor;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.viewCount = viewCount;
		this.boardContents = boardContents;
	}
	
	@Override
	public String toString() {
		return "BoardDto [boardNum=" + boardNum + ", kategorie=" + kategorie + ", boardTitle=" + boardTitle + ", boardAuthor=" + boardAuthor + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", viewCount=" + viewCount + ", boardContents=" + boardContents + "]";
	}
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getKategorie() {
		return kategorie;
	}
	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardAuthor() {
		return boardAuthor;
	}
	public void setBoardAuthor(String boardAuthor) {
		this.boardAuthor = boardAuthor;
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
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
}
 
