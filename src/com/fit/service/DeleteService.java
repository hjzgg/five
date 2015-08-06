package com.fit.service;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;

public class DeleteService {
 /*Ìí¼Ó*/
   public void delete(String gid){
   Dao dao=DaoCreater.createDao();
   Goods goods=null;
   int gidi;
   gidi=Integer.parseInt(gid);
   try {
	  dao.beginTransaction();
	  PreSQL predql=dao.preSQL("delete from goods where gid=?");
	  predql.update(gidi);
	  dao.commitTransaction();
	} catch (Exception e) {
		e.printStackTrace();
		dao.rollbackTransaction();
	}finally{
		dao.close();
	}
}
}