package com.example.demo.controller;

import com.example.demo.entity.Category;
import com.example.demo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoryController {

	@Autowired
	private CategoryService categoryService;

	// Danh sách Category kèm tìm kiếm & phân trang
	@GetMapping
	public String listCategories(@RequestParam(name = "keyword", defaultValue = "") String keyword,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "size", defaultValue = "5") int size, Model model) {

		Page<Category> categoryPage = categoryService.searchAndPaginate(keyword, page, size);

		model.addAttribute("categories", categoryPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", categoryPage.getTotalPages());
		model.addAttribute("totalItems", categoryPage.getTotalElements());
		model.addAttribute("keyword", keyword);
		model.addAttribute("size", size);
		return "admin/category/list";
	}

	// Hiển thị form thêm mới
	@GetMapping("/create")
	public String showCreateForm(Model model) {
		model.addAttribute("category", new Category());
		return "admin/category/form";
	}

	// Hiển thị form sửa
	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
		Category category = categoryService.findById(id);
		if (category == null) {
			ra.addFlashAttribute("errorMsg", "Không tìm thấy danh mục!");
			return "redirect:/admin/categories";
		}
		model.addAttribute("category", category);
		return "admin/category/form";
	}

	// Lưu danh mục
	@PostMapping("/save")
	public String saveCategory(@ModelAttribute("category") Category category, RedirectAttributes ra) {
		categoryService.save(category);
		ra.addFlashAttribute("successMsg", "Lưu danh mục thành công!");
		return "redirect:/admin/categories";
	}

	// Xóa danh mục
	@GetMapping("/delete/{id}")
	public String deleteCategory(@PathVariable("id") Long id, RedirectAttributes ra) {
		try {
			categoryService.delete(id);
			ra.addFlashAttribute("successMsg", "Đã xóa danh mục thành công!");
		} catch (Exception e) {
			ra.addFlashAttribute("errorMsg", "Không thể xóa danh mục này!");
		}
		return "redirect:/admin/categories";
	}
}