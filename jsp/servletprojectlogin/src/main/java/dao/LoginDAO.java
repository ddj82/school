package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import vo.Member;

public class LoginDAO {
	private static LoginDAO loginDAO;
	private Connection con;
	
	private LoginDAO() {}
	
	public static LoginDAO getInstance() {
		if (loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public Member selectLoginMember(String id, String passwd) {
		Member loginMember = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("SELECT * FROM USERS WHERE ID = ? AND PASSWD = ?");
			ps.setString(1, id);
			ps.setString(2, passwd);
			rs = ps.executeQuery();
			if (rs.next()) {
				loginMember = new Member();
				
				loginMember.setAddr(rs.getString("ADDR"));
				loginMember.setAge(rs.getInt("AGE"));
				loginMember.setEmail(rs.getString("EMAIL"));
				loginMember.setGender(rs.getString("GENDER"));
				
				loginMember.setId(rs.getString("ID"));
				loginMember.setName(rs.getString("NAME"));
				loginMember.setNation(rs.getString("NATION"));
				loginMember.setPasswd(rs.getString("PASSWD"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rs);
				close(ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}
}
