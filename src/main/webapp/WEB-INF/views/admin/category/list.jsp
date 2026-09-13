<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý Danh Mục</title>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h3 class="text-primary fw-bold">
			<i class="bi bi-tags"></i> Danh Sách Danh Mục
		</h3>
		<a href="/admin/categories/create" class="btn btn-success"><i
			class="bi bi-plus-circle"></i> Thêm mới Danh Mục</a>
	</div>

	<c:if test="${not empty successMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			${successMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>
	<c:if test="${not empty errorMsg}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			${errorMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>

	<!-- Form tìm kiếm -->
	<div class="card mb-3 shadow-sm">
		<div class="card-body">
			<form action="/admin/categories" method="get" class="row g-2">
				<div class="col-md-9">
					<input type="text" name="keyword" class="form-control"
						placeholder="Nhập tên danh mục cần tìm..." value="${keyword}">
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary w-100">
						<i class="bi bi-search"></i> Tìm kiếm
					</button>
					<a href="/admin/categories" class="btn btn-secondary"><i
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
						<th style="width: 80px;">ID</th>
						<th>Tên Danh Mục</th>
						<th>Mô Tả</th>
						<th style="width: 130px;">Trạng Thái</th>
						<th style="width: 160px;" class="text-center">Thao Tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${categories}">
						<tr>
							<td>${c.id}</td>
							<td class="fw-bold">${c.name}</td>
							<td>${c.description}</td>
							<td><c:choose>
									<c:when test="${c.status}">
										<span class="badge bg-success">Hoạt động</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-secondary">Khóa</span>
									</c:otherwise>
								</c:choose></td>
							<td class="text-center"><a
								href="/admin/categories/edit/${c.id}"
								class="btn btn-sm btn-warning me-1"><i
									class="bi bi-pencil-square"></i> Sửa</a> <a
								href="/admin/categories/delete/${c.id}"
								class="btn btn-sm btn-danger"
								onclick="return confirm('Bạn có chắc chắn muốn xóa?')"><i
									class="bi bi-trash"></i> Xóa</a></td>
						</tr>
					</c:forEach>
					<c:if test="${empty categories}">
						<tr>
							<td colspan="5" class="text-center text-muted py-4">Không
								tìm thấy dữ liệu phù hợp!</td>
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
					(Tổng: ${totalItems} dòng)
				</span>
				<ul class="pagination mb-0">
					<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
						class="page-link"
						href="/admin/categories?page=${currentPage - 1}&keyword=${keyword}&size=${size}">Trước</a>
					</li>
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}"><a
							class="page-link"
							href="/admin/categories?page=${i}&keyword=${keyword}&size=${size}">${i}</a>
						</li>
					</c:forEach>
					<li
						class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
						<a class="page-link"
						href="/admin/categories?page=${currentPage + 1}&keyword=${keyword}&size=${size}">Sau</a>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>