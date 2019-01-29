package com.deloitte.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class User {
	
	private Integer userId;
	private String name;
	private String login;
	private String password;
	private Map<Integer, Task> taskMap = new HashMap<Integer, Task>();
	private Date createdAt;
	
	private int taskIdCounter = 0;

	public User(Integer userId, String name, String login, String password) {
		this.userId = userId;
		this.name = name;
		this.login = login;
		this.password = password;
		this.createdAt = new Date();
	}

	public Integer getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}

	public String getLogin() {
		return login;
	}

	public String getPassword() {
		return password;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public Map<Integer, Task> getTaskMap() {
		return taskMap;
	}

	public void insertTask(String title, String description) {
		int taskId = taskIdCounter++;
		Date createdAt = new Date();
		Date updatedAt = new Date();
		Task tmpTask = new Task(taskId, title, description, createdAt, updatedAt);
		taskMap.put(taskId, tmpTask);
	}
	
	public void updateTask(Integer taskId, String title, String description) {
		Task taskUpdated = taskMap.remove(taskId);
		taskUpdated.setTitle(title);
		taskUpdated.setDescription(description);
		// taskUpdated.setCreatedAt(new Date(createdAt));
		taskUpdated.setUpdatedAt(new Date());
		taskMap.put(taskId, taskUpdated);
	}
	
	public boolean removeTask(Integer taskId) {
		Task tmpUser = this.taskMap.remove(taskId);
		if(!tmpUser.getTaskId().equals(null)) {
			return true;
		}else {
			return false;
		}
	}
	
	public void checkTaskStatus(Integer taskId) {
		Task taskChecked = taskMap.remove(taskId);
		if (taskChecked.isStatus() ) {
			taskChecked.setStatus(false);
		}else {
			taskChecked.setStatus(true);
		}
		taskMap.put(taskId, taskChecked);
	}

	public int pendingTasks() {
		int cont = 0;
		for (Integer key : taskMap.keySet()) {
			Task t = taskMap.get(key);
			if(!t.isStatus()) {
				cont++;
			}
		}
		return cont;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", login=" + login + ", password=" + password
				+ ", taskMap=" + taskMap + ", createdAt=" + createdAt + ", taskIdCounter=" + taskIdCounter + "]";
	}
	
	
}
