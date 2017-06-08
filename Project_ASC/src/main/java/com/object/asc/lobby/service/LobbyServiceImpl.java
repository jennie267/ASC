package com.object.asc.lobby.service;


import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;
import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.service.UserService;
import com.object.asc.util.UploadFileUtils;

@Service
public class LobbyServiceImpl implements LobbyService {
	
	@Inject
	private UserDAO userDao; 
	
	@Inject
	private LobbyDAO lobbyDao;
	
	@Inject
	private ProjectDAO projectDao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	/** 
	 * 파라미터로 받아야 할것
	 * 1. ProjectList
	 * 2. MultipartFile
	 * 3. 프로젝트 참여 인원
	 * */
	@Transactional
	@Override
	public void projectRegister(ProjectList projectList, MultipartFile file, String[] invitationList) {
		String savePath = "";
		try {
			savePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		/** 프로젝트 생성 시 */
		/** 1-1. 참여 생성 */
		lobbyDao.projectJoinRegister();
		/** 1-2. 참여 번호 조회 */
		ProjectJoin projectJoin = lobbyDao.getProjectJoinNo();
		int projectJoinNo = projectJoin.getProjectJoinNo();
		/** 1-3. 프로젝트 내역 생성 */
		UUID uuid = UUID.randomUUID();
		projectList.setProjectJoinNo(projectJoinNo);
		projectList.setProjectPhoto(file.getOriginalFilename());
		projectList.setChatName(projectJoinNo + "_" + uuid.toString());
		projectList.setChatContent(projectJoinNo + "_" + uuid.toString()+".txt");
		projectList.setProjectPhoto(savePath);
		lobbyDao.projectListRegister(projectList);
		/** 1-4. 참여 내역 생성 (초대) 
		 * status : 1 -> 스크럼마스터
		 * status : 0 -> 팀원
		 * */
		int invitationIndex = 0;
		for (String invitation : invitationList) {
			if(invitationIndex == 0){ // 스크럼
				ProjectJoinList projectJoinList = new ProjectJoinList();
				projectJoinList.setProjectJoinNo(projectJoinNo);
				projectJoinList.setUserNo(userDao.userIdFind(invitation));
				projectJoinList.setStatus(1); // 스크럼
				lobbyDao.projectJoinListRegister(projectJoinList);
				invitationIndex++;
			}else{
				ProjectJoinList projectJoinList = new ProjectJoinList();
				projectJoinList.setProjectJoinNo(projectJoinNo);
				projectJoinList.setUserNo(userDao.userIdFind(invitation)); 
				projectJoinList.setStatus(0); // 팀원
				lobbyDao.projectJoinListRegister(projectJoinList);
			}
		}
		
		/** 1-5. 대쉬보드 생성(회원 전부) */

		for (String invitation : invitationList) {
			DashBoard dashBoard = new DashBoard();
			dashBoard.setProjectListNo(projectJoinNo);
			dashBoard.setUserNo(userDao.userIdFind(invitation)); 
			dashBoard.setMemo("환영합니다!");
			projectDao.dashBoardRegister(dashBoard);
		}
		/** 1-5. 릴리즈 생성, 자료실 생성
		 *  간트차트 생성, 계획 실행 차트 생성, 
		 *  스크럼 생성 
		 *  */
		ProjectRelease projectRelease = new ProjectRelease();
		projectRelease.setProjectListNo(projectJoinNo);
		projectDao.projectReleaseRegister(projectRelease);
		GanttChart ganttChart = new GanttChart();
		ganttChart.setProjectListNo(projectJoinNo);
		projectDao.ganttChartRegister(ganttChart);
		ActionChart actionChart = new ActionChart();
		actionChart.setProjectListNo(projectJoinNo);
		projectDao.actionChartRegister(actionChart);
		Scrum scrum = new Scrum();
		scrum.setProjectListNo(projectJoinNo);
		projectDao.scrumRegister(scrum);
		/** 1-6. 스프린트 생성
		 * 1. start_date에는 프로젝트 시작날짜 들어감
		 * 2. end_date는 null
		 * */
		Sprint sprint = new Sprint();
		sprint.setScrumNo(projectJoinNo);
		sprint.setStartDate(projectList.getStartDate());
		projectDao.sprintRegister(sprint);
		
	    /** 1-7. 자료실 생성*/
	    Library library = new Library();
	    library.setProjectListNo(projectJoinNo);
	    projectDao.libraryRegister(library);
		
		
	}
	
	@Override
	public ProjectList projectDate(int projectListNo) {
		return lobbyDao.projectDate(projectListNo);
	}

	@Override
	public List<ProjectList> projectListAll() {
		return lobbyDao.projectListAll();
	}

	@Override
	public int memberCount(int projectJoinNo) {
		return lobbyDao.memberCount(projectJoinNo);
	}

	@Override
	public List<String> memberName(int projectListNo) {
		return lobbyDao.memberName(projectListNo);
	}

}
