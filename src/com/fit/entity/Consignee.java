package com.fit.entity;

import java.io.Serializable;

public class Consignee implements Serializable{
	private int cid;
	private int uid;
	private String cname;
	private String caddr;
	private String ctel;
	private String cpostcode;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCaddr() {
		return caddr;
	}
	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCpostcode() {
		return cpostcode;
	}
	public void setCpostcode(String cpostcode) {
		this.cpostcode = cpostcode;
	}
	@Override
	public String toString() {
		return "consignee [cid=" + cid + ", uid=" + uid + ", cname=" + cname
				+ ", caddr=" + caddr + ", ctel=" + ctel + ", cpostcode="
				+ cpostcode + "]";
	}
}
