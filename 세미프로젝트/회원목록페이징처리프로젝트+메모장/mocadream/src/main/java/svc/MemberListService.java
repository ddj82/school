package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import static util.JdbcUtil.*;
import vo.Mc_users;

public class MemberListService {
	
	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectMemberListCount();
		close(con);
		return listCount;
	}
	
	public ArrayList<Mc_users> getArticleList(int page, int limit) throws Exception {

		ArrayList<Mc_users> articleList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		articleList = mocaDAO.selectMemberList(page, limit);
		close(con);
		return articleList;
	}
	
	public ArrayList<Mc_users> getArticleList(int page, int limit, String search) throws Exception {

		ArrayList<Mc_users> articleList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		articleList = mocaDAO.selectMemberList(page, limit, search);
		close(con);
		return articleList;
	}
}