package dao;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.Mc_rooms;

public class MocaDAO {
   public static MocaDAO instance;
   Connection con;
   PreparedStatement ps;
   ResultSet rs;
   DataSource ds;
   
   public static MocaDAO getInstance(){
      if(instance == null){
         instance = new MocaDAO();
      }
      return instance;
   }
   public void setConnection(Connection con){
		this.con = con;
	}
   
 //글의 개수 구하기.
 	public int selectListCount() {

 		int listCount= 0;
 		PreparedStatement ps = null;
 		ResultSet rs = null;

 		try{


 			System.out.println("getConnection");
 			ps=con.prepareStatement("select count(*) from MC_ROOMS");
 			rs = ps.executeQuery();

 			if(rs.next()){
 				listCount=rs.getInt(1);
 			}
 		}catch(Exception ex){
 			System.out.println("getListCount 에러: " + ex);			
 		}finally{
 			close(rs);
 			close(ps);
 		}

 		return listCount;

 	}
   
   //방 내용 보기.
   public Mc_rooms selectRoom(int r_no){
	   
	   PreparedStatement ps = null;
	   ResultSet rs = null;
	   Mc_rooms mc_rooms = null;
	   
	   try{
		   ps = con.prepareStatement( "SELECT * FROM MC_ROOMS WHERE R_NO = ?");
		   ps.setInt(1, r_no);
		   rs= ps.executeQuery();
		   
		   if(rs.next()){
			   mc_rooms = new Mc_rooms();
			   mc_rooms.setR_no(rs.getInt("R_NO"));
			   mc_rooms.setR_name(rs.getString("R_NAME"));
			   mc_rooms.setR_max(rs.getInt("R_MAX"));
			   mc_rooms.setR_desc(rs.getString("R_DESC"));
			   mc_rooms.setR_file(rs.getString("R_FILE"));
		   }
	   }catch(Exception ex){
		   System.out.println("getDetail 에러 : " + ex);
	   }finally{
		   close(rs);
		   close(ps);
	   }
	   
	   return mc_rooms;
	   
   }
   
   // 방 수정
   public int updateRoom(Mc_rooms room){ //7번방 수정할 파라미터들로 세팅한vo

		int updateCount = 0;
		PreparedStatement ps = null;
		String sql="UPDATE MC_ROOMS SET R_NAME=?,R_DESC=?, R_MAX=?, R_FILE=? WHERE R_NO=?";

		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, room.getR_name());
			ps.setString(2, room.getR_desc());
			ps.setInt(3, room.getR_max());
			ps.setString(4, room.getR_file());
			ps.setInt(5, room.getR_no());
			
			
			updateCount = ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("MocaModify 에러 : " + ex);
		}finally{
			close(ps);
		}

		return updateCount;

	}

	//방 삭제.
	public int deleteRoom(int r_no){

		PreparedStatement ps = null;
		String mc_rooms_delete_sql="delete from mc_rooms where r_no=?";
		int deleteCount=0;

		try{
			ps=con.prepareStatement(mc_rooms_delete_sql);
			ps.setInt(1, r_no);
			deleteCount=ps.executeUpdate();
		}catch(Exception ex){
			System.out.println("MocaDelete 에러 : "+ex);
		}	finally{
			close(ps);
		}

		return deleteCount;

	}	
		//방 목록 보기.
		public ArrayList<Mc_rooms> selectRoomList(int page, int limit){

		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    String moca_list_sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY r_no DESC) AS rnum, R_NO, R_NAME, R_MAX, R_DESC, R_FILE FROM MC_ROOMS) WHERE rnum BETWEEN ? AND ?";

		    ArrayList<Mc_rooms> roomList = new ArrayList<Mc_rooms>();
		    int startrow=(page-1)*10+1; //읽기 시작할 row 번호..  
		    int endrow=(page-1)*10+10;

		    try{
		        ps = con.prepareStatement(moca_list_sql);
		        ps.setInt(1, startrow);
		        ps.setInt(2, endrow);
		        rs = ps.executeQuery();

		        while(rs.next()){
		            Mc_rooms mc_rooms = new Mc_rooms();
		            mc_rooms.setR_no(rs.getInt("R_NO"));
		            mc_rooms.setR_name(rs.getString("R_NAME"));
		            mc_rooms.setR_max(rs.getInt("R_MAX"));
		            mc_rooms.setR_desc(rs.getString("R_DESC"));
		            mc_rooms.setR_file(rs.getString("R_FILE"));

		            roomList.add(mc_rooms);
		        }

		    }catch(Exception ex){
		        System.out.println("getMocasssList 에러 : " + ex);
		    }finally{
		        close(rs);
		        close(ps);
		    }

		    return roomList;

		}
		//방 등록
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
//				INSERT INTO MC_ROOMS VALUES (1, '김건모방', 6, '솰라솰라 방설명', '방사진.jpg');
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
	
}