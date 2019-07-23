package kr.yi.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.yi.project.model.Project;

public interface ProjectDao {
	public List<Project> selectList() throws SQLException;
	public int insert(Project p) throws SQLException;
	public Project selectById(int no) throws SQLException;
	public int delete(int no) throws SQLException;
	public int update(Project p) throws SQLException;
}
