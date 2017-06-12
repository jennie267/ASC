<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<style>
.modifyIcon {
	color: green;
	margin: 3%;
	display: inline-block;
}

#deleteIcon {
	color: red;
	margin: 3%;
	display: inline-block;
}

#newProject {
	color: black;
	background-color: white;
}
</style>
<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
        <br> <img alt="" src="/resources/images/header/lobby.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
      </div>
   </div>

   <div class="row">
      <div class=" col-xs-2 col-xs-offset-10">
         <div class="panel-nothing" style="width: 140px;">
            <div class="panel-heading">
               <div class="row">
                  <div class="text-center" style="font-size: 20%;">
                     <a id="newProject" class="btn btn-default btn-lg" data-toggle="modal" data-target="#createProjectModal"> 새 프로젝트 <i class="fa fa-plus-circle"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="row">
   <c:choose>
      <c:when test="${empty list }">
               <div style="margin-top: 10%">
                  <p style="text-align: center; font-size: 20px"> <mark>프로젝트를 생성해주세여</mark></p>
               </div>
      </c:when>
      <c:otherwise>
         <c:forEach items="${list}" var="projectList" varStatus="status">
         <div class="project-wrapper">
            <div class="col-lg-3 col-md-3 col-xs-4">
            <a href="/project/dashBoard/${projectList.projectListNo}/${login.userNo}" class="thumbnail"> 
            <img src="/resources/images/upload${projectList.projectPhoto}" onerror='this.src="/resources/images/file.png"'>
               </a>
               <div class="panel">
                  <div style="font-size: 17px; font-weight: bold;">스크럼 마스터 : ${name[status.index]}</div>
                  <div class="text-right">${projectList.startDate}~${projectList.endDate}</div>
                  <br>
                  <div class="text-right" style="font-size: 15px;">
                     ${projectList.projectName}&nbsp; <i class="fa fa-child"></i>${count[status.index]}
                  </div>
                  <br>
                  <div class="text-center" style="font-size: 15px;">
                    ${projectList.content}
                  </div>
                  <br>
                  <c:if test="${id[status.index] == login.id}">
                  <div class="text-right">
                     <input type="hidden" id="projectListNo" value="${projectList.projectListNo}">
                     <a href="#" class="fa fa-pencil modifyIcon">수정</a> 
                     <a href="/lobby/deleteProject?projectListNo=${projectList.projectListNo}" id="deleteIcon" class="fa fa-trash-o">삭제</a>
                  </div>
                  </c:if>
               </div>
            </div>
          </div>
         </c:forEach>
      </c:otherwise>
   </c:choose>
   
      
   </div>
</div>
<!-- /#page-wrapper -->
<!-- Modal -->
<jsp:include page="include/createProjectModal.jsp" />
<jsp:include page="include/modifyProjectModal.jsp" />



