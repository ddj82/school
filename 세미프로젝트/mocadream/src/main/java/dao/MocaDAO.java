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

	public ArrayList<Mc_order> selectNowOrderList(int page, int limit) { // page-1, limit-10

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM "
				+ "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_CAL > SYSDATE ORDER BY R_CAL) A) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> nowOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;

		try {
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

	public int selectListCount() {
		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ROOMS");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount 에러: " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
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

	public int deleteRoom(int r_no) {

		PreparedStatement ps = null;
		String sql = "DELETE FROM MC_ROOMS WHERE R_NO = ?";
		int deleteCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, r_no);
			deleteCount = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("MocaDelete 에러 : " + e);
		} finally {
			close(ps);
		}

		return deleteCount;

	}

	public Mc_rooms selectRoom(int r_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Mc_rooms mc_rooms = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_ROOMS WHERE R_NO = ?");
			ps.setInt(1, r_no);
			rs = ps.executeQuery();

			if (rs.next()) {
				mc_rooms = new Mc_rooms();
				mc_rooms.setR_no(rs.getInt("R_NO"));
				mc_rooms.setR_name(rs.getString("R_NAME"));
				mc_rooms.setR_max(rs.getInt("R_MAX"));
				mc_rooms.setR_desc(rs.getString("R_DESC"));
				mc_rooms.setR_file(rs.getString("R_FILE"));
			}
		} catch (Exception e) {
			System.out.println("getDetail 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return mc_rooms;
	}

	public ArrayList<Mc_rooms> selectRoomList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM "
				+ "(SELECT ROW_NUMBER() OVER (ORDER BY R_NO DESC) AS RNUM, R_NO, R_NAME, R_MAX, R_DESC, R_FILE FROM MC_ROOMS) "
				+ "WHERE RNUM BETWEEN ? AND ?";

		ArrayList<Mc_rooms> roomList = new ArrayList<Mc_rooms>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_rooms mc_rooms = new Mc_rooms();
				mc_rooms.setR_no(rs.getInt("R_NO"));
				mc_rooms.setR_name(rs.getString("R_NAME"));
				mc_rooms.setR_max(rs.getInt("R_MAX"));
				mc_rooms.setR_desc(rs.getString("R_DESC"));
				mc_rooms.setR_file(rs.getString("R_FILE"));
				roomList.add(mc_rooms);
			}

		} catch (Exception e) {
			System.out.println("getMocasssList 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return roomList;
	}

	public int updateRoom(Mc_rooms room) {

		int updateCount = 0;
		PreparedStatement ps = null;
		String sql = "UPDATE MC_ROOMS SET R_NAME=?,R_DESC=?, R_MAX=?, R_FILE=? WHERE R_NO=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, room.getR_name());
			ps.setString(2, room.getR_desc());
			ps.setInt(3, room.getR_max());
			ps.setString(4, room.getR_file());
			ps.setInt(5, room.getR_no());

			updateCount = ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println("MocaModify 에러 : " + ex);
		} finally {
			close(ps);
		}

		return updateCount;

	}

	public ArrayList<Mc_notice> selectArticleList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM "
				+ "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_NOTICE ORDER BY NT_NO DESC ) A ) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_notice> articleList = new ArrayList<Mc_notice>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_notice mc_notice = new Mc_notice();
				mc_notice.setNt_no(rs.getInt("NT_NO"));
				mc_notice.setNt_title(rs.getString("NT_TITLE"));
				mc_notice.setNt_content(rs.getString("NT_CONTENT"));
				mc_notice.setNt_writer(rs.getString("NT_WRITER"));
				mc_notice.setNt_date(rs.getDate("NT_DATE"));
				articleList.add(mc_notice);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return articleList;
	}

	public int insertArticle(Mc_notice mc_notice) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			ps = con.prepareStatement("SELECT MAX(NT_NO) FROM MC_NOTICE");
			rs = ps.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;
			close(ps);

			sql = "INSERT INTO MC_NOTICE (NT_NO, NT_TITLE, NT_CONTENT, NT_WRITER,";
			sql += "NT_DATE) VALUES(?, ?, ?, ?, SYSDATE)";

			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, mc_notice.getNt_title());
			ps.setString(3, mc_notice.getNt_content());
			ps.setString(4, mc_notice.getNt_writer());
			insertCount = ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println("boardInsert 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return insertCount;

	}

	public Mc_notice selectArticle(int nt_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Mc_notice mc_notice = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_NOTICE WHERE NT_NO = ?");
			ps.setInt(1, nt_no);
			rs = ps.executeQuery();

			if (rs.next()) {
				mc_notice = new Mc_notice();
				mc_notice.setNt_no(rs.getInt("NT_NO"));
				mc_notice.setNt_title(rs.getString("NT_TITLE"));
				mc_notice.setNt_content(rs.getString("NT_CONTENT"));
				mc_notice.setNt_writer(rs.getString("NT_WRITER"));
				mc_notice.setNt_date(rs.getDate("NT_DATE"));
			}
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return mc_notice;

	}

	public int updateArticle(Mc_notice mc_notice) {

		int updateCount = 0;
		PreparedStatement ps = null;
		String sql = "UPDATE MC_NOTICE SET NT_TITLE = ?, NT_CONTENT = ? WHERE NT_NO = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mc_notice.getNt_title());
			ps.setString(2, mc_notice.getNt_content());
			ps.setInt(3, mc_notice.getNt_no());
			updateCount = ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			close(ps);
		}

		return updateCount;

	}

	public int deleteArticle(int nt_no) {
		String select_sql = "SELECT MAX(NT_NO) FROM MC_NOTICE";
		
		String m_delete_sql = "DELETE FROM MC_NOTICE WHERE NT_NO = ?";
		
		String board_delete_sql = "DELETE FROM MC_NOTICE WHERE NT_NO = ?";
		
		String update_sql = "UPDATE MC_NOTICE SET NT_NO = NT_NO - 1 WHERE NT_NO > ? AND NT_NO <= (SELECT MAX(NT_NO) FROM MC_NOTICE)";
		
		int deleteCount = 0;

		try {
			ps = con.prepareStatement(select_sql);
			rs = ps.executeQuery();
			if (rs.next())
				if (nt_no == rs.getInt(1)) {
					try {
						ps = con.prepareStatement(m_delete_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close(rs);
						close(ps);
					}

				} else {
					try {
						ps = con.prepareStatement(board_delete_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();
						ps = con.prepareStatement(update_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();
					} catch (Exception ex) {
						System.out.println("boardDelete 에러 : " + ex);
					} finally {
						close(ps);
					}

				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return deleteCount;
	}

	public boolean isArticleBoardWriter(int nt_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String board_sql = "SELECT * FROM MC_NOTICE WHERE NT_NO = ?";
		boolean isWriter = false;

		try {
			ps = con.prepareStatement(board_sql);
			ps.setInt(1, nt_no);
			rs = ps.executeQuery();
			rs.next();

			if (nt_no == (rs.getInt("NT_NO"))) {
				isWriter = true;
			}

		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex);
		} finally {
			close(ps);
		}

		return isWriter;
	}

}
