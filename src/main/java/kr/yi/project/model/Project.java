package kr.yi.project.model;

import java.util.Date;

public class Project {
	private int no;
	private String name;
	private String content;
	private Date startDate;
	private Date endDate;
	private String progress;
	

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public String getProgress() {
		return progress;
	}
	
	

	public void setNo(int no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	@Override
	public String toString() {
		return "Project [no=" + no + ", name=" + name + ", content=" + content + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", progress=" + progress + "]";
	}
	
	

}
