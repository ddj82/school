package mcd;

public class McdOlistVO {
	private String order_num;
	private String order_pn;
	private String order_adr;
	private String order_req;
	private String order_nm;
	private String order_nick;
	private String order_status;
	private String order_ma;
	private String order_br;
	private String order_dt;
	private int order_menuno;
	private int order_ea;
	private int order_tot;

	public McdOlistVO(String order_num, String order_pn, String order_adr, String order_req, String order_nm,
			String order_nick, String order_status, String order_ma, String order_br, String order_dt, int order_menuno,
			int order_ea, int order_tot) {
		this.order_num = order_num;
		this.order_pn = order_pn;
		this.order_adr = order_adr;
		this.order_req = order_req;
		this.order_nm = order_nm;
		this.order_nick = order_nick;
		this.order_status = order_status;
		this.order_ma = order_ma;
		this.order_br = order_br;
		this.order_dt = order_dt;
		this.order_menuno = order_menuno;
		this.order_ea = order_ea;
		this.order_tot = order_tot;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getOrder_pn() {
		return order_pn;
	}

	public void setOrder_pn(String order_pn) {
		this.order_pn = order_pn;
	}

	public String getOrder_adr() {
		return order_adr;
	}

	public void setOrder_adr(String order_adr) {
		this.order_adr = order_adr;
	}

	public String getOrder_req() {
		return order_req;
	}

	public void setOrder_req(String order_req) {
		this.order_req = order_req;
	}

	public String getOrder_nm() {
		return order_nm;
	}

	public void setOrder_nm(String order_nm) {
		this.order_nm = order_nm;
	}

	public String getOrder_nick() {
		return order_nick;
	}

	public void setOrder_nick(String order_nick) {
		this.order_nick = order_nick;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_ma() {
		return order_ma;
	}

	public void setOrder_ma(String order_ma) {
		this.order_ma = order_ma;
	}

	public String getOrder_br() {
		return order_br;
	}

	public void setOrder_br(String order_br) {
		this.order_br = order_br;
	}

	public String getOrder_dt() {
		return order_dt;
	}

	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}

	public int getOrder_menuno() {
		return order_menuno;
	}

	public void setOrder_menuno(int order_menuno) {
		this.order_menuno = order_menuno;
	}

	public int getOrder_ea() {
		return order_ea;
	}

	public void setOrder_ea(int order_ea) {
		this.order_ea = order_ea;
	}

	public int getOrder_tot() {
		return order_tot;
	}

	public void setOrder_tot(int order_tot) {
		this.order_tot = order_tot;
	}

	@Override
	public String toString() {
		return "[주문접수: " + order_status + " 주문번호: " + order_num + " 주문일자: " + order_dt + " 주문자명: " + order_nick
				+ " 연락처: " + order_pn + " 주소: " + order_adr + " 요청사항: " + order_req + " 주문담당자: " + order_ma + " 지점:"
				+ order_br + "]";
	}
}
