package com.spring.blog.dto;

import java.util.Date;

public class CommentDto {

	private int commentNum;
	private String commentKategorie;
	private int kategorieNum;
	private String commentAuthor;
	private String commentContents;
	private Date createdDate;
	private Date updatedDate;
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDto(int commentNum, String commentKategorie, int kategorieNum, String commentAuthor, String commentContents, Date createdDate, Date updatedDate) {
		super();
		this.commentNum = commentNum;
		this.commentKategorie = commentKategorie;
		this.kategorieNum = kategorieNum;
		this.commentAuthor = commentAuthor;
		this.commentContents = commentContents;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
	}
	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", commentKategorie=" + commentKategorie + ", kategorieNum=" + kategorieNum + ", commentAuthor=" + commentAuthor + ", commentContents=" + commentContents + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentKategorie() {
		return commentKategorie;
	}
	public void setCommentKategorie(String commentKategorie) {
		this.commentKategorie = commentKategorie;
	}
	public int getKategorieNum() {
		return kategorieNum;
	}
	public void setKategorieNum(int kategorieNum) {
		this.kategorieNum = kategorieNum;
	}
	public String getCommentAuthor() {
		return commentAuthor;
	}
	public void setCommentAuthor(String commentAuthor) {
		this.commentAuthor = commentAuthor;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
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

	
	
}
