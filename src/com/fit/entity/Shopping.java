package com.fit.entity;

import java.io.Serializable;

public class Shopping implements Serializable{
	private int sid;
	private int gid;
	private int oid;
	private int snum;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	@Override
	public String toString() {
		return "shopping [sid=" + sid + ", gid=" + gid + ", oid=" + oid
				+ ", snum=" + snum + "]";
	}
}
