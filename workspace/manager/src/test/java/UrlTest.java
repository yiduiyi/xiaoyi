import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class UrlTest {
	public static void main(String args[]) {
		System.out.println("test");
		
		String UTF8 = "UTF-8";
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
		try {
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
