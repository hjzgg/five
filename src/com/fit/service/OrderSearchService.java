package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Consignee;
import com.fit.entity.Goods;
import com.fit.entity.Order;
import com.fit.entity.Shopping;
import com.fit.entity.Users;


public class OrderSearchService {
		public int GetCid(String uid){
			int uidi;
			uidi=Integer.parseInt(uid);
			int cid;
			Dao dao=DaoCreater.createDao();
			Consignee consignee=null;
			try {
				dao.beginTransaction();
				consignee=dao.queryUniqueBean(Consignee.class, "select * from consignee where uid=?",uidi);
				dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
			cid=consignee.getCid();
			return cid;
		}
	
		public List<Order> GetOrderList(int cid,int status){
			Dao dao=DaoCreater.createDao();
			List<Order> list=null;
			try {
				dao.beginTransaction();
				System.out.println(status+"dsfgsd");
				list=dao.queryBeanList(Order.class, "select * from orders where (cid=? and ostatus=?)",cid,status);
				dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
			
			return list;
			
		}
		
		public List<Goods> GetGoodsOfOrder(int oid){
			Dao dao=DaoCreater.createDao();
			List<Goods> list=null;
			try {
				dao.beginTransaction();
				list=dao.queryBeanList(Goods.class, "select * from goods where gid in (select gid from shopping where oid=?)",oid);
				dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
			
			return list;
			
		}
		
		public int GetNum(int gid){
			int gnum;
			Dao dao=DaoCreater.createDao();
			Shopping shopping=null;
			try {
				dao.beginTransaction();
				shopping=dao.queryUniqueBean(Shopping.class, "select * from shopping where gid=?",gid);
				dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
			gnum=shopping.getSnum();
			return gnum;
		}
}
