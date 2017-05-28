<%@ page contentType="text/html; charset=utf-8" %>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ASC</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.vertical-tabs.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css/metisMenu.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="/resources/css/morris.css" rel="stylesheet">
    <!-- Main CSS -->
<!--     <link href="/resources/css/main.css" rel="stylesheet"> -->
<!--     <link href="/resources/css/reset.css" rel="stylesheet"> -->
    <!-- Custom Fonts -->
    <link href="/resources/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Gantt Chart CSS -->
    <link href="/resources/css/gantt/gantt.css" rel="stylesheet" type="text/css">
    <!-- Donut CSS -->
    <link href="/resources/css/dashBoard/simple-donut.css" rel="stylesheet">
    <!-- Calendar CSS -->
    <link href="/resources/css/dashBoard/fullcalendar.css" rel="stylesheet">
    
      <!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/metisMenu.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="/resources/js/raphael.js"></script>
    <%-- <script src="/resources/js/morris.js"></script>
    <script src="/resources/js/morris-data.js"></script> --%>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>
    <!-- Gantt Chart JavaScript -->
    <script src="/resources/js/gantt/jquery.fn.gantt.js"></script>
    <!-- Donut JavaScript -->
    <script src="/resources/js/dashBoard/simple-donut-jquery.js"></script>
    <!-- Calendar JavaScript -->
    <script src="/resources/js/dashBoard/fullcalendar.js"></script>
  
</head>
<body>
<div id="wrapper">
   <div id="header">
      <tiles:insertAttribute name="header" />
   </div>
   <div id="content">
      <tiles:insertAttribute name="content" />
   </div>
   <div id="footer">
      <tiles:insertAttribute name="footer" />
   </div>
</div>
</body>

</html>
