package com.fit.service;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Consignee;
import com.fit.entity.Order;
import com.fit.entity.Users;

public class ShoppingService {
	public void ComeInConsignee(int uid,String cname,String caddr,String ctel,String cpostcode){
		   Dao dao=DaoCreater.createDao();
		   try {
			   dao.beginTransaction();
			   PreSQL predql=dao.preSQL("insert into consignee values(?,?,?,?,?,?)");
			   predql.update(null,uid,cname,caddr,ctel,cpostcode);
			   dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
	}
	
	public Consignee GetConsignee(int uid){
		Dao dao=DaoCreater.createDao();
		Consignee consignee=null;
		try {
			dao.beginTransaction();
			consignee=dao.queryUniqueBean(Consignee.class, "select * from consignee where uid=?", uid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return consignee;
	}
	
	public void ComeInOrder(int cid,String otime){
		   Dao dao=DaoCreater.createDao();
		   try {
			   dao.beginTransaction();
			   PreSQL predql=dao.preSQL("insert into orders values(?,?,?,?)");
			   predql.update(null,cid,otime, 0);
			   dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
	}
	
	public Order GetOrder(int cid){
		Dao dao=DaoCreater.createDao();
		Order order=null;
		try {
			dao.beginTransaction();
			order=dao.queryUniqueBean(Order.class, "select * from orders where cid=?", cid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return order;
	}
	
	public void ComeInShopping(int gid,int oid,String gnum){
		   Dao dao=DaoCreater.createDao();
		   try {
			   dao.beginTransaction();
			   PreSQL predql=dao.preSQL("insert into shopping values(?,?,?,?)");
			   predql.update(null,gid,oid,gnum);
			   dao.commitTransaction();
			} catch (Exception e) {
				e.printStackTrace();
				dao.rollbackTransaction();
			}finally{
				dao.close();
			}
	}
}
