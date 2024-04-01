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

	// 회원가입 메소드
	public int insertMember(Mc_users member) {
		String sql = "INSERT INTO MC_USERS (ID, PW, NAME, TEL, EMAIL, ADDR) VALUES (?, ?, ?, ?, ?, ?)";
		int insertCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getTel());
			ps.setString(5, member.getEmail());
			ps.setString(6, member.getAddr());
			insertCount = ps.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("joinMember 에러: " + ex);
		} finally {
			close(ps);
		}

		return insertCount;
	}

	// 회원가입 아이디 중복체크
	public boolean idCheck(Mc_users mv) {
		if (mv.getId() == null || mv.getId().length() == 0) {
			System.out.println("아이디가 없습니다.");
		}
		boolean idchk = false;
		String sql = "SELECT COUNT(*) AS RESULT FROM MC_USERS WHERE ID = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mv.getId());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int result = rs.getInt(1);
				if (result > 0)
					idchk = true;
			}
			return idchk;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idchk;
	}

	// 로그인 메소드
	public Mc_users loginMember(String id, String pw) {
		Mc_users loginMember = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS WHERE ID = ? AND PW = ? AND STATE = 1");
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

	// 회원 내정보 메소드
	public Mc_users selectMypage(String id) {
		Mc_users myPage = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS WHERE ID = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				myPage = new Mc_users();

				myPage.setId(rs.getString("ID"));
				myPage.setPw(rs.getString("PW"));
				myPage.setName(rs.getString("NAME"));
				myPage.setTel(rs.getString("TEL"));
				myPage.setEmail(rs.getString("EMAIL"));
				myPage.setAddr(rs.getString("ADDR"));
				myPage.setWar(rs.getInt("WAR"));
				myPage.setState(rs.getInt("STATE"));

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
		return myPage;
	}

	// 회원 내정보 수정 메소드
	public boolean updateMember(Mc_users member) {
		boolean isSuccess = false;
		PreparedStatement ps = null;
		String sql = "UPDATE MC_USERS SET PW = ?, NAME = ?, TEL = ?, EMAIL = ?, ADDR = ? WHERE ID = ?";

		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, member.getPw());
			ps.setString(2, member.getName());
			ps.setString(3, member.getTel());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getAddr());
			ps.setString(6, member.getId());

			int count = ps.executeUpdate();

			isSuccess = count > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// 회원 탈퇴 메소드
	public Mc_users deleteMember(String id) {
		String sql = "UPDATE MC_USERS SET STATE = 0 WHERE ID = ?";
		Mc_users mb = null;
		try {
			mb = new Mc_users();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				System.out.println("회원 삭제 완료");
			} else {
				System.out.println("해당하는 회원이 없습니다.");
			}

		} catch (SQLException ex) {
			System.out.println("deleteMember 에러: ");
			ex.printStackTrace();
		} finally {
			close(ps);
		}

		return mb;
	}

	// 회원 예약하기1(방리스트 불러오는) 메소드
	public ArrayList<Mc_rooms> selectRoomsList() {
		String sql = "SELECT * FROM MC_ROOMS ORDER BY R_NO";
		ArrayList<Mc_rooms> mc_rooms = new ArrayList<Mc_rooms>();
		Mc_rooms mr = null;

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				mr = new Mc_rooms();
				mr.setR_no(rs.getInt("R_NO"));
				mr.setR_name(rs.getString("R_NAME"));
				mr.setR_max(rs.getInt("R_MAX"));
				mr.setR_desc(rs.getString("R_DESC"));
				mr.setR_file(rs.getString("R_FILE"));
				mc_rooms.add(mr);
			}

		} catch (Exception ex) {
			System.out.println("selectRoomsList 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}
		return mc_rooms;
	}

	// 회원 예약하기2 (예약가능시간 검색) 메소드
	public ArrayList<Integer> selectYesTime(String rname, Date rcal) {
		String sql = "SELECT R_TIME, R_STATIME, R_ENDTIME - 1 FROM MC_ORDER WHERE R_NAME = ? AND R_CAL = ?";
		ArrayList<Integer> noTimeList = new ArrayList<Integer>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, rname);

			java.util.Date utilDate = rcal;
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			ps.setDate(2, sqlDate);
			rs = ps.executeQuery();

			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					noTimeList.add(rs.getInt(2));
				} else if (rs.getInt(1) == 2) {
					noTimeList.add(rs.getInt(2));
					noTimeList.add(rs.getInt(3));
				} else {
					noTimeList.add(rs.getInt(2));
					noTimeList.add(rs.getInt(3) - 1);
					noTimeList.add(rs.getInt(3));
				}
			}
			System.out.println("noTimeList랭스 : " + noTimeList.size());
			for (int i = 0; i < noTimeList.size(); i++) {
				System.out.println(noTimeList.get(i));
			}

		} catch (Exception e) {
			System.out.println("selectYesTime 에러: " + e);
		} finally {
			close(rs);
			close(ps);
		}
		return noTimeList;
	}

	// 회원 예약하기3 메소드
	public int insertOrder(Mc_order order) {
		String sql = "INSERT INTO MC_ORDER VALUES ( ?, ?, ?, ?, ?, ?, ?, '미사용')";
		int insertCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, order.getR_no());
			ps.setString(2, order.getR_name());
			ps.setString(3, order.getR_uname());

			java.util.Date utilDate = order.getR_cal();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			ps.setDate(4, sqlDate);

			ps.setInt(5, order.getR_time());
			ps.setInt(6, order.getR_statime());
			ps.setInt(7, order.getR_endtime());

			insertCount = ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertOrder 에러: " + ex);
		} finally {
			close(ps);
		}

		return insertCount;
	}

	// 회원 예약내역확인1(있는지 확인) 메소드
	public int userOdertListCount(String orderId) {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ORDER WHERE R_UNAME = ? ORDER BY R_CAL DESC");
			ps.setString(1, orderId);
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("userOdertListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 회원 예약내역확인2 메소드
	public ArrayList<Mc_order> selectUserOrderList(String orderId, int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Mc_order mcorder = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_UNAME = ? ORDER BY R_CAL DESC ) A ) WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> userOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, orderId);
			ps.setInt(2, startrow);
			ps.setInt(3, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				mcorder = new Mc_order();
				mcorder.setR_no(rs.getInt("R_NO"));
				mcorder.setR_name(rs.getString("R_NAME"));
				mcorder.setR_uname(rs.getString("R_UNAME"));
				mcorder.setR_cal(rs.getDate("R_CAL"));
				mcorder.setR_time(rs.getInt("R_TIME"));
				mcorder.setR_statime(rs.getInt("R_STATIME"));
				mcorder.setR_endtime(rs.getInt("R_ENDTIME"));
				mcorder.setR_used(rs.getString("R_USED"));
				userOrderList.add(mcorder);
			}

		} catch (Exception ex) {
			System.out.println("selectUserOrderList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}
		return userOrderList;
	}

	// 회원 예약취소 메소드
	public int deleteOrder(String deleteId, String r_no, String r_cal, String r_statime) {
		PreparedStatement ps = null;
		String sql = "DELETE FROM MC_ORDER WHERE R_UNAME = ? AND R_NO = ? AND TO_CHAR(R_CAL , 'YYYY-MM-DD') = ? AND R_STATIME = ? ";
		int deleteCount = 0;

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, deleteId);
			ps.setString(2, r_no);
			ps.setString(3, r_cal);
			ps.setString(4, r_statime);

			deleteCount = ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteUserOrderList 에러 : " + ex);
		} finally {
			close(ps);
		}

		return deleteCount;

	}

	// 관리자 회원정보리스트 메소드
	public ArrayList<Mc_users> searchMemberList() {
		ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
		String sql = "SELECT * FROM MC_USERS";
		Mc_users mb = null;

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

	// 관리자 회원정보리스트 검색기능 메소드
	public ArrayList<Mc_users> searchMemberList(String search) {
		ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
		String sql;
		Mc_users mb = null;
		// if else로 search가 제재나 석방이면 sql문에서 state를 각각 검색하도록 설정

		if (search.equals("정지")) {
			sql = "SELECT * FROM MC_USERS WHERE STATE = 2";

			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
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

		} else if (search.equals("탈퇴")) {

			sql = "SELECT * FROM MC_USERS WHERE STATE = 3";

			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
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
		} else {

			sql = "SELECT * FROM MC_USERS " + "WHERE UPPER(ID) LIKE UPPER(?) OR UPPER(PW) LIKE UPPER(?) OR UPPER(NAME) "
					+ "LIKE UPPER(?) OR UPPER(TEL) LIKE UPPER(?) OR UPPER(ADDR) LIKE UPPER(?)";
			try {
				ps = con.prepareStatement(sql);

				ps.setString(1, "%" + search + "%");
				ps.setString(2, "%" + search + "%");
				ps.setString(3, "%" + search + "%");
				ps.setString(4, "%" + search + "%");
				ps.setString(5, "%" + search + "%");

				rs = ps.executeQuery();
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
		}

		return memberList;
	}

	// 관리자 회원제재 메소드
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
				sql = "UPDATE MC_USERS SET WAR = 0, STATE = 2 WHERE ID = ?";
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

	// 관리자 회원석방 메소드
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

	// 관리자 실시간예약조회1 메소드
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

	// 관리자 실시간예약조회2 메소드
	public ArrayList<Mc_order> selectNowOrderList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM "
				+ "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_CAL > SYSDATE ORDER BY R_CAL) A) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> nowOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1;
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

	// 관리자 방관리1 메소드
	public int selectRoomListCount() {
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

	// 관리자 방관리2 메소드
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

	// 관리자 방수정(수정할 방검색) 메소드
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

	// 관리자 방수정(수정할 방검색 후) 메소드
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

	// 관리자 방추가 메소드
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

	// 관리자 방삭제 메소드
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

	// 관리자 공지목록1 메소드
	public int selectNoticeListCount() {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_NOTICE");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 관리자 공지목록2 메소드
	public ArrayList<Mc_notice> selectNoticeList(int page, int limit) {

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

	public ArrayList<Mc_notice> selectNoticeList(int page, int limit, String search) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_NOTICE WHERE NT_TITLE LIKE ? ORDER BY NT_NO DESC) A ) WHERE RNUM BETWEEN ? AND ?";

		ArrayList<Mc_notice> articleList = new ArrayList<Mc_notice>();
		int startrow = (page - 1) * 10 + 1; 
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, search + "%");
			ps.setInt(2, startrow);
			ps.setInt(3, endrow);
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

	// 관리자 공지추가 메소드
	public int insertNotice(Mc_notice mc_notice) {

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

	// 관리자 공지내용보기 메소드
	public Mc_notice selectNotice(int nt_no) {

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

	// 관리자 공지수정,삭제 전 관리자인지 메소드
	public boolean isNoticeBoardWriter(int nt_no) {

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

	// 관리자 공지수정 메소드
	public int updateNotice(Mc_notice mc_notice) {

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

	// 관리자 공지삭제 메소드
	public int deleteNotice(int nt_no) {
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

}
