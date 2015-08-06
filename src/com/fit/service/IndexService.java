package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Goods;

public class IndexService {
	public List<Goods> GetGoodsByhot(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods order by ghot desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	public List<Goods> GetGoodsBysales(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods order by gsales desc");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	
	public List<Goods> GetGoodsByoverseas(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods where mid=(select mid from merchant where matype=\'1\')");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	
	public List<Goods> GetGoodsBycount(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods order by gcount");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		
		return list;
		
	}
	public List<Goods> GetGoodsBydelicous(){
		Dao dao=DaoCreater.createDao();
		List<Goods> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Goods.class, "select * from goods order by gsales desc,gnum desc");
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
