package com.fit.service;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;

public class GoodsNumService {
	public void modify(int gid,int cc, boolean flag){
		   Dao dao=DaoCreater.createDao();
		   Goods goods=null;
		   int gnum;
		   try {
			  dao.beginTransaction();
			  goods=dao.queryUniqueBean(Goods.class, "select * from goods where gid=?", gid);
			  gnum=Integer.parseInt(goods.getGnum());
			  if(flag)
				  gnum=gnum-cc;
			  else gnum=gnum+cc;
			  PreSQL predql=dao.preSQL("update goods set gnum=? where gid="+gid);
			  predql.update(gnum);
			  dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
		}
	
	public Goods getCartGood(int gid){
		   Dao dao=DaoCreater.createDao();
		   Goods goods=null;
		   int gnum;
		   try {
			  dao.beginTransaction();
			  goods=dao.queryUniqueBean(Goods.class, "select * from goods where gid=?", gid);
			  gnum=Integer.parseInt(goods.getGnum());
			  dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
		   return goods;
	}
}
