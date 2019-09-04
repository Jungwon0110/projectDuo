package com.spring.blog.dto;

public class FileDto {
	private int fileNum;
	private String fileKategorie;
	private int kategorieNum;
	private String fileName;
	private String fileOriName;
	private String fileUrl;
	
	public FileDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FileDto(int fileNum, String fileKategorie, int kategorieNum, String fileName, String fileOriName, String fileUrl) {
		super();
		this.fileNum = fileNum;
		this.fileKategorie = fileKategorie;
		this.kategorieNum = kategorieNum;
		this.fileName = fileName;
		this.fileOriName = fileOriName;
		this.fileUrl = fileUrl;
	}
	
	@Override
	public String toString() {
		return "FileDto [fileNum=" + fileNum + ", fileKategorie=" + fileKategorie + ", kategorieNum=" + kategorieNum + ", fileName=" + fileName + ", fileOriName=" + fileOriName + ", fileUrl=" + fileUrl + "]";
	}
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileKategorie() {
		return fileKategorie;
	}
	public void setFileKategorie(String fileKategorie) {
		this.fileKategorie = fileKategorie;
	}
	public int getKategorieNum() {
		return kategorieNum;
	}
	public void setKategorieNum(int kategorieNum) {
		this.kategorieNum = kategorieNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
}
