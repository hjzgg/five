package com.fit.service;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;

public class AddService {
 /*Ìí¼Ó*/
   public void comeIn(String gid,String mid,String gname,String gtype,String gkindtype,String gprice,String ghot,String gsales,String gtime,String gimg,String gnum,String gcount,String gdetail){
   Dao dao=DaoCreater.createDao();
   Goods goods=null;
   try {
	  dao.beginTransaction();
	  goods=dao.queryUniqueBean(Goods.class, "select * from goods where gtype=? and gkindcode=? and gname=?", gtype,gkindtype,gname);
	  if(goods!=null){
		 PreSQL predql=dao.preSQL("update goods set gnum=? where gid="+goods.getGid());
		 predql.update(gnum);
	  }else{
		  PreSQL predql=dao.preSQL("insert into goods values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		  predql.update(null,mid,gname,gtype,gkindtype,gprice,ghot,gsales,gtime,gimg,gnum,gcount,gdetail);

	  }
	  dao.commitTransaction();
	} catch (Exception e) {
		e.printStackTrace();
		dao.rollbackTransaction();
	}finally{
		dao.close();
	}
}
}
