package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/loginCheck")
public class LoginCheck extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HelloServlet doProcess()");
		
		//전송한 데이터가 form데이터인 경우
		String id = request.getParameter("id");
		System.out.println("id  : " + id);
		
		if(id==null) {
			//전송한 데이터가 json데이터 인 경우
			StringBuilder stringBuilder = new StringBuilder();
			BufferedReader bufferedReader = null;
			try {
				InputStream inputStream = request.getInputStream();
				if (inputStream != null) {
					bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
					char[] charBuffer = new char[128];
					int bytesRead = -1;
					while ((bytesRead = bufferedReader.read(charBuffer)) > -1) {
						stringBuilder.append(charBuffer, 0, bytesRead);
					}
				} else {
					stringBuilder.append("");
					System.out.println(stringBuilder);
				}
				JSONParser json = new JSONParser();
				JSONObject jobj ;
				try {
					jobj = (JSONObject) json.parse(stringBuilder.toString());
					id = (String ) jobj.get("id");
					System.out.println("json id  : " + id);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
			} catch (IOException ex) {
				throw ex;
			} finally {
				if (bufferedReader != null) {
					try {
						bufferedReader.close();
					} catch (IOException ex) {
						throw ex;
					}
				}
			}
		}

		MemberVO mVO = new MemberVO();
		mVO.setId(id);
		MemberDAO mDAO = new MemberDAO();
		boolean result = mDAO.idCheck(mVO);
		String str;

		if (result)
			str = "사용하실 수 없는 아이디입니다.";
		else
			str = "사용 가능한 아이디입니다.";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("id", id);

		JSONObject jObject = new JSONObject(); 
		// JSONObject => json형식으로 만들거나, json형식의 데이터를 핸들링 할 수 있는 객체, json-simple라이브러리를 통해 사용가능
		jObject.put("map", map);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject); // 아작스입장에선 클라이언트에 response객체로 데이터를 보내는것이 됨
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
