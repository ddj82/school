//package svc;
//
//import static db.JdbcUtil.*;
//import java.sql.Connection;
//import vo.Mc_rooms;
//import dao.MocaDAO;
//
//public class MocaModifyProService {
//
//	public boolean isRoomWriter(int r_no, String pass) throws Exception {
//		// TODO Auto-generated method stub
//		
//		boolean isRoomWriter = false;
//		Connection con = getConnection();
//		MocaDAO mocaDAO = MocaDAO.getInstance();
//		mocaDAO.setConnection(con);
//		isRoomWriter = mocaDAO.isRoomMocaWriter(r_no, pass);
//		close(con);
//		return isRoomWriter;
//		
//	}
//
//	public boolean modifyRoom(Mc_rooms room) throws Exception {
//		// TODO Auto-generated method stub
//		
//		boolean isModifySuccess = false;
//		Connection con = getConnection();
//		MocaDAO mocaDAO = MocaDAO.getInstance();
//		mocaDAO.setConnection(con);
//		int updateCount = mocaDAO.updateRoom(room);
//		
//		if(updateCount > 0){
//			commit(con);
//			isModifySuccess=true;
//		}
//		else{
//			rollback(con);
//		}
//		
//		close(con);
//		return isModifySuccess;
//		
//	}
//
//}

package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import vo.Mc_rooms;
import dao.MocaDAO;

public class MocaModifyProService {

    public boolean isRoomWriter(int r_no, String pass) throws Exception {
        boolean isRoomWriter = true;
        Connection con = null;
        try {
            con = getConnection();
            MocaDAO mocaDAO = MocaDAO.getInstance();
            mocaDAO.setConnection(con);
//            isRoomWriter = mocaDAO.isRoomMocaWriter(r_no, pass);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                close(con);
            }
        }
        return isRoomWriter;
    }

    public boolean modifyRoom(Mc_rooms room) throws Exception {
        boolean isModifySuccess = false;
        Connection con = null;
        try {
            con = getConnection();
            MocaDAO mocaDAO = MocaDAO.getInstance();
            mocaDAO.setConnection(con);
            int updateCount = mocaDAO.updateRoom(room);
            
            System.out.println("업데이트 됐냐? : " + updateCount);
            
            if (updateCount > 0) {
//                commit(con);
                isModifySuccess = true;
            } else {
//                rollback(con);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                close(con);
            }
        }
        return isModifySuccess;
    }
}

