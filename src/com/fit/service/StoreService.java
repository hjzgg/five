package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Goods;
import com.fit.entity.Merchant;

/**
 * Servlet implementation class StoreService
 */
public class StoreService {
/**
 * 信息查询
 */
	public Merchant display(String mid){
		Dao dao=DaoCreater.createDao();
		Merchant merchant=null;
		try {
			dao.beginTransaction();
			merchant=dao.queryUniqueBean(Merchant.class, "select * from merchant where mid=?", mid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return merchant;
	}
	public List<Goods> supply(String mid){
		Dao dao=DaoCreater.createDao();
		List<Goods> merchantgoods=null;
		try {
			dao.beginTransaction();
			merchantgoods=dao.queryBeanList(Goods.class, "select * from goods where mid=?", mid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return merchantgoods;
	}
	
	public List<Goods> popular(String mid){
		Dao dao=DaoCreater.createDao();
		List<Goods> populargoods=null;
		try {
			dao.beginTransaction();
			populargoods=dao.queryBeanList(Goods.class, "select * from goods where mid=? order by gsales desc", mid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return populargoods;
	}
	
	public List<Goods> dateup(String mid){
		Dao dao=DaoCreater.createDao();
		List<Goods> dategoods=null;
		try {
			dao.beginTransaction();
			dategoods=dao.queryBeanList(Goods.class, "select * from goods where mid=? order by gtime desc", mid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return dategoods;
	}
	/**
	 * 查询所有商家
	 */
	public List<Merchant> getAllMerchant(){
		Dao dao=DaoCreater.createDao();
		List<Merchant> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Merchant.class, "select * from merchant");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return list;
	}

}