<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý Người Dùng</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h3 class="text-primary fw-bold">
			<i class="bi bi-people"></i> Danh Sách Người Dùng
		</h3>
		<a href="/admin/users/create" class="btn btn-success"><i
			class="bi bi-person-plus"></i> Thêm mới Người Dùng</a>
	</div>

	<c:if test="${not empty successMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			${successMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>

	<!-- Search box -->
	<div class="card mb-3 shadow-sm">
		<div class="card-body">
			<form action="/admin/users" method="get" class="row g-2">
				<div class="col-md-9">
					<input type="text" name="keyword" class="form-control"
						placeholder="Tìm theo username, email, họ tên..."
						value="${keyword}">
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary w-100">
						<i class="bi bi-search"></i> Tìm kiếm
					</button>
					<a href="/admin/users" class="btn btn-secondary"><i
						class="bi bi-arrow-clockwise"></i> Reset</a>
				</div>
			</form>
		</div>
	</div>

	<!-- Table -->
	<div class="card shadow-sm">
		<div class="table-responsive">
			<table class="table table-hover table-bordered align-middle mb-0">
				<thead class="table-dark">
					<tr>
						<th style="width: 70px;">ID</th>
						<th>Username</th>
						<th>Họ và Tên</th>
						<th>Email</th>
						<th>Vai Trò</th>
						<th>Trạng Thái</th>
						<th style="width: 160px;" class="text-center">Thao Tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${users}">
						<tr>
							<td>${u.id}</td>
							<td class="fw-bold">${u.username}</td>
							<td>${u.fullname}</td>
							<td>${u.email}</td>
							<td><span class="badge bg-info text-dark">${u.role}</span></td>
							<td><c:choose>
									<c:when test="${u.enabled}">
										<span class="badge bg-success">Hoạt động</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-danger">Khóa</span>
									</c:otherwise>
								</c:choose></td>
							<td class="text-center"><a href="/admin/users/edit/${u.id}"
								class="btn btn-sm btn-warning me-1"><i
									class="bi bi-pencil-square"></i> Sửa</a> <a
								href="/admin/users/delete/${u.id}" class="btn btn-sm btn-danger"
								onclick="return confirm('Bạn có chắc muốn xóa?')"><i
									class="bi bi-trash"></i> Xóa</a></td>
						</tr>
					</c:forEach>
					<c:if test="${empty users}">
						<tr>
							<td colspan="7" class="text-center text-muted py-4">Không có
								dữ liệu người dùng!</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<!-- Phân trang -->
		<c:if test="${totalPages > 0}">
			<div
				class="card-footer d-flex justify-content-between align-items-center bg-white">
				<span>Trang <strong>${currentPage}</strong> / <strong>${totalPages}</strong>
					(Tổng: ${totalItems} người dùng)
				</span>
				<ul class="pagination mb-0">
					<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
						class="page-link"
						href="/admin/users?page=${currentPage - 1}&keyword=${keyword}&size=${size}">Trước</a>
					</li>
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}"><a
							class="page-link"
							href="/admin/users?page=${i}&keyword=${keyword}&size=${size}">${i}</a>
						</li>
					</c:forEach>
					<li
						class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
						<a class="page-link"
						href="/admin/users?page=${currentPage + 1}&keyword=${keyword}&size=${size}">Sau</a>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>