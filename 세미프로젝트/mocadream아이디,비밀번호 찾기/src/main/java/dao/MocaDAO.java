package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import vo.Mc_users;
import static util.JdbcUtil.*;

public class MocaDAO {
	public static MocaDAO instance;
	Connection con;
	PreparedStatement ps;
	Statement st;
	ResultSet rs;
	DataSource ds;

	  //DataSource 초기화
	private MocaDAO() {
	    try {
	        // InitialContext 객체를 생성하여 초기 컨텍스트를 가져옴
	        Context initCtx = new InitialContext();
	        // 컨텍스트를 사용하여 환경 컨텍스트를 가져옴
	        Context envCtx = (Context)initCtx.lookup("java:comp/env");
	        // 환경 컨텍스트를 사용하여 데이터 소스를 검색하고 가져옴
	        ds = (DataSource)envCtx.lookup("jdbc/MocaDB");
	    } catch (NamingException e) {
	        // 예외 발생 시 스택 트레이스를 출력
	        e.printStackTrace();
	    }
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

	public Mc_users selectLoginMember(String id, String pw) {
		Mc_users loginMember = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS Where ID = ? AND PW = ?");
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				loginMember = new Mc_users();

				loginMember.setId(rs.getString("id"));
				loginMember.setPw(rs.getString("pw"));
				loginMember.setName(rs.getString("name"));
				loginMember.setTel(rs.getString("tel"));

				loginMember.setEmail(rs.getString("email"));
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setWar(rs.getInt("war"));
				loginMember.setState(rs.getInt("state"));

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

	
	public boolean idCheck(Mc_users mv) {
        if(mv.getId() == null || mv.getId().length() == 0) {
        	System.out.println("아이디가 없습니다.");
        }
        boolean idchk = false;
        String SQL = "select count(*) as result from MC_USERS where id = ? ";

        try {
        	con = ds.getConnection();
            ps = con.prepareStatement(SQL);
            ps.setString(1, mv.getId());

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
	            int result = rs.getInt(1);
	            if(result > 0) 
	            idchk = true;
            }
            return idchk;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idchk;
    }


	public int insertMember(Mc_users member) {
		String sql = "INSERT INTO MC_USERS (ID, PW, NAME, TEL, EMAIL, ADDR) VALUES (?,?,?,?,?,?)";
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


	    public List<String> findIdMember(Mc_users member) {
	    	System.out.println("MocaDAO의 findmember까진 왔음");
	        List<String> idList = new ArrayList<>();
	        String sql = "select id from MC_USERS where name = ? and email = ?";

	        try {
	            ps = con.prepareStatement(sql);
	            ps.setString(1, member.getName());
	            ps.setString(2, member.getEmail());
	            rs = ps.executeQuery();
	            while (rs.next()) {
	                idList.add(rs.getString("ID"));
	            }
	        } catch (SQLException ex) {
	            System.out.println("findMember 에러: " + ex);
	        } finally {
	            close(ps);
	        }

	        return idList;
	    }
	
	    public Mc_users findPwMember(Mc_users member) {
	        System.out.println("MocaDAO의 pwfindmember까진 왔음");
	        String sql = "select pw from MC_USERS where id = ? and name = ? and email = ?";
	        Mc_users user_pw = new Mc_users(); // 객체 생성
	        
	        try {
	            ps = con.prepareStatement(sql);
	            ps.setString(1, member.getId());
	            ps.setString(2, member.getName());
	            ps.setString(3, member.getEmail());
	            rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                user_pw.setPw(rs.getString("pw")); // 비밀번호 설정
	            }
	        } catch (SQLException ex) {
	            System.out.println("findMember 에러: " + ex);
	        } finally {
	            close(ps);
	        }

	        return user_pw; // 비밀번호를 포함한 객체 반환
	    }

	

}