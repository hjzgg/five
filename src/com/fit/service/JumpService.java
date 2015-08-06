package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Goods;


public class JumpService {
/**
 *商品识别：
 */
	
	public List<Goods> getDiscountGoods(String showid){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodslist=null;
		try {
			dao.beginTransaction();
			goodslist=dao.queryBeanList(Goods.class, "select * from goods where gtype="+showid+" order by gcount desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodslist;
	}
	public List<Goods> getPopularGoods(String showid){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodslist=null;
		try {
			dao.beginTransaction();
			goodslist=dao.queryBeanList(Goods.class, "select * from goods where gtype="+showid+" order by gsales desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodslist;
	}
	
	public List<Goods> getNewGoods(String showid){
		Dao dao=DaoCreater.createDao();
		List<Goods> goodslist=null;
		try {
			dao.beginTransaction();
			goodslist=dao.queryBeanList(Goods.class, "select * from goods where gtype="+showid+" order by gtime desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return goodslist;
	}
}