package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;

public class AlterService {

	/**
	 * ÐÞ¸Ä
	 */
   public void modify(String gid,String gname,String gprice,String gimg,String gtype,String gkindcode,String gcount){
   Dao dao=DaoCreater.createDao();
   try {
	  dao.beginTransaction();
	  PreSQL predql=dao.preSQL("update goods set gname=?,gprice=?,gimg=?,gtype=?,gkindcode=?,gcount=? where gid="+gid);
	  predql.update(gname,gprice,gimg,gtype,gkindcode,gcount);
	  dao.commitTransaction();
	} catch (Exception e) {
		e.printStackTrace();
		dao.rollbackTransaction();
	}finally{
		dao.close();
	}
}
}
