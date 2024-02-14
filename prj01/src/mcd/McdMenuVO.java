package mcd;

public class McdMenuVO {
	private String menu_cat;
	private int menu_no;
	private String menu_nm;
	private int menu_pr;
	private int menu_wg;
	private int menu_ml;
	private double menu_k;
	private double menu_su;
	private double menu_d;
	private double menu_f;
	private double menu_n;
	private double menu_c;
	private String menu_dc;
	
	public McdMenuVO(String menu_cat, int menu_no, String menu_nm, int menu_pr, int menu_wg, int menu_ml, double menu_k,
			double menu_su, double menu_d, double menu_f, double menu_n, double menu_c, String menu_dc) {
		this.menu_cat = menu_cat;
		this.menu_no = menu_no;
		this.menu_nm = menu_nm;
		this.menu_pr = menu_pr;
		this.menu_wg = menu_wg;
		this.menu_ml = menu_ml;
		this.menu_k = menu_k;
		this.menu_su = menu_su;
		this.menu_d = menu_d;
		this.menu_f = menu_f;
		this.menu_n = menu_n;
		this.menu_c = menu_c;
		this.menu_dc = menu_dc;
	}
	public String getMenu_cat() {
		return menu_cat;
	}
	public void setMenu_cat(String menu_cat) {
		this.menu_cat = menu_cat;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public int getMenu_pr() {
		return menu_pr;
	}
	public void setMenu_pr(int menu_pr) {
		this.menu_pr = menu_pr;
	}
	public int getMenu_wg() {
		return menu_wg;
	}
	public void setMenu_wg(int menu_wg) {
		this.menu_wg = menu_wg;
	}
	public int getMenu_ml() {
		return menu_ml;
	}
	public void setMenu_ml(int menu_ml) {
		this.menu_ml = menu_ml;
	}
	public double getMenu_k() {
		return menu_k;
	}
	public void setMenu_k(double menu_k) {
		this.menu_k = menu_k;
	}
	public double getMenu_su() {
		return menu_su;
	}
	public void setMenu_su(double menu_su) {
		this.menu_su = menu_su;
	}
	public double getMenu_d() {
		return menu_d;
	}
	public void setMenu_d(double menu_d) {
		this.menu_d = menu_d;
	}
	public double getMenu_f() {
		return menu_f;
	}
	public void setMenu_f(double menu_f) {
		this.menu_f = menu_f;
	}
	public double getMenu_n() {
		return menu_n;
	}
	public void setMenu_n(double menu_n) {
		this.menu_n = menu_n;
	}
	public double getMenu_c() {
		return menu_c;
	}
	public void setMenu_c(double menu_c) {
		this.menu_c = menu_c;
	}
	public String getMenu_dc() {
		return menu_dc;
	}
	public void setMenu_dc(String menu_dc) {
		this.menu_dc = menu_dc;
	}
	@Override
	public String toString() {
		return "상품정보 [상품종류= " + menu_cat + ", 상품번호= " + menu_no + ", 상품명= " + menu_nm + ", 가격= "
				+ menu_pr + ", 중량(g)= " + menu_wg + ", 중량(ml)= " + menu_ml + ", 열량= " + menu_k + ", 당= "
				+ menu_su + ", 단백질= " + menu_d + ", 포화지방= " + menu_f + ", 나트륨= " + menu_n + ", 카페인= " + menu_c
				+ ", 설명= " + menu_dc + "]";
	}
	
	
	
}
