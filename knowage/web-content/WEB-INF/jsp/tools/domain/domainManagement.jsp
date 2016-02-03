<%@ page language="java" pageEncoding="utf-8" session="true"%>


<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA IMPORTS															--%>
<%-- ---------------------------------------------------------------------- --%>

<%@include file="/WEB-INF/jsp/commons/angular/angularResource.jspf"%>

<!doctype html>
<html ng-app="domainManagementApp">

<head>
	<%@include file="/WEB-INF/jsp/commons/angular/angularImport.jsp"%>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/src/angular_1.4/tools/domain/domainManagement.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/commons/css/generalStyle.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/domain/css/domainStyle.css">
</head>

<body>
	<div ng-controller="Controller as ctrl" layout="column">
		<div flex="20">
			<md-toolbar class="md-knowage-theme ">
			    <div class="md-toolbar-tools">
			      <h2 class="md-flex">Domain Management</h2>
			    </div>
			 </md-toolbar>
			 
			 <div class="h100 buttonsContainer">
					<md-button class="md-raised md-ExtraMini" ng-click="addRow()">{{translate.load("sbi.generic.add")}}</md-button>
					<md-button 	class="md-raised md-ExtraMini" ng-click="deleteRow()">{{translate.load("sbi.generic.delete")}}</md-button>
					<md-button 	class="md-raised md-ExtraMini" ng-click="editRow()">{{translate.load("sbi.generic.update2")}}</md-button>
			 </div>
			<br>
		</div>
		<md-content flex="80" layout="row">
            <md-content style="max-height:{{gridHeight}}; ">
				<angular-table 
					id="table" ng-model="data" 
					columns='["valueCd","valueName","domainCode","domainName","valueDescription"]'
					columns-search='["valueCd","valueName","domainCode","domainName","valueDescription"]'
					highlights-selected-item = "true"
					show-search-bar="true"
					no-pagination="true"
					selected-item="itemSelected"
				></angular-table>
			</md-content>
		</md-content>	
	</div>
</body>
</html>