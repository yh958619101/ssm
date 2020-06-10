package dao;
import java.util.HashMap;
import java.util.List;
import model.Test;
import model.User;
public interface UserDao {
public List<User> show();

public List<Test> findOneToOne();
public List<Test> findSome(HashMap<String, Object> map);

public List<User> usershow();
}
