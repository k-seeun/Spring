package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.TodoDTO;
import com.example.demo.service.TodoService;


@Controller
public class TodoController {
	
	@Autowired
	private TodoService todoService;
	
	@GetMapping("/todo")
	public String showTodoPage(Model model) {
		List<TodoDTO> todoList = todoService.getAllTodo();
		model.addAttribute("todoList", todoList);
		return "todo";
	}
	
	@PostMapping("/todo")
	public String addTodo (@RequestParam("task") String task) {
		TodoDTO todo = new TodoDTO();
		todo.setTask(task);
		todoService.InsertTodo(todo);
		return "redirect:/todo";
	}
}
