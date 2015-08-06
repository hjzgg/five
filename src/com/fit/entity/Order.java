package com.fit.entity;

import java.io.Serializable;

public class Order implements Serializable{
	private int oid;
	private int cid;
	private String otime;
	private int ostatus;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public int getOstatus() {
		return ostatus;
	}
	public void setOstatus(int ostatus) {
		this.ostatus = ostatus;
	}
	@Override
	public String toString() {
		return "order [oid=" + oid + ", cid=" + cid + ", otime=" + otime
				+ ", ostatus=" + ostatus + "]";
	}
}
