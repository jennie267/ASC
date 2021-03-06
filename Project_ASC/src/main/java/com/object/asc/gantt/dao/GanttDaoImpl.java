package com.object.asc.gantt.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChartList;

/**
 * 
 * GanttDao 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.object.asc.gantt.dao
 * @파일명 : GanttDaoImpl.java
 * @작성자 : 
 * @작성일 : 2017. 6. 01.
 *
 */
@Repository
public class GanttDaoImpl implements GanttDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.GanttMapper";

	@Override
	public List<HashMap<String, Object>> ganttList(int projectListNo) {
		return sqlSession.selectList(namespace+".ganttList", projectListNo);
	}

	@Override
	public void register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectListNo", projectListNo);
		map.put("userNo", userNo);
		map.put("title", title);
		map.put("worker", worker);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("color", color);
		
		sqlSession.insert(namespace+".register", map);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		sqlSession.update(namespace +".modify", gcl);
	}

	@Override
	public void delete(int ganttListNo) {
		sqlSession.delete(namespace + ".delete", ganttListNo);
		
	}

	@Override
	public List<String> todayList(int ganttNo) {
		return sqlSession.selectList(namespace+".todayList", ganttNo);
	}

	@Override
	public void actionRegister(int projectListNo, ActionChartList actionChartList) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectListNo", projectListNo);
		map.put("ganttListNo", actionChartList.getGanttListNo());
		map.put("userNo", actionChartList.getUserNo());
		map.put("actionDate", actionChartList.getActionDate());
		map.put("status", actionChartList.getStatus());
		
		sqlSession.insert(namespace+".actionRegister", map);
	}

	@Override
	public List<HashMap<String, Object>> actionList(int projectListNo) {
		return sqlSession.selectList(namespace+".actionList", projectListNo);
	}

	@Override
	public List<String> todayCheck(int projectListNo) {
		return sqlSession.selectList(namespace+".todayCheck", projectListNo);
	}

	@Override
	public void deleteAction(int ganttListNo) {
		sqlSession.delete(namespace+".deleteAction", ganttListNo);
	}

	@Override
	public void percentUpdate(int projectListNo, String percent) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectListNo", projectListNo);
		map.put("percent", percent);
		
		sqlSession.update(namespace+".percentUpdate", map);
	}

	@Override
	public int getProjectNoGantt(int ganttNo) {
		return sqlSession.selectOne(namespace+".getProjectNoGantt", ganttNo);
	}

	@Override
	public GanttChartList getProjectInfoGantt(int ganttListNo) {
		return sqlSession.selectOne(namespace+".getProjectInfoGantt", ganttListNo);
	}

}
