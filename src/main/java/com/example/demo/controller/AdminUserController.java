package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/users")
public class AdminUserController {

    @Autowired
    private UserService userService;

    // Danh sách User kèm tìm kiếm & phân trang
    @GetMapping
    public String listUsers(
            @RequestParam(name = "keyword", defaultValue = "") String keyword,
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "size", defaultValue = "5") int size,
            Model model) {
        
        Page<User> userPage = userService.searchAndPaginate(keyword, page, size);
        
        model.addAttribute("users", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("totalItems", userPage.getTotalElements());
        model.addAttribute("keyword", keyword);
        model.addAttribute("size", size);
        return "admin/user/list";
    }

    // Hiển thị form thêm mới
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/form";
    }

    // Hiển thị form sửa
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
        User user = userService.findById(id);
        if (user == null) {
            ra.addFlashAttribute("errorMsg", "Không tìm thấy người dùng!");
            return "redirect:/admin/users";
        }
        model.addAttribute("user", user);
        return "admin/user/form";
    }

    // Lưu người dùng
    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user, RedirectAttributes ra) {
        userService.save(user);
        ra.addFlashAttribute("successMsg", "Lưu thông tin người dùng thành công!");
        return "redirect:/admin/users";
    }

    // Xóa người dùng
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id, RedirectAttributes ra) {
        userService.delete(id);
        ra.addFlashAttribute("successMsg", "Đã xóa người dùng thành công!");
        return "redirect:/admin/users";
    }
}