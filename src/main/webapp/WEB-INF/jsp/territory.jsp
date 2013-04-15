<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Territory Page</title>
        <link href="css/evolution.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1>Territory</h1>

        <div id="territory">
            Territory age: ${territoryAge}
            <table>
                <c:forEach var="line" items="${terra}">
                    <tr>
                        <c:forEach var="item" items="${line}">
                            <c:choose>
                                <c:when test="${item != null}">
                                    <c:choose>
                                        <c:when test="${not empty item.plant}">
                                            <c:choose>
                                                <c:when test="${item.plant.plantName eq 'Cactus'}">
                                                    <td class="cactus">C</td>
                                                </c:when>
                                                <c:when test="${item.plant.plantName eq 'Antiaris'}">
                                                    <td class="antiaris">A</td>
                                                </c:when>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${fn:length(item.cactusSeeds) > 0 || fn:length(item.antiarisSeeds) > 0}">
                                            <c:choose>
                                                <c:when test="${fn:length(item.cactusSeeds) gt fn:length(item.antiarisSeeds)}">
                                                    <td class="cactus-seed">${fn:length(item.cactusSeeds)}/${fn:length(item.antiarisSeeds)}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="antiaris-seed">${fn:length(item.cactusSeeds)}/${fn:length(item.antiarisSeeds)}</td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
            Statistic:
            <table>
                <c:forEach var="item" items="${statistic}">
                    <tr>
                        <td>${item.key}</td><td>${item.value}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>