<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setAttribute("pageTitle", "Tableau de Bord"); %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin - Taxi</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/css/admin-style.css" rel="stylesheet" />
</head>
<body>
    <!-- Include Sidebar -->
    <jsp:include page="../includes/sidebar.jsp" />
    
    <!-- Include Header -->
    <jsp:include page="../includes/header.jsp" />
    
    <!-- Main Content - Dynamique -->
    <div class="main-content">
        <div class="container-fluid">
            <c:choose>
                <c:when test="${currentPage == 'dashboard'}">
                    <jsp:include page="../content/dashboard-content.jsp" />
                </c:when>
                <c:when test="${currentPage == 'vehicule-create'}">
                    <jsp:include page="../content/vehicule-create.jsp" />
                </c:when>
                <c:when test="${currentPage == 'vehicule-list'}">
                    <jsp:include page="../content/vehicule-list.jsp" />
                </c:when>
                <c:when test="${currentPage == 'chauffeur-create'}">
                    <jsp:include page="../content/chauffeur-create.jsp" />
                </c:when>
                <c:when test="${currentPage == 'chauffeur-list'}">
                    <jsp:include page="../content/chauffeur-list.jsp" />
                </c:when>
                <c:otherwise>
                    <jsp:include page="../content/dashboard-content.jsp" />
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle sidebar on mobile
        document.getElementById('sidebarToggle')?.addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
        });
    </script>
</body>
</html>