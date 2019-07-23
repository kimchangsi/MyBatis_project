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

public class UpdateProjectHandler implements ConmmandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String sNo = req.getParameter("no");
			int no = Integer.parseInt(sNo);
			SqlSession sqlSession = null;
			try{
				sqlSession = MySqlSessionFactory.openSession();
				ProjectDao  dao = sqlSession.getMapper(ProjectDao.class);
				Project p = dao.selectById(no);
				req.setAttribute("a", p);
				return "/WEB-INF/view/projectUpdate.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String sNo = req.getParameter("no");
			int no = Integer.parseInt(sNo);
			String name = req.getParameter("name");
			String content = req.getParameter("content");
			String progress = req.getParameter("sel");
			
			String startDate = req.getParameter("startDate");
			SimpleDateFormat d1 = new SimpleDateFormat("yyyy/mm/dd");
			Date date1 = d1.parse(startDate);
			
			String endDate = req.getParameter("endDate");
			SimpleDateFormat d2 = new SimpleDateFormat("yyyy/mm/dd");
			Date date2 = d2.parse(endDate);
			
			SqlSession sqlSession = null;
			try {
				sqlSession = MySqlSessionFactory.openSession();
				ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
				Project p = new Project();
				p.setStartDate(date1);
				p.setEndDate(date2);
				p.setNo(no);
				p.setName(name);
				p.setProgress(progress);
				p.setContent(content);
				
				dao.update(p);
				sqlSession.commit();
				
				return "detail.do?no="+p.getNo();
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}finally {
				sqlSession.close();
			}
		}
		return null;
	}

}
