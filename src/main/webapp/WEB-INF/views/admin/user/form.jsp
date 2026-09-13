<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${empty user.id ? 'Thêm mới' : 'Cập nhật'} Người Dùng</title>
</head>
<body>
    <div class="card shadow-sm col-md-8 mx-auto">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">${empty user.id ? 'Thêm mới' : 'Cập nhật'} Người Dùng</h5>
        </div>
        <div class="card-body">
            <form action="/admin/users/save" method="post">
                <input type="hidden" name="id" value="${user.id}"/>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Tên đăng nhập (Username) <span class="text-danger">*</span></label>
                        <input type="text" name="username" class="form-control" value="${user.username}" required ${not empty user.id ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Mật khẩu <span class="text-danger">*</span></label>
                        <input type="password" name="password" class="form-control" value="${user.password}" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Họ và Tên <span class="text-danger">*</span></label>
                        <input type="text" name="fullname" class="form-control" value="${user.fullname}" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Email <span class="text-danger">*</span></label>
                        <input type="email" name="email" class="form-control" value="${user.email}" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Vai trò (Role)</label>
                        <select name="role" class="form-select">
                            <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Quản trị viên (ADMIN)</option>
                            <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>Người dùng (USER)</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3 d-flex align-items-center">
                        <div class="form-check mt-3">
                            <input type="checkbox" name="enabled" class="form-check-input" id="enabled" value="true" ${user.enabled || empty user.id ? 'checked' : ''}>
                            <label class="form-check-label fw-bold" for="enabled">Kích hoạt tài khoản</label>
                        </div>
                    </div>
                </div>

                <div class="d-flex gap-2 mt-2">
                    <button type="submit" class="btn btn-success"><i class="bi bi-check-circle"></i> Lưu thông tin</button>
                    <a href="/admin/users" class="btn btn-secondary"><i class="bi bi-x-circle"></i> Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>