// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package com.example;

import java.util.ArrayList;
import java.util.Map;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TodoController {

  // In memory list of todos (eg, no database)
  ArrayList<Todo> todos = new ArrayList<Todo>();

  // Get all todos
  @GetMapping("/api/todos")
  public ArrayList<Todo> list_todos() {
    return todos;
  }

  /**
   * Create a todo with a title and (optionally) done.
   */
  @PostMapping("/api/todos")
  public Todo create_todo(@RequestBody Map<String, Object> payload) {
    String title = payload.getOrDefault("title", "").toString();
    Boolean done = payload.getOrDefault("done", "false").toString().equalsIgnoreCase("true");

    Todo newTodo = new Todo(title, done);
    todos.add(newTodo);
    return newTodo;
  }

  /**
   * Get a specific Todo from its ID.
   */
  @GetMapping("/api/todos/{id}")
  public Todo get_todo(@PathVariable(value = "id") String id) {
    return getTodo(id);
  }

  /**
   * Update a specific Todo from its ID.
   */
  @PutMapping("/api/todos/{id}")
  public Todo update_todo(
      @PathVariable(value = "id") String id, @RequestBody Map<String, Object> payload) {
    Todo todo = getTodo(id);

    if (payload.containsKey("title")) {
      String title = payload.getOrDefault("title", "").toString();
      todo.setTitle(title);
    }

    if (payload.containsKey("done")) {
      Boolean done = payload.getOrDefault("done", "false").toString().equalsIgnoreCase("true");
      todo.setDone(done);
    }

    return todo;
  }

  /**
   * Delete a specific Todo from its ID.
   */
  @DeleteMapping("/api/todos/{id}")
  public Todo delete_todo(@PathVariable(value = "id") String id) {
    Todo todo = getTodo(id);
    todos.remove(todo);
    return todo;
  }

  /**
   * Private method for getting a todo from our
   * in memory list with a specific ID.
   */
  private Todo getTodo(String guid) {
    for (Todo todo : todos) {
      if (todo.getId().equals(guid)) {
        return todo;
      }
    }

    throw new TodoNotFoundException();
  }

  /**
  * Default url '/'
  */
  @GetMapping("/")
  public String healthCheck() {
    return "here";
  }

  /**
  * Default url '/api'
  */
  @GetMapping("/api")
  public String baseURL() {
    return "base url";
  }

}
