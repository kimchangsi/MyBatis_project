package kr.yi.project.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.yi.project.controller.ConmmandHandler;
import kr.yi.project.dao.ProjectDao;
import kr.yi.project.model.Project;
import kr.yi.project.util.MySqlSessionFactory;

public class InsertProjectHandler implements ConmmandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/insertForm.jsp";

		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String content = req.getParameter("content");
			
			String startDate = req.getParameter("startDate");
			SimpleDateFormat d1 = new SimpleDateFormat("MM/dd/yyyy");
			Date date1 = d1.parse(startDate);
			
			String endtDate = req.getParameter("endDate");
			SimpleDateFormat d2 = new SimpleDateFormat("MM/dd/yyyy");
			Date date2 = d2.parse(startDate);
			
			String progress = req.getParameter("sel");

			SqlSession sqlSession = null;

			try {
				sqlSession = MySqlSessionFactory.openSession();
				ProjectDao dao = sqlSession.getMapper(ProjectDao.class);

				Project p = new Project();
				p.setName(name);
				p.setStartDate(date1);
				p.setEndDate(date2);
				p.setProgress(progress);
				p.setContent(content);
				
				dao.insert(p);
				sqlSession.commit();
				res.sendRedirect("list.do");
				return null;
				

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return null;
	}

}
