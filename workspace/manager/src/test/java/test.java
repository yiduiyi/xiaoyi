
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class test {

    public static void main(String[] args) throws Exception {

        // HostnameVerifier hnv = new HostnameVerifier() {
        //     public boolean verify(String hostname, SSLSession session) {
        //         // Always return true，接受任意域名服务器
        //         return true;
        //     }
        // };
        // HttpsURLConnection.setDefaultHostnameVerifier(hnv);

        /*String UTF8 = "UTF-8";
        String reqBody = 
        		"<xml>"
        		+ "<body>测试商家-商品类目</body>"
        		+ "<trade_type>NATIVE</trade_type>"
        		+ "<mch_id>1493091612</mch_id>"
        		+ "<sign_type>HMAC-SHA256</sign_type>"
        		+ "<nonce_str>b1089cb0231011e7b7e1484520356fdc</nonce_str>"
        		+ "<detail />"
        		+ "<fee_type>CNY</fee_type>"
        		+ "<device_info>WEB</device_info>"
        		+ "<out_trade_no>20161909105959000000111108</out_trade_no>"
        		+ "<total_fee>1</total_fee>"
        		+ "<appid>wxd9579db73c42cf91</appid>"
        		+ "<notify_url>http://test.letiantian.com/wxpay/notify</notify_url>"
        		+ "<sign>78F24E555374B988277D18633BF2D4CA23A6EAF06FEE0CF1E50EA4EADEEC41A3</sign>"
        		+ "<spbill_create_ip>123.12.12.123</spbill_create_ip>"
        		+ "</xml>";
        URL httpUrl = new URL("https://14.215.140.116/pay/unifiedorder");
        HttpURLConnection httpURLConnection = (HttpURLConnection) httpUrl.openConnection();
        httpURLConnection.setRequestProperty("Host", "api.mch.weixin.qq.com");
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setConnectTimeout(10*1000);
        httpURLConnection.setReadTimeout(10*1000);
        httpURLConnection.connect();
        OutputStream outputStream = httpURLConnection.getOutputStream();
        outputStream.write(reqBody.getBytes(UTF8));

        //获取内容
        InputStream inputStream = httpURLConnection.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, UTF8));
        final StringBuffer stringBuffer = new StringBuffer();
        String line = null;
        while ((line = bufferedReader.readLine()) != null) {
            stringBuffer.append(line);
        }
        String resp = stringBuffer.toString();
        if (stringBuffer!=null) {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (inputStream!=null) {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (outputStream!=null) {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		
        System.out.println(resp);*/
    	Date d2 = new SimpleDateFormat("yyyy-MM").parse("2016-5-3");
    	
    	
    	Calendar c = Calendar.getInstance(/*TimeZone.getTimeZone("GMT+08:00")*/);    //获取东八区时间

    	c.setTime(d2);
    	c.set(Calendar.DAY_OF_MONTH, -1);
        //获取年
        int year = c.get(Calendar.YEAR);
        //获取月份，0表示1月份
        int month = c.get(Calendar.MONTH) + 1;
        //获取当前天数
        int day = c.get(Calendar.DAY_OF_MONTH);
    	
        
        Calendar   cal   =   Calendar.getInstance();
        cal.add(Calendar.DATE,   -1);
        String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
        System.out.println(yesterday);
        
    	System.out.println(c.getTime());
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
    	String t = sdf.format(new Date(1519833600000l));
    	System.out.println(t);
    	//Calendar cal = Calendar.getInstance();
    	//System.out.println("year:"+cal.get(Calendar.YEAR));
    	//System.out.println("month:"+cal.get(Calendar.MONTH));
    	StringBuffer tt = new StringBuffer();
    	tt.append("[wefa, , , , , ]");
    	String ttString = tt.subSequence(1, tt.length()-1).toString();
    	System.out.println(ttString);
    	Arrays.asList(ttString.split(","));
    	
    	
    	//JSONArray.parseArray("[wefa, , , , , ]");
    	//JSONObject.parse("[wefa, , , , , ]");
    	//Calendar cal = Calendar.getInstance();
		StringBuffer dateTime = new StringBuffer();
		dateTime.append(cal.get(Calendar.YEAR));
		if(11>cal.get(Calendar.MONTH)) {
			dateTime.append("0");
		}
		System.out.println(cal.get(Calendar.DAY_OF_MONTH));
		dateTime.append(cal.get(Calendar.MONTH));	//提现上个月的课时	
		System.out.println(dateTime.toString());
    }

}
