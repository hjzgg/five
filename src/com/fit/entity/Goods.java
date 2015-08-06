package com.fit.entity;

import java.io.Serializable;

public class Goods implements Serializable{
	private int gid;
	private int sid;
	private int mid;
	private String gname;
	private int gtype;
	private int gkindcode;
	private String gprice;
	private int ghot;
	private int gsales;
	private String gtime;
	private String gimg;
	private String gnum;
	private String gcount;
	private String gdetail;
	
	public Goods(){
	}
	
	public Goods(int gid, int sid, int mid, String gname, int gtype,
			int gkindcode, String gprice, int ghot, int gsales, String gtime,
			String gimg, String gnum, String gcount, String gdetail) {
		super();
		this.gid = gid;
		this.sid = sid;
		this.mid = mid;
		this.gname = gname;
		this.gtype = gtype;
		this.gkindcode = gkindcode;
		this.gprice = gprice;
		this.ghot = ghot;
		this.gsales = gsales;
		this.gtime = gtime;
		this.gimg = gimg;
		this.gnum = gnum;
		this.gcount = gcount;
		this.gdetail = gdetail;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGtype() {
		return gtype;
	}
	public void setGtype(int gtype) {
		this.gtype = gtype;
	}
	public int getGkindcode() {
		return gkindcode;
	}
	public void setGkindcode(int gkindcode) {
		this.gkindcode = gkindcode;
	}
	public String getGprice() {
		return gprice;
	}
	public void setGprice(String gprice) {
		this.gprice = gprice;
	}
	public int getGhot() {
		return ghot;
	}
	public void setGhot(int ghot) {
		this.ghot = ghot;
	}
	public int getGsales() {
		return gsales;
	}
	public void setGsales(int gsales) {
		this.gsales = gsales;
	}
	public String getGtime() {
		return gtime;
	}
	public void setGtime(String gtime) {
		this.gtime = gtime;
	}
	public String getGimg() {
		return gimg;
	}
	public void setGimg(String gimg) {
		this.gimg = gimg;
	}
	public String getGnum() {
		return gnum;
	}
	public void setGnum(String gnum) {
		this.gnum = gnum;
	}
	public String getGcount() {
		return gcount;
	}
	public void setGcount(String gcount) {
		this.gcount = gcount;
	}
	public String getGdetail() {
		return gdetail;
	}
	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}
	@Override
	public String toString() {
		return "goods [gid=" + gid + ", sid=" + sid + ", mid=" + mid
				+ ", gname=" + gname + ", gtype=" + gtype + ", gkindcode="
				+ gkindcode + ", gprice=" + gprice + ", ghot=" + ghot
				+ ", gsales=" + gsales + ", gtime=" + gtime + ", gimg=" + gimg
				+ ", gnum=" + gnum + ", gcount=" + gcount + ", gdetail="
				+ gdetail + "]";
	}
}
