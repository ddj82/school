package svc;

import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_rooms;
import static util.JdbcUtil.*;

public class MocaDetailService {

	public Mc_rooms getRoom(int r_no) throws Exception{
		
		Mc_rooms room = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
//		int updateCount = mocaDAO.updateReadCount(r_no);
		
//		if(updateCount > 0){
//			commit(con);
//		}
//		else{
//			rollback(con);
//		}
		
		room = mocaDAO.selectRoom(r_no);
		close(con);
		return room;
		
	}

}
