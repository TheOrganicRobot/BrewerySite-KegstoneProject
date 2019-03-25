<%@ include file="/WEB-INF/jsp/header.jsp"%>

<c:url var="imgUrl" value="/image/testImage" />
<img src="${imgUrl}" />

<c:if test="${not empty message}">
    ${message} 
</c:if>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
