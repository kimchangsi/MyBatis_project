package kr.yi.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ConmmandHandler {
	public String process(HttpServletRequest req,HttpServletResponse res) throws Exception;
}
