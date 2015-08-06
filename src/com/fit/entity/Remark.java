package com.fit.entity;

import java.io.Serializable;

public class Remark implements Serializable{
	private int rid;
	private int gid;
	private int uid;
	private String rcon;
	private String rtime;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getRcon() {
		return rcon;
	}
	public void setRcon(String rcon) {
		this.rcon = rcon;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	@Override
	public String toString() {
		return "remark [rid=" + rid + ", gid=" + gid + ", uid=" + uid
				+ ", rcon=" + rcon + ", rtime=" + rtime + "]";
	}
}
