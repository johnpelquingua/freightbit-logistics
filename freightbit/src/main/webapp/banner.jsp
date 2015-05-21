<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="true" %>

<ul class="nav navbar-nav navbar-right navbar-user">

    <li class="dropdown messages-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-question-circle"></i> Help
            <b class="caret"></b></a>
        <ul class="dropdown-menu" style="min-width: 130px;">

            <li class="message-preview">
                <a href="/help/help.jsp">
                    <li><a href="/help/help.jsp"><i class="fa fa-question-circle"></i> Help Center</a></li>

                </a>
            </li>

        </ul>

    </li>

    <li class="dropdown messages-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><div class="noti_bubble" id="n1" style="visibility: hidden;"><s:property value="%{AllNotification}"></s:property></div><i class="fa fa-exclamation-circle"></i> Notifications
            <b class="caret"></b></a>
        <ul class="dropdown-menu" style="min-width: 150px;">

            <li class="message-preview">
                <a href="#">
                    <span class="message" style="text-align: center;"><a href="../home"><i class="fa fa-exclamation-circle"></i> <s:property value="%{AllNotification}"></s:property> Notifications</a></span>
                </a>
            </li>

        </ul>
    </li>

    <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:out value="${sessionScope.loggedinUser}"/><b
                class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../core/viewUserProfile"><i class="fa fa-user"></i> Edit Profile</a></li>
             <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="../core/loadGeneralSettings"><i class="fa fa-gear"></i> General Settings</a></li>
            </sec:authorize>
            <li class="divider"></li>
            <li><a href="<c:url value='j_spring_security_logout'/>"> <i class="fa fa-power-off"></i> Log Out</a></li>
        </ul>
    </li>
</ul>