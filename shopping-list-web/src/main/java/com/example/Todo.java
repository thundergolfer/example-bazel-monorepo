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

import java.util.UUID;

// Class for Todo resource
// id: UUID (auto generated)
// title: String
// done: Boolean

public class Todo {

  private final String id;
  private String title;
  private Boolean done;

  /**
   * Todo class with title (string) and done (boolean).
   */
  public Todo(String title, Boolean done) {
    this.id = genId();
    this.title = title;
    this.done = done;
    if (this.done == null) {
      this.done = false;
    }
  }

  public String getId() {
    return id;
  }

  public String getTitle() {
    return title;
  }

  public String setTitle(String title) {
    this.title = title;
    return this.title;
  }

  public Boolean getDone() {
    return done;
  }

  public Boolean setDone(Boolean done) {
    this.done = done;
    return this.done;
  }

  private String genId() {
    return UUID.randomUUID().toString();
  }
}
