package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;

public class MocaDeleteProService {

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

	public boolean removeRoom(int r_no) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int deleteCount = mocaDAO.deleteRoom(r_no);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
