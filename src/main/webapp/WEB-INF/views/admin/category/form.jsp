<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${empty category.id ? 'Thêm mới' : 'Cập nhật'}Danh Mục</title>
</head>
<body>
	<div class="card shadow-sm col-md-8 mx-auto">
		<div class="card-header bg-primary text-white">
			<h5 class="mb-0">${empty category.id ? 'Thêm mới' : 'Cập nhật'}
				Danh Mục</h5>
		</div>
		<div class="card-body">
			<form action="/admin/categories/save" method="post">
				<input type="hidden" name="id" value="${category.id}" />

				<div class="mb-3">
					<label class="form-label fw-bold">Tên Danh Mục <span
						class="text-danger">*</span></label> <input type="text" name="name"
						class="form-control" value="${category.name}" required
						placeholder="Ví dụ: Thiết bị điện tử...">
				</div>

				<div class="mb-3">
					<label class="form-label">Mô Tả</label>
					<textarea name="description" class="form-control" rows="3"
						placeholder="Nhập mô tả">${category.description}</textarea>
				</div>

				<div class="mb-3 form-check">
					<input type="checkbox" name="status" class="form-check-input"
						id="status" value="true"
						${category.status || empty category.id ? 'checked' : ''}>
					<label class="form-check-label" for="status">Kích hoạt hoạt
						động</label>
				</div>

				<div class="d-flex gap-2">
					<button type="submit" class="btn btn-success">
						<i class="bi bi-check-circle"></i> Lưu dữ liệu
					</button>
					<a href="/admin/categories" class="btn btn-secondary"><i
						class="bi bi-x-circle"></i> Quay lại</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>