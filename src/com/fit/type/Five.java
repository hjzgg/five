package com.fit.type;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;


public class Five {
	
	public Five(){
		init();
	}
	
	public  String[] haha = {"服装","饰品", "美食","电子设备","图书","家居"};
	
	private String[] close={"女士上衣","女士下衣","女鞋","男士上衣","男士下衣","男鞋","女士箱包","男士箱包"};
	private String[] wearing={"手链","脚链","胸针","项链","腰链","眼镜"};
	private String[] food={"中国菜","快餐","日式料理","韩式料理","泰国料理"};
	private String[] elect={"手机","手机配件","电脑","电脑配件","相机","打印机","传真机"};
	private String[] book={"社科","人文","文学","小说","计算机","绘本"};
	private String[] home={"生活用品","妇婴用品","床上用品","清洁用品","炊具"};
	
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

