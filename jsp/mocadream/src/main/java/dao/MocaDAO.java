package dao;

import static util.JdbcUtil.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import javax.sql.DataSource;
import vo.*;

public class MocaDAO {
	public static MocaDAO instance;
	Connection con;
	Statement st;
	PreparedStatement ps;
	ResultSet rs;
	DataSource ds;

	private MocaDAO() {
		
	}

	public static MocaDAO getInstance() {
		if (instance == null) {
			instance = new MocaDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	public Mc_users selectLoginMember(String id, String pw) {
		Mc_users loginMember = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS WHERE ID = ? AND PW = ?");
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				loginMember = new Mc_users();
				
				loginMember.setId(rs.getString("ID"));
				loginMember.setPw(rs.getString("PW"));
				loginMember.setName(rs.getString("NAME"));
				loginMember.setTel(rs.getString("TEL"));
				
				loginMember.setEmail(rs.getString("EMAIL"));
				loginMember.setAddr(rs.getString("ADDR"));
				loginMember.setWar(rs.getInt("WAR"));
				loginMember.setState(rs.getInt("STATE"));

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
	
	
	public ArrayList<Mc_users> searchList() {
		ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
		
		// 멤버 리스트를 가져오기 위한 어레이리스트 객체
		String sql = "SELECT * FROM MC_USERS";
		
		// 멤버 리스트를 전부 가져오는 SQL문
		Mc_users mb = null;
		
		// vo객체 생성
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				mb = new Mc_users();
				mb.setId(rs.getString("ID"));
				mb.setPw(rs.getString("PW"));
				mb.setName(rs.getString("NAME"));
				mb.setTel(rs.getString("TEL"));
				mb.setEmail(rs.getString("EMAIL"));
				mb.setAddr(rs.getString("ADDR"));
				mb.setWar(rs.getInt("WAR"));
				mb.setState(rs.getInt("STATE"));
				memberList.add(mb);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("데이터를 가져오는 도중 에러가 발생했습니다.");
		} finally {
			try {
				if (rs != null)
					close(rs);
				if (st != null)
					close(st);
			} catch (Exception e) {
				System.out.println("객체를 닫는 도중 에러가 발생했습니다.");
				e.getMessage();
			}
		}
		return memberList;
	}
	
	
	public int warning(String id) {
		String sql = "UPDATE MC_USERS SET WAR = WAR + 1 WHERE ID=?";
		int cnt = 0;
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			cnt = ps.executeUpdate();

			if (cnt > 0) {
				System.out.println(cnt + "행이 처리되었습니다.");
				commit(con);
			} else {
				System.out.println("처리되지 않았습니다.");
			}

			sql = "SELECT WAR FROM MC_USERS WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			Mc_users mb = null;
			while (rs.next()) {
				mb = new Mc_users();
				mb.setWar(rs.getInt("WAR"));
			}

			if (mb.getWar() == 3) {
				sql = "UPDATE MC_USERS SET WAR=0, STATE=2 WHERE ID=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				cnt = ps.executeUpdate();
				
				if (cnt > 0) {
					System.out.println(cnt + "행이 처리되었습니다.");
					commit(con);
				} else {
					System.out.println("처리되지 않았습니다.");
				}
			}

		} catch (SQLException e) {
			System.out.println("sql문 실행 도중 에러가 발생했습니다.");
			e.getMessage();
		} finally {
			try {
				if (ps != null)
					close(ps);
				if (st != null)
					close(st);
			} catch (Exception e) {
				System.out.println("객체를 닫는 도중 에러가 발생했습니다.");
				e.getMessage();
			}
		}
		return cnt;
	}
	
	public int release(String id) {
		String sql = "UPDATE MC_USERS SET WAR=0, STATE=1 WHERE ID=?";
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			cnt = ps.executeUpdate();

			if (cnt > 0) {
				System.out.println(cnt + "행이 처리되었습니다.");
				commit(con);
			} else {
				System.out.println("처리되지 않았습니다.");
			}

		} catch (SQLException e) {
			System.out.println("sql문 실행 도중 에러가 발생했습니다.");
			e.getMessage();
		} finally {
			try {
				if (ps != null)
					close(ps);
				if (st != null)
					close(st);
			} catch (Exception e) {
				System.out.println("객체를 닫는 도중 에러가 발생했습니다.");
				e.getMessage();
			}
		}
		return cnt;
	}
	
	
	public int selectNowOrderCount() {
		int nowListCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			System.out.println("getConnection");
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ORDER WHERE R_CAL > SYSDATE");
			rs = ps.executeQuery();

			if (rs.next()) {
				nowListCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getNowOrderCount 에러: " + e);			
		} finally {
			close(rs);
			close(ps);
		}

		return nowListCount;

	}
	
	
	public ArrayList<Mc_order> selectNowOrderList(int page, int limit) { //page-1, limit-10

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM "
				+ "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_CAL > SYSDATE ORDER BY R_CAL) A) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> nowOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1; //읽기 시작할 row 번호..	
		int endrow = (page - 1) * 10 + 10;

		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Mc_order nowOrder = new Mc_order();
				nowOrder.setR_no(rs.getInt("R_NO"));
				nowOrder.setR_name(rs.getString("R_NAME"));
				nowOrder.setR_uname(rs.getString("R_UNAME"));
				nowOrder.setR_cal(rs.getDate("R_CAL"));
				nowOrder.setR_time(rs.getInt("R_TIME"));
				nowOrder.setR_statime(rs.getInt("R_STATIME"));
				nowOrder.setR_endtime(rs.getInt("R_ENDTIME"));
				nowOrder.setR_used(rs.getString("R_USED"));
				nowOrderList.add(nowOrder);
			}

		} catch (Exception e) {
			System.out.println("getorderList 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return nowOrderList;
	}
	
	
	public int insertRoom(Mc_rooms room) {
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {	
			ps = con.prepareStatement("SELECT MAX(R_NO) FROM MC_ROOMS");
			rs = ps.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			sql = "INSERT INTO MC_ROOMS VALUES (?, ?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, room.getR_name());
			ps.setInt(3, room.getR_max());
			ps.setString(4, room.getR_desc());
			ps.setString(5, room.getR_file());

			insertCount = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertRoom 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return insertCount;
		
	}
	
}
