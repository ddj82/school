package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import static util.JdbcUtil.*;
import vo.Mc_users;

public class MemberListService {

	public ArrayList<Mc_users> getMemberList() {
		Connection con = getConnection();
		MocaDAO memberDAO = MocaDAO.getInstance();
		memberDAO.setConnection(con);
		ArrayList<Mc_users> memberList = memberDAO.searchMemberList();
		close(con);
		return memberList;
	}

	public ArrayList<Mc_users> getMemberList(String search) {
		Connection con = getConnection();
		MocaDAO memberDAO = MocaDAO.getInstance();
		memberDAO.setConnection(con);
		ArrayList<Mc_users> memberList = memberDAO.searchMemberList(search);
		close(con);
		return memberList;
	}
}