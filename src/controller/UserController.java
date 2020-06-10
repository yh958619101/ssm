package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.Test;
import model.User;
import service.UserService;
import serviceimpl.UserServiceImpl;

/*@WebServlet("/user")*/
@Controller
@RequestMapping("user")
public class UserController extends HttpServlet {
	@Resource
	UserService  UserService;
	static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@RequestMapping("usershow")
	public ModelAndView usershow() {
		
		//System.out.println("用户表");
		List<User> list = UserService.usershow();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/user");
		return mav;
	}
	@RequestMapping("studentshow")
	public ModelAndView studentshow() {
		System.out.println("用户表");
		List<User> list = UserService.usershow();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/student");
		return mav;
	}
	@RequestMapping("user-list-news")
	public ModelAndView user_list_news() {
		System.out.println("这是通话模型表");
		List<Test> list = UserService.selectAllContainAddress();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/show");
		return mav;
	}
	@RequestMapping("user-findsome")
	private ModelAndView findsome(String su_name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(su_name!=null && !su_name.equals("")) {
			map.put("name", su_name);
		}
		List<Test> list = UserService.findSome(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/show");
		return mav;
	}

	@RequestMapping("login")
	public String login(HttpServletRequest req,HttpServletResponse resp, User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		username = UserService.login(username, password);
		String b = req.getParameter("cx");
		
		if(username!=null){
			HttpSession session = req.getSession();
			session.setAttribute("username",username);
			if("true".equals(b)){
				Cookie user1 = new Cookie("username",username);
				Cookie user2 = new Cookie("password",password);
				user1.setMaxAge(20000);
				user1.setPath(req.getContextPath()+"/");
				user2.setMaxAge(20000);
				user2.setPath(req.getContextPath()+"/");
				resp.addCookie(user1); 
				resp.addCookie(user2); 
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			logger.info("用户名为:"+username +"于  "+df.format(new Date()) + "登录");
			return "redirect:../index.jsp";
			
		}else{
			return "redirect:../login.jsp";
		}
	}
	// 退出登录
	@RequestMapping("loginout")
	public void loginout(HttpServletRequest request, HttpServletResponse response, User user)
			throws ServletException, IOException {
		String username = user.getUsername();
		HttpSession session = request.getSession();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info(username +df.format(new Date()) + "退出");
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("/SSM2/login.jsp");
	}

}
