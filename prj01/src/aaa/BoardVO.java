package aaa;

public class BoardVO {
	private int id; //0 
	private String writer; //"dkdkd"
	private String passwd; //"1111"
	private String subject; //"ddddd"
	private String email; //"dddd"

	public BoardVO(int id, String writer, String passwd, String subject,
			String email) {
		//0, "dkdkd", "1111", "ddddd", "dddd"
		this.id = id;
		this.writer = writer;
		this.passwd = passwd;
		this.subject = subject;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "id = " + id + ", 작성자 = " + writer + ", 제목 = " + subject
				+ ", 이메일 = " + email;
	}
}
