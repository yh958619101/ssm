package service;

import java.util.HashMap;
import java.util.List;

import model.Test;
import model.User;

public interface UserService {
public String login(String username, String password);

public List<Test> selectAllContainAddress();

public List<Test> findSome(HashMap<String, Object> map);

public List<User> usershow();

}
