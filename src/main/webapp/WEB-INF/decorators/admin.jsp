<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><sitemesh:write property='title' /> - Admin Panel</title>
<!-- Bootstrap 5 CSS & Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">
<style>
body {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	background-color: #f4f6f9;
}

.sidebar {
	min-height: calc(100vh - 56px);
	background: #212529;
}

.sidebar .nav-link {
	color: #cfd4da;
	margin-bottom: 4px;
	border-radius: 6px;
}

.sidebar .nav-link:hover, .sidebar .nav-link.active {
	color: #fff;
	background: #0d6efd;
}

footer {
	margin-top: auto;
}
</style>
<sitemesh:write property='head' />
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top border-bottom border-secondary">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="/admin/categories"><i
				class="bi bi-shield-check text-primary"></i> ADMIN SYSTEM</a>
			<div class="d-flex align-items-center text-white">
				<i class="bi bi-person-circle fs-5 me-2 text-info"></i> <span>Xin
					chào, <strong>Admin</strong>
				</span>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<nav class="col-md-3 col-lg-2 d-md-block sidebar py-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link"
						href="/admin/categories"> <i class="bi bi-tags-fill me-2"></i>
							Quản lý Category
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/users">
							<i class="bi bi-people-fill me-2"></i> Quản lý User
					</a></li>
				</ul>
			</nav>

			<!-- Main Body chèn bởi SiteMesh -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
				<sitemesh:write property='body' />
			</main>
		</div>
	</div>

	<footer class="bg-white text-center py-3 border-top text-muted">
		<small>&copy; 2026 Quản trị hệ thống - Spring Boot & SiteMesh
			Decorator 3</small>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>