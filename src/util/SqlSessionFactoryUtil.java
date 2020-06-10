package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlSessionFactoryUtil {
	  /*
	   * 帮我获取到SqlSessionFactory对象
	   * 并使用open方法打开。得到SqlSession 
	   */
	public  static SqlSessionFactory sqlsessionfactory  ;
	
	public static  SqlSessionFactory   SqlSessionFactory(){
		// 实例对象的 Resources 通过mybatis的Resources读取主配置文件mybatis-config.xml
		if(sqlsessionfactory==null){
			try {
				InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
				sqlsessionfactory=new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sqlsessionfactory;
	}
	 
	public static SqlSession openSession(){
		
		return  SqlSessionFactory().openSession();
	}
	
}
