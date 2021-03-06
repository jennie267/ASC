package com.object.asc.gantt.domain;

import java.sql.Date;

/**
 * 
 * 진행차트 내역 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : ActionChartList.java
 * @작성자 : 
 * @작성일 : 2017. 6. 01. 
 *
 */
public class ActionChartList {
	private int actionListNo;
	private int actionNo;
	private int ganttListNo;
	private int userNo;
	private Date actionDate;
	private int status;
	
	public ActionChartList() {
	}

	public ActionChartList(int actionListNo, int actionNo, int ganttListNo, int userNo, Date actionDate, int status) {
		super();
		this.actionListNo = actionListNo;
		this.actionNo = actionNo;
		this.ganttListNo = ganttListNo;
		this.userNo = userNo;
		this.actionDate = actionDate;
		this.status = status;
	}

	public int getActionListNo() {
		return actionListNo;
	}

	public void setActionListNo(int actionListNo) {
		this.actionListNo = actionListNo;
	}

	public int getActionNo() {
		return actionNo;
	}

	public void setActionNo(int actionNo) {
		this.actionNo = actionNo;
	}

	public int getGanttListNo() {
		return ganttListNo;
	}

	public void setGanttListNo(int ganttListNo) {
		this.ganttListNo = ganttListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getActionDate() {
		return actionDate;
	}

	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ActionChartList [actionListNo=" + actionListNo + ", actionNo=" + actionNo + ", ganttListNo="
				+ ganttListNo + ", userNo=" + userNo + ", actionDate=" + actionDate + ", status=" + status + "]";
	}
	
	

}
