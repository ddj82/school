package svc;

import dao.MocaDAO;
import vo.Mc_rooms;
import static util.JdbcUtil.*;
import java.sql.Connection;

public class RoomInsertService {
	
	public boolean registRoom(Mc_rooms mc_rooms) throws Exception{
		System.out.println("레지스트룸 오케이");
		
		boolean isInsertSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int insertCount = mocaDAO.insertRoom(mc_rooms);
		
		System.out.println("인서트됐는가2?: " + insertCount);
		
		if (insertCount > 0) {
			
			System.out.println("인서트됐는가3?: " + insertCount);
			
//			commit(con);
			isInsertSuccess = true;
		} else {
//			rollback(con);
		}
		
		close(con);
		return isInsertSuccess;
		
	}
}
