import java.util.Calendar;

import org.json.JSONObject;

public class InterfaceTest {
	public static void main(String args[]){
		XiaoeSDK sdk  = 
				new XiaoeSDK("appRAaH1Owm4672", "pvTAXrQEfGpXK4n6jLoaxuK79YtXpGoX"); 
	
		//TreeMap<String,Object> params = new TreeMap<String,Object>();
		//params.put("phone", "18711019949");
		
		//String sign = sdk.getSign(params);
		
		JSONObject data = new JSONObject();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, 8);
		cal.set(Calendar.DAY_OF_MONTH, 29);
		System.out.println(cal.getTime().getTime()/1000);
		//data.put("begin_time", cal.getTimeInMillis()/1000);
		
		//cal.set(Calendar.DAY_OF_MONTH,30);
		//System.out.println(cal.getTime());
		//data.put("end_time", cal.getTimeInMillis()/1000);
		
		
		//用户下单	
		/*data.put("payment_type", 3);//'payment_type':2,
        //data.put("resource_type", 3);//'resource_type':1,
        //data.put("resource_id", "p_5bb6e34718b2d_HlWYvm9z");//'resource_id':'i_sdasdasdews53vkjor',
        data.put("product_id", "p_5bbae4bbb897d_tlSqih5L"); //'product_id':'0',
        data.put("user_id", "u_api_5bb2e490e45ea_c0AI0ghC");//'user_id':'u_asdwjdnjkxkcasjb3847832478',
        data.put("out_order_id", UUID.randomUUID().toString());//'out_order_id':'order_2017564065'
        JSONObject rs = sdk.send("orders.create", data, 1, "1.0");*/
		
        //更新订单状态
		/*data.put("order_id", "o_1538985488_5bbb0e10a2e07_64353197");
		data.put("order_state", "1");
		JSONObject rs = sdk.send("orders.state.update", data, 1, "1.0");*/
        
		
		//JSONObject rs = sdk.send("purchase.list.get", data, 1, "1.0");
		//JSONObject rs = sdk.send("order.list.get", data, 1, "2.0");
		
		//获取用户信息
		//data.put("phone", "18711019949");		
		data.put("wx_union_id", "jsfkaweifajwlejfalweijfawiewieji");
		JSONObject rs = sdk.send("users.getinfo", data, 1, "1.0");
		
		//用户注册
		/*data.put("phone", "18711018888");	
		data.put("nick_name", "高级老师2");
		data.put("user_tag", "teacher");
		da*/
	}
}