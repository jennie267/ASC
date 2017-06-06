package com.object.asc.gantt.service;

import java.util.List;

import com.object.asc.gantt.domain.GanttChartList;

public interface GanttService {
	
	/** 간트 차트 기능 조회 */
	public List<GanttChartList> ganttList(int ganttNo);

	/** 기능 추가 */
	public void register(GanttChartList gcl);
	
	/** 기능 수정 */
	public void modify(GanttChartList gcl);
	
}
