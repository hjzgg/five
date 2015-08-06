package com.fit.service;

import java.util.List;

import com.fit.dao.Dao;
import com.fit.dao.DaoCreater;
import com.fit.dao.PreSQL;
import com.fit.entity.Users;

public class UserService {
/**
 * �û���½
 */
	public Users login(String username,String password){
		Dao dao=DaoCreater.createDao();
		Users user=null;
		try {
			dao.beginTransaction();
			user=dao.queryUniqueBean(Users.class, "select * from users where username=? and password=?", username,password);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return user;
	}
	/**
	 * ��ѯ�����û�
	 */
	public List<Users> getAllUser(){
		Dao dao=DaoCreater.createDao();
		List<Users> list=null;
		try {
			dao.beginTransaction();
			list=dao.queryBeanList(Users.class, "select * from users");
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return list;
	}

	/**
	 * �û��Ƿ����
	 * @param username
	 * @return
	 */
	public Boolean existed(String username){
		Dao dao=DaoCreater.createDao();
		Users user=null;
		try {
			dao.beginTransaction();
			user=dao.queryUniqueBean(Users.class, "select * from users where username=?", username);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		if(user==null){
			return false;
		}
		else return true;
	}
	/**
	 * ɾ��
	 */
   public void delete(int[] userid){
   Dao dao=DaoCreater.createDao();
   try {
	  dao.beginTransaction();
	  PreSQL predql=dao.preSQL("delete from users where username=?");
	   if(userid.length>0){
		   for (int i = 0; i < userid.length; i++) {
			   predql.update(userid[i]);
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
   
   public Users comeIn(String username,String password){
	   Dao dao=DaoCreater.createDao();
	   Users users=null;
	   try {
		   	  dao.beginTransaction();
			  PreSQL predql=dao.preSQL("insert into users values(?,?,?,?,?,?)");
			  predql.update(null,username,password,null,null,null);
			  dao.commitTransaction();
		}
	   	catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
	   	}
	   	finally{
			dao.close();
		}
	   return users;
	}
   
   public Users GetUser(String username){
		Dao dao=DaoCreater.createDao();
		Users user=null;
		try {
			dao.beginTransaction();
			user=dao.queryUniqueBean(Users.class, "select * from users where username=?", username);
			dao.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			dao.rollbackTransaction();
		}finally{
			dao.close();
		}
		return user;
	}
   
}
