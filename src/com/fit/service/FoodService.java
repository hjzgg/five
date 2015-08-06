package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;


public class FoodService {
	
	public Goods getGood(int gid){
		Dao dao=DaoCreater.createDao();
		Goods good = null;
		try {
			dao.beginTransaction();
			good=dao.queryUniqueBean(Goods.class, "select * from goods where gid=?", gid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return good;
	}
	
/**
 *商品识别：
 */
	public List<Goods> supply(String typeid,String foodid){
		Dao dao=DaoCreater.createDao();
		List<Goods> goods=null;
		try {
			dao.beginTransaction();
			goods=dao.queryBeanList(Goods.class, "select * from goods where gtype=? and gkindcode=?", typeid,foodid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goods;
	}
	/**
	 * 查询所有商品
	 */
	public List<Goods> getAllGoods(){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodslist=null;
		try {
			dao.beginTransaction();
			goodslist=dao.queryBeanList(Goods.class, "select * from goods");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodslist;
	}
    
	public List<Goods> getDiscountGoods(String type){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodslist=null;
		try {
			dao.beginTransaction();
			goodslist=dao.queryBeanList(Goods.class, "select * from goods where gtype="+type+" order by gcount desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodslist;
	}
	/**
	 * 删除
	 */
   public void delete(int[] gid){
   Dao dao=DaoCreater.createDao();
   try {
	  dao.beginTransaction();
	  PreSQL predql=dao.preSQL("delete from goods where gid=?");
	   if(gid.length>0){
		   for (int i = 0; i < gid.length; i++) {
			   predql.update(gid[i]);
		}
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