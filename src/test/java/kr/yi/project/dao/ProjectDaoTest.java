package kr.yi.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.yi.project.model.Project;
import kr.yi.project.util.MySqlSessionFactory;

public class ProjectDaoTest {
	
	@Test
	public void testListPage() {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MySqlSessionFactory.openSession();
			ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
			
			List<Project> list = dao.selectList();
			
			for(Project project:list) {
				System.out.println(project);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			
		}
	}
}
