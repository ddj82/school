package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import vo.Mc_rooms;
import dao.MocaDAO;

public class MocaModifyProService {

	public boolean modifyRoom(Mc_rooms room) throws Exception {
		boolean isModifySuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			MocaDAO mocaDAO = MocaDAO.getInstance();
			mocaDAO.setConnection(con);
			int updateCount = mocaDAO.updateRoom(room);

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
