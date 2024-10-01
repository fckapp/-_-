package model;

import java.sql.Date;
import java.time.LocalDateTime;

public class Inquery {
	private int inqueryId;
	private String custId;
	private String category;
	private String title;
	private String inqueryContent;
	private LocalDateTime inqueryDate;
	private String adminId;
	private String replyContent;
	private LocalDateTime replyDate;
	private String formattedInqueryDate;
	private String formattedReplyDate;
	
	public int getInqueryId() {
		return inqueryId;
	}
	public void setInqueryId(int inqueryId) {
		this.inqueryId = inqueryId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInqueryContent() {
		return inqueryContent;
	}
	public void setInqueryContent(String inqueryContent) {
		this.inqueryContent = inqueryContent;
	}
	public LocalDateTime getInqueryDate() {
		return inqueryDate;
	}
	public void setInqueryDate(LocalDateTime inqueryDate) {
		this.inqueryDate = inqueryDate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public LocalDateTime getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(LocalDateTime replyDate) {
		this.replyDate = replyDate;
	}
	public String getFormattedInqueryDate() {
		return formattedInqueryDate;
	}
	public void setFormattedInqueryDate(String formattedInqueryDate) {
		this.formattedInqueryDate = formattedInqueryDate;
	}
	public String getFormattedReplyDate() {
		return formattedReplyDate;
	}
	public void setFormattedReplyDate(String formattedReplyDate) {
		this.formattedReplyDate = formattedReplyDate;
	}
	
	
	
	
	
}
