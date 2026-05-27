package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

@Controller
public class TodoController {

	private TodoRepository todoRepository;

	public TodoController(TodoRepository todoRepository) {
		super();
		this.todoRepository = todoRepository;
	}

	@RequestMapping("list-todos")
	public String listAllTodos(HttpSession session, ModelMap model) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		List<Todo> todos = todoRepository.findByUsername(username);
		model.addAttribute("todos", todos);
		return "listTodos";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.GET)
	public String showNewTodoPage(HttpSession session, ModelMap model) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		Todo todo = new Todo(0, username, "", LocalDate.now().plusYears(1), false);
		model.addAttribute("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.POST)
	public String addNewTodo(HttpSession session, ModelMap model, @Valid Todo todo, BindingResult result) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		if (result.hasErrors()) {
			return "todo";
		}
		todo.setUsername(username);
		todoRepository.save(todo);
		return "redirect:list-todos";
	}

	@RequestMapping("delete-todo")
	public String deleteTodo(HttpSession session, @RequestParam int id) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		todoRepository.deleteById(id);
		return "redirect:list-todos";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.GET)
	public String showUpdateTodoPage(HttpSession session, @RequestParam int id, ModelMap model) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		Todo todo = todoRepository.findById(id).orElse(null);
		model.addAttribute("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.POST)
	public String updateTodo(HttpSession session, ModelMap model, @Valid Todo todo, BindingResult result) {
		String username = getLoggedInUsername(session);
		if (username == null) {
			return "redirect:login";
		}
		if (result.hasErrors()) {
			return "todo";
		}
		todo.setUsername(username);
		todoRepository.save(todo);
		return "redirect:list-todos";
	}

	private String getLoggedInUsername(HttpSession session) {
		return (String) session.getAttribute("name");
	}
}
