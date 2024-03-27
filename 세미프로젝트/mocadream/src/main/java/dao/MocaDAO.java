package dao;

import static util.JdbcUtil.*;
import java.sql.*;
import javax.sql.DataSource;

import vo.Mc_rooms;

public class MocaDAO {
	public static MocaDAO instance;
	Connection con;
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
	
	public int insertRoom(Mc_rooms room) {
		System.out.println("인서트룸 레츠고");
		
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try{	
			ps = con.prepareStatement("SELECT MAX(R_NO) FROM MC_ROOMS");
			rs = ps.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
//			INSERT INTO MC_ROOMS VALUES (1, '김건모방', 6, '솰라솰라 방설명', '방사진.jpg');
			sql = "INSERT INTO MC_ROOMS VALUES (?, ?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, room.getR_name());
			ps.setInt(3, room.getR_max());
			ps.setString(4, room.getR_desc());
			ps.setString(5, room.getR_file());

			insertCount = ps.executeUpdate();
			
			System.out.println("인서트됐는가1?: " + insertCount);
			
		} catch (Exception e) {
			System.out.println("insertRoom 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return insertCount;
		
	}
	
//	public int insertArticle(BoardBean article){
//
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		int num =0;
//		String sql="";
//		int insertCount=0;
//
//		try{
//			ps=con.prepareStatement("SELECT MAX(BOARD_NUM) FROM BOARD");
//			rs = ps.executeQuery();
//
//			if(rs.next())
//				num =rs.getInt(1)+1;
//			else
//				num=1;
//
//			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
//			sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
//					"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
//					"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,SYSDATE)";
//
//			ps = con.prepareStatement(sql);
//			ps.setInt(1, num);
//			ps.setString(2, article.getBOARD_NAME());
//			ps.setString(3, article.getBOARD_PASS());
//			ps.setString(4, article.getBOARD_SUBJECT());
//			ps.setString(5, article.getBOARD_CONTENT());
//			ps.setString(6, article.getBOARD_FILE());
//			ps.setInt(7, num);
//			ps.setInt(8, 0);
//			ps.setInt(9, 0);
//			ps.setInt(10, 0);
//
//			insertCount=ps.executeUpdate();
//
//		}catch(Exception ex){
//			System.out.println("boardInsert 에러 : "+ex);
//		}finally{
//			close(rs);
//			close(ps);
//		}
//
//		return insertCount;
//
//	}
}
