package com.spring.blog.dto;

public class TestDTO {
    private int SEQ;
    private String ITEMID;
 
    public TestDTO() {
 
    }
 
    public TestDTO(int sEQ, String iTEMID) {
        super();
        SEQ = sEQ;
        ITEMID = iTEMID;
    }
 
    public int getSEQ() {
        return SEQ;
    }
 
    public void setSEQ(int sEQ) {
        SEQ = sEQ;
    }
 
    public String getITEMID() {
        return ITEMID;
    }
 
    public void setITEMID(String iTEMID) {
        ITEMID = iTEMID;
    }
 
}
 
