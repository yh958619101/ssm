package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlSessionFactoryUtil {
	  /*
	   * ���һ�ȡ��SqlSessionFactory����
	   * ��ʹ��open�����򿪡��õ�SqlSession 
	   */
	public  static SqlSessionFactory sqlsessionfactory  ;
	
	public static  SqlSessionFactory   SqlSessionFactory(){
		// ʵ������� Resources ͨ��mybatis��Resources��ȡ�������ļ�mybatis-config.xml
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
