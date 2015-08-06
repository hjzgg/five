package com.fit.entity;

import java.io.Serializable;

public class Merchant implements Serializable{
	private int mid;
	private String mname;
	private String mtel;
	private String maddr;
	private int matype;
	private String mimg;
	private String mdetail;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getMdetail() {
		return mdetail;
	}
	public void setMdetail(String mdetail) {
		this.mdetail = mdetail;
	}
	public int getMatype() {
		return matype;
	}
	public void setMatype(int matype) {
		this.matype = matype;
	}
	@Override
	public String toString() {
		return "Merchant [mid=" + mid + ", mname=" + mname + ", mtel=" + mtel
				+ ", maddr=" + maddr + ", matype=" + matype + ", mimg=" + mimg
				+ ", mdetail=" + mdetail + "]";
	}
	
}