package serviceimpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import dao.UserDao;
import model.Test;
import model.User;
import service.UserService;
import util.SqlSessionFactoryUtil;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao UserDao;
	static Logger logger = Logger.getLogger(UserServiceImpl.class);
	// 事务属性
	@Resource
	private TransactionTemplate transactionTemplate;
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
// 查
	public List<User> show() {
		List<User> list = UserDao.show();
		return list;
	}
	// 登录
	public String login(String username, String password) {
		//System.out.println("2"+username);
		//System.out.println("2"+password);
		List<User> list = this.show();
		//System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUsername().equals(username)) {
				if (list.get(i).getPassword().equals(password)) {
					return username;
				}
			}
		}
		return null;
	}
	@Override
	public List<Test> selectAllContainAddress() {
		List<Test> list = UserDao.findOneToOne();
		return list;
	}
	@Override
	public List<Test> findSome(HashMap<String, Object> map) {
		List<Test> list = UserDao.findSome(map);
		return list;
	}
	@Override
	public List<User> usershow() {
		List<User>  list=UserDao.usershow();
		return  list;
	}

}
