package com.fit.type;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;


public class Five {
	
	public Five(){
		init();
	}
	
	public  String[] haha = {"��װ","��Ʒ", "��ʳ","�����豸","ͼ��","�Ҿ�"};
	
	private String[] close={"Ůʿ����","Ůʿ����","ŮЬ","��ʿ����","��ʿ����","��Ь","Ůʿ���","��ʿ���"};
	private String[] wearing={"����","����","����","����","����","�۾�"};
	private String[] food={"�й���","���","��ʽ����","��ʽ����","̩������"};
	private String[] elect={"�ֻ�","�ֻ����","����","�������","���","��ӡ��","�����"};
	private String[] book={"���","����","��ѧ","С˵","�����","�汾"};
	private String[] home={"������Ʒ","��Ӥ��Ʒ","������Ʒ","�����Ʒ","����"};
	
	private ArrayList<String[]> al = new ArrayList<String[]>();
	   
	private Map<String, String[]> mp  = new LinkedHashMap<String, String[]>();
    private void init(){
    	 al.add(close);
 	     al.add(wearing);
 		 al.add(food);
 	     al.add(elect);
 		 al.add(book);
 	     al.add(home);
 	
	 	for(int i=0; i<haha.length; ++i){
	 		mp.put(haha[i], al.get(i));
	 	}
    }
    
    public Map<String, String[]> getGoods(){
    	return mp;
    }

}

