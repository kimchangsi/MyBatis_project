package kr.yi.project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.yi.project.controller.ConmmandHandler;
import kr.yi.project.dao.ProjectDao;
import kr.yi.project.model.Project;
import kr.yi.project.util.MySqlSessionFactory;

public class DetailProjectHandler implements ConmmandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sNo = req.getParameter("no");
		int no = Integer.parseInt(sNo);
		SqlSession sqlSession = null;
		try {
			sqlSession = MySqlSessionFactory.openSession();
			ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
			
			Project p =  dao.selectById(no);
			
			req.setAttribute("p", p);
			return "/WEB-INF/view/projectDetail.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return null;
	}

}
