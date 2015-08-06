package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Goods;
import com.fit.entity.Merchant;

public class IndexSearchService {
	public List<Goods> GetGoodsBysql(String sql){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class,"select * from goods where gname like \'%"+sql+"%\'");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	
	public List<Goods> GetGoods(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	
	public List<Merchant> GetMerchantBysql(String sql){
		Dao dao=DaoCreater.createDao();
		List<Merchant> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Merchant.class,"select * from merchant where mname like \'%"+sql+"%\'");
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
