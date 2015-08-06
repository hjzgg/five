package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Goods;

public class ShowChooseFoodService {
	public Goods GetGoods(String gid){
		Dao dao=DaoCreater.createDao();
		Goods goods=null;
		int gidi;
		gidi=Integer.parseInt(gid);
		try {
			dao.beginTransaction();
			goods=dao.queryUniqueBean(Goods.class,"select * from goods where gid=?",gidi);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goods;
	}
	
	public List<Goods> getSimilarFood(int gtype){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodsList=null;
		try {
			dao.beginTransaction();
			goodsList=dao.queryBeanList(Goods.class,"select * from goods where gtype=?", gtype);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodsList;
	}
}
