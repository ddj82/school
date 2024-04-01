package svc;

import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_notice;
import static util.JdbcUtil.*;

public class BoardDetailService {

	public Mc_notice getArticle(int nt_no) throws Exception {
		Mc_notice article = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		article = mocaDAO.selectNotice(nt_no);
		close(con);
		return article;

	}

}
