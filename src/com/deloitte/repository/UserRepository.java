package com.deloitte.repository;

import java.util.HashMap;
import java.util.Map;

import com.deloitte.domain.User;

public class UserRepository {
	
	private static UserRepository instance;
	private Map<String, User> userMap = new HashMap<String, User>();
	
	// private List<User> users = new ArrayList<User>();
	private int userIdCounter = 0;
	
	public UserRepository() {}
	
	static {
		try {
			instance = new UserRepository();
		} catch (Exception e) {
			throw new RuntimeException("Exception while creating a singleton instace.");
		}
	}

	public static UserRepository getInstance() {
		return instance;
	}
	
	public Map<String, User> getUserMap() {
		return userMap;
	}
	
	public void creareUser(String name, String login, String password) {
		User tmpUser = new User(userIdCounter++, name, login, password);
		// System.out.println("Criando User:");
		// System.out.println(" login: " + login);
		// System.out.println(" User: " + tmpUser.toString());
		this.userMap.put(login, tmpUser);
		// System.out.println("Usuário inserido: " + tmpUser.toString());
	}
	
	public User getUserByLogin(String login) {
		// System.out.println(" Buscar por Login: " + login);
		if(userMap.size() < 1) {
			return null;
		}
		/*
		for(Map.Entry<String, User> pair : this.userMap.entrySet()) {
			System.out.println(" key : " + pair.getKey());
		    System.out.println(" Value : " + pair.getValue());
		}
		*/
		User user = this.userMap.get(login);
		if(user.getLogin() == null) {
			return null;
		}else {
			return user;
		}
	}

}
