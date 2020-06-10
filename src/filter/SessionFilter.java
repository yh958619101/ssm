package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {
	@Override
	public void destroy() {
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)req;
		HttpServletResponse httpResponse = (HttpServletResponse)resp;
		HttpSession session = httpRequest.getSession();
		String username = (String)session.getAttribute("username");
		if(username==null) {
			  httpRequest.getRequestDispatcher("/login.jsp").forward(httpRequest,httpResponse);
		}else {	
			chain.doFilter(req, resp);
		}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
