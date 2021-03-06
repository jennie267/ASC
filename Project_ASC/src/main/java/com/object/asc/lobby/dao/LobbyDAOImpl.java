package com.object.asc.lobby.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;

/**
 *
 * LobbyDao 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.object.asc.lobby.dao
 * @파일명 : LobbyDAOImpl.java
 * @작성자 : 
 * @작성일 : 2017. 6. 01.
 *
 */
@Repository
public class LobbyDAOImpl implements LobbyDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.object.asc.mapper.LobbyMapper";

	@Override
	public void projectJoinRegister() {
		sqlSession.insert(namespace + ".projectJoinRegister");
	}

	@Override
	public void projectListRegister(ProjectList projectList) {
		sqlSession.insert(namespace + ".projectListRegister", projectList);
	}

	@Override
	public ProjectList projectDate(int projectListNo) {
		return sqlSession.selectOne(namespace + ".projectDate", projectListNo);
	}

	@Override
	public void projectJoinListRegister(ProjectJoinList projectJoinList) {
		sqlSession.insert(namespace + ".projectJoinListRegister", projectJoinList);
	}

	@Override
	public ProjectJoin getProjectJoinNo() {
		return sqlSession.selectOne(namespace + ".projectJoinNo");
	}

	@Override
	public List<ProjectList> projectListAll(int userNo) {
		return sqlSession.selectList(namespace + ".projectListAll", userNo);
	}

	@Override
	public ProjectList getProjectList(int projectListNo) {
		return sqlSession.selectOne(namespace + ".getProjectList", projectListNo);
	}
	
	@Override
	public int memberCount(int projectJoinNo) {
		return sqlSession.selectOne(namespace + ".memberCount", projectJoinNo);
	}

	@Override
	public List<String> memberName(int projectListNo) {
		return sqlSession.selectList(namespace + ".memberName", projectListNo);
	}

	@Override
	public List<Map<String, Object>> memberId(int projectListNo) {
		return sqlSession.selectList(namespace + ".memberId", projectListNo);
	}

	@Override
	public void projectListUpdate(ProjectList projectList) {
		sqlSession.update(namespace + ".projectListUpdate", projectList);
	}

	@Override
	public void projectJoinListDelete(ProjectJoinList projectJoinList) {
		sqlSession.delete(namespace + ".projectJoinListDelete", projectJoinList);
	}
	
	@Override
	public void projectListDelete(int projectListNo) {
		sqlSession.delete(namespace + ".projectListDelete", projectListNo);
	}

	@Override
	public void dashBoardDelete(DashBoard dashBoard) {
		sqlSession.delete(namespace + ".dashBoardDelete", dashBoard);
	}


}
