package dbc0;

public class NmemberVO {
	private String n_id;
	private String n_passwd;
	private String n_subemail;
	private String n_name;
	private String n_age;
	private String n_gd;
	private String n_nat;
	private String n_hpcp;
	private String n_hp;
	
	public NmemberVO(String n_id, String n_passwd, String n_subemail, String n_name, String n_age, String n_gd,
			String n_nat, String n_hpcp, String n_hp) {
		this.n_id = n_id;
		this.n_passwd = n_passwd;
		this.n_subemail = n_subemail;
		this.n_name = n_name;
		this.n_age = n_age;
		this.n_gd = n_gd;
		this.n_nat = n_nat;
		this.n_hpcp = n_hpcp;
		this.n_hp = n_hp;
	}
	
	public NmemberVO(String n_id, String n_passwd) {
		this.n_id = n_id;
		this.n_passwd = n_passwd;
	}

	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getN_passwd() {
		return n_passwd;
	}

	public void setN_passwd(String n_passwd) {
		this.n_passwd = n_passwd;
	}

	public String getN_subemail() {
		return n_subemail;
	}

	public void setN_subemail(String n_subemail) {
		this.n_subemail = n_subemail;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_age() {
		return n_age;
	}

	public void setN_age(String n_age) {
		this.n_age = n_age;
	}

	public String getN_gd() {
		return n_gd;
	}

	public void setN_gd(String n_gd) {
		this.n_gd = n_gd;
	}

	public String getN_nat() {
		return n_nat;
	}

	public void setN_nat(String n_nat) {
		this.n_nat = n_nat;
	}

	public String getN_hpcp() {
		return n_hpcp;
	}

	public void setN_hpcp(String n_hpcp) {
		this.n_hpcp = n_hpcp;
	}

	public String getN_hp() {
		return n_hp;
	}

	public void setN_hp(String n_hp) {
		this.n_hp = n_hp;
	}

	@Override
	public String toString() {
		return "[아이디 =" + n_id + ", 비밀번호 =" + n_passwd + ", 서브이메일 =" + n_subemail + ", 이름 ="
				+ n_name + ", 생년월일 =" + n_age + ", 성별 =" + n_gd + ", 국적 =" + n_nat + ", 통신사 =" + n_hpcp + ", 핸드폰번호 ="
				+ n_hp + "]";
	}
	
	
	
}
