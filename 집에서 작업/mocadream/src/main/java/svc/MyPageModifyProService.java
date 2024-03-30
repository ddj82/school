package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_users;

public class MyPageModifyProService {

	public boolean updateMember(Mc_users member) throws Exception {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
        mocaDAO.setConnection(con);
        
        boolean isSuccess = mocaDAO.updateMember(member);
        close(con);
        return isSuccess;
    }
}


