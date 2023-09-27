package data.dto;

import java.sql.Timestamp;

public class CartDto {
	private String idx;
	private String shopnum;
	private String num;
	private int cnt;
	private Timestamp cartday;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getShopnum() {
		return shopnum;
	}
	public void setShopnum(String shopnum) {
		this.shopnum = shopnum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getCartday() {
		return cartday;
	}
	public void setCartday(Timestamp cartday) {
		this.cartday = cartday;
	}
	
}
