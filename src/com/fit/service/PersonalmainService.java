package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.entity.Consignee;

public class PersonalmainService {
	public List<Consignee> display(String uid){
		Dao dao=DaoCreater.createDao();
		List<Consignee> clist=null;
		try {
			dao.beginTransaction();
			clist=dao.queryBeanList(Consignee.class, "select * from consignee where uid=?", uid);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return clist;
	}
}
