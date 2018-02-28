package com.xiaoyi.common.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.ByteArrayOutputStream;
import java.net.URLConnection;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * 
 * @author Nan 2015-11
 */
public class HttpClient {
	private static PoolingHttpClientConnectionManager cm;
	private static String EMPTY_STR = "";
	private static String UTF_8 = "UTF-8";

	private static void init() {
		if (cm == null) {
			cm = new PoolingHttpClientConnectionManager();
			cm.setMaxTotal(50);// 整个连接池最大连接数
			cm.setDefaultMaxPerRoute(5);// 每路由最大连接数，默认值是2
		}
	}

	/**
	 * 通过连接池获取HttpClient
	 * 
	 * @return
	 */
	private static CloseableHttpClient getHttpClient() {
		init();
		return HttpClients.custom().setConnectionManager(cm).build();
	}

	/**
	 * 
	 * @param url
	 * @return
	 */
	public static String httpGetRequest(String url) {
		HttpGet httpGet = new HttpGet(url);
		return getResult(httpGet);
	}

	public static String httpGetRequest(String url, Map<String, Object> params) throws URISyntaxException {
		URIBuilder ub = new URIBuilder();
		ub.setPath(url);

		ArrayList<NameValuePair> pairs = covertParams2NVPS(params);
		ub.setParameters(pairs);

		HttpGet httpGet = new HttpGet(ub.build());
		return getResult(httpGet);
	}

	public static String httpGetRequest(String url, Map<String, Object> headers, Map<String, Object> params)
			throws URISyntaxException {
		URIBuilder ub = new URIBuilder();
		ub.setPath(url);

		ArrayList<NameValuePair> pairs = covertParams2NVPS(params);
		ub.setParameters(pairs);

		HttpGet httpGet = new HttpGet(ub.build());
		for (Map.Entry<String, Object> param : headers.entrySet()) {
			httpGet.addHeader(param.getKey(), String.valueOf(param.getValue()));
		}
		return getResult(httpGet);
	}

	public static String httpPostRequest(String url) {
		HttpPost httpPost = new HttpPost(url);
		return getResult(httpPost);
	}

	public static String httpPostRequest(String url, Map<String, Object> params) throws UnsupportedEncodingException {
		HttpPost httpPost = new HttpPost(url);
		ArrayList<NameValuePair> pairs = covertParams2NVPS(params);
		httpPost.setEntity(new UrlEncodedFormEntity(pairs, UTF_8));
		return getResult(httpPost);
	}

	public static String httpPostRequest(String url, Map<String, Object> headers, Map<String, Object> params)
			throws UnsupportedEncodingException {
		HttpPost httpPost = new HttpPost(url);

		for (Map.Entry<String, Object> param : headers.entrySet()) {
			httpPost.addHeader(param.getKey(), String.valueOf(param.getValue()));
		}

		ArrayList<NameValuePair> pairs = covertParams2NVPS(params);
		httpPost.setEntity(new UrlEncodedFormEntity(pairs, UTF_8));

		return getResult(httpPost);
	}

	private static ArrayList<NameValuePair> covertParams2NVPS(Map<String, Object> params) {
		ArrayList<NameValuePair> pairs = new ArrayList<NameValuePair>();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			pairs.add(new BasicNameValuePair(param.getKey(), String.valueOf(param.getValue())));
		}

		return pairs;
	}

	/**
	 * 处理Http请求
	 * 
	 * @param request
	 * @return
	 */
	private static String getResult(HttpRequestBase request) {
		// CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpClient httpClient = getHttpClient();
		try {
			CloseableHttpResponse response = httpClient.execute(request);
			// response.getStatusLine().getStatusCode();
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				// long len = entity.getContentLength();// -1 表示长度未知
				String result = EntityUtils.toString(entity);
				response.close();
				// httpClient.close();
				return result;
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}

		return EMPTY_STR;
	}

	public static String sendPost(String xml) throws Exception {
		// HostnameVerifier hnv = new HostnameVerifier() {
		// public boolean verify(String hostname, SSLSession session) {
		// // Always return true，接受任意域名服务器
		// return true;
		// }
		// };
		// HttpsURLConnection.setDefaultHostnameVerifier(hnv);

		String UTF8 = "UTF-8";
		String reqBody = xml;// "<xml><body>测试商家-商品类目</body><trade_type>NATIVE</trade_type><mch_id>11473623</mch_id><sign_type>HMAC-SHA256</sign_type><nonce_str>b1089cb0231011e7b7e1484520356fdc</nonce_str><detail
								// /><fee_type>CNY</fee_type><device_info>WEB</device_info><out_trade_no>20161909105959000000111108</out_trade_no><total_fee>1</total_fee><appid>wxab8acb865bb1637e</appid><notify_url>http://test.letiantian.com/wxpay/notify</notify_url><sign>78F24E555374B988277D18633BF2D4CA23A6EAF06FEE0CF1E50EA4EADEEC41A3</sign><spbill_create_ip>123.12.12.123</spbill_create_ip></xml>";
		URL httpUrl = new URL("https://14.215.140.116/pay/unifiedorder");
		HttpURLConnection httpURLConnection = (HttpURLConnection) httpUrl.openConnection();
		httpURLConnection.setRequestProperty("Host", "api.mch.weixin.qq.com");
		httpURLConnection.setDoOutput(true);
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setConnectTimeout(10 * 1000);
		httpURLConnection.setReadTimeout(10 * 1000);
		httpURLConnection.connect();
		OutputStream outputStream = httpURLConnection.getOutputStream();
		outputStream.write(reqBody.getBytes(UTF8));

		// 获取内容
		InputStream inputStream = httpURLConnection.getInputStream();
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, UTF8));
		final StringBuffer stringBuffer = new StringBuffer();
		String line = null;
		while ((line = bufferedReader.readLine()) != null) {
			stringBuffer.append(line);
		}
		String resp = stringBuffer.toString();
		if (stringBuffer != null) {
			try {
				bufferedReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (inputStream != null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (outputStream != null) {
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		System.out.println(resp);
		return resp;
	}

	public static String httpPost(String url, String data, String contentType) {
		URLConnection request = null;
		OutputStream reqStream = null;
		InputStream resStream = null;
		String respText = null;
		try {
			request = createRequest(url.trim(), "POST");
			request.setRequestProperty("Content-type", contentType);
			byte postData[] = data.getBytes("UTF-8");
			request.setRequestProperty("Content-length", String.valueOf(postData.length));
			request.setConnectTimeout(120 * 1000);
			request.setReadTimeout(120 * 1000);
			reqStream = request.getOutputStream();
			reqStream.write(postData);
			reqStream.flush();
			reqStream.close();
			ByteArrayOutputStream ms = null;
			resStream = request.getInputStream();
			ms = new ByteArrayOutputStream();
			byte buf[] = new byte[4096];
			int count;
			while ((count = resStream.read(buf, 0, buf.length)) > 0) {
				ms.write(buf, 0, count);
			}
			resStream.close();
			respText = new String(ms.toByteArray(), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respText;

	}

	private static URLConnection createRequest(String strUrl, String strMethod) throws Exception {
		URL url = new URL(strUrl);
		URLConnection conn = url.openConnection();
		conn.setDoInput(true);
		conn.setDoOutput(true);

		if (conn instanceof HttpsURLConnection) {
			HttpsURLConnection httpsConn = (HttpsURLConnection) conn;
			httpsConn.setRequestMethod(strMethod);
			httpsConn.setSSLSocketFactory(getSSLSF());
			httpsConn.setHostnameVerifier(simpleVerifier);
		} else if (conn instanceof HttpURLConnection) {
			HttpURLConnection httpConn = (HttpURLConnection) conn;
			httpConn.setRequestMethod(strMethod);
		}
		return conn;
	}

	public static synchronized SSLSocketFactory getSSLSF() throws Exception {
		if (sslFactory != null) {
			return sslFactory;
		} else {
			SSLContext sc = SSLContext.getInstance("SSLv3");
			sc.init(null, new TrustManager[] { simpleVerifier }, null);
			sslFactory = sc.getSocketFactory();
			return sslFactory;
		}
	}

	private static class SSLHandler implements X509TrustManager, HostnameVerifier {
		public void checkClientTrusted(X509Certificate ax509certificate[], String s) throws CertificateException {
		}

		public void checkServerTrusted(X509Certificate ax509certificate[], String s) throws CertificateException {
		}

		public X509Certificate[] getAcceptedIssuers() {
			return null;
		}

		public boolean verify(String arg0, SSLSession arg1) {
			return true;
		}

		private SSLHandler() {
		}

		SSLHandler(SSLHandler sslhandler) {
			this();
		}
	}

	private static final SSLHandler simpleVerifier = new SSLHandler(null);
	private static SSLSocketFactory sslFactory;

}