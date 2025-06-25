package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.TodoMapper;
import com.example.demo.model.TodoDTO;

@Service
public class TodoService {
	@Autowired
	private TodoMapper todoMapper;
	
	public List<TodoDTO> getAllTodo(){
		return todoMapper.getAllTodo();
	}
	public int InsertTodo(TodoDTO todoDTO) {
		return todoMapper.InsertTodo(todoDTO);
	}
}
