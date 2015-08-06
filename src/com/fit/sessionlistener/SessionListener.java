package com.fit.sessionlistener;

import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.fit.entity.Goods;
import com.fit.service.GoodsNumService;

public class SessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent arg0) {
		 HttpSession session = arg0.getSession();
         session.setMaxInactiveInterval(1200);//ͨ������session�Ĺ��ڵ�ʱ�����ƶ������Ĺ���ʱ�䣡
         session.setAttribute("cart", new TreeMap<Integer, Goods>());
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {//ɾ�����ﳵ
		HttpSession session = arg0.getSession();
		Map<Integer, Goods> cart = (Map<Integer, Goods>)session.getAttribute("cart");
		for(Integer i : cart.keySet()){
			Goods good = cart.get(i);
			GoodsNumService gns=new GoodsNumService();
			gns.modify(i, Integer.parseInt(good.getGnum()), false);
		}
		session.removeAttribute("cart");
	}
}
