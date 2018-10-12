package com.xiaoyi.common.utils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;
import java.util.TreeMap;

public class XiaoeSDK {
    private String appId = "appId";   //你的appid
    private String appSecret = "appSecret";   //小鹅的秘钥
    private int useType=0;       //数据的使用场景 可根据实际实际情况传入0-服务端自用，1-iOS，2-android，3-pc浏览器，4-手机浏览器
    private String version="1.0";    //接口版本数

    public XiaoeSDK(String appId, String appSecret){
        this.appId = appId;
        this.appSecret = appSecret;
    }

    /**
     *  发送请求
     * @param cmd 请求命令字
     * @param data 请求接口数据
     * @param useType   使用场景
     * @param version   接口版本
     * @return
     */
    public  JSONObject send(String cmd, Object data, int useType, String version){
        String url = "http://api.xiaoe-tech.com/open/"+cmd+"/"+version;
        TreeMap<String, Object> params = new TreeMap<String, Object>();
        params.put("use_type", useType);
        params.put("app_id",this.appId);
        params.put("data",data);
        params.put("timestamp", System.currentTimeMillis());
        JSONObject paramsJson = null;
        paramsJson = this.getParamsJson(params);//获取带有sign的json对象
        String result = "";
        result = this.postsend(url,paramsJson);
        JSONObject JSONResult = new JSONObject(result);

        return JSONResult;
    }

    /**
     * 获取请求体的json
     * @param data
     * @return
     */
    private  JSONObject getParamsJson(TreeMap data){
        String paramStr = "";
        String sign = "";
        sign = this.getSign(data);
        data.put("sign", sign);
        JSONObject json=new JSONObject(data);
        return json;

    }

    /**
     *生成签名
     * @param data
     * @return
     */
    public  String getSign(TreeMap<String, Object> data){
        String str = "";
        for (String key : data.keySet()) {
            if (!(str=="")) {
                str += '&';
            }
            try {
                Object value  = data.get(key);
                String vstr = "";
                if(value instanceof Map){
                    TreeMap treeofO = (TreeMap)data.get(key);
                    JSONObject json=new JSONObject(treeofO);
                    vstr = json.toString();
                }else if(value instanceof Map[]){
                    JSONArray json =  new JSONArray(value);
                    vstr = json.toString();
                    System.out.println(vstr);
                }else{
                    vstr = data.get(key).toString();
                }
                str += key + '='
                        + vstr;

            } catch (Exception e) {
                return "";
            }
        }
        str += "&app_secret="+ this.appSecret;
        String sign ="";
        System.out.println(str);
        sign = MD5.stringToMD5(str);
        return sign;
    }

    /**
     * 提交请求
     * @param url
     * @param data
     * @return
     */
    public  String postsend(String url, JSONObject data){
        HttpClient httpClient = HttpClientBuilder.create().build(); //Use this instead
        String str = "";
        try {

            HttpPost request = new HttpPost(url);
            StringEntity entity = new StringEntity(data.toString(), "utf-8");
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            request.setEntity(entity);
            HttpResponse response = httpClient.execute(request);
            /**请求发送成功，并得到响应**/
            if (response.getStatusLine().getStatusCode() == 200) {
                /**读取服务器返回过来的json字符串数据**/
                str = EntityUtils.toString(response.getEntity());
            }

        }catch (Exception ex) {

            return "";

        } finally {
        }
        return str;
    }


    /**
     * 默认版本号
     * @param url
     * @param data
     * @param useType
     * @return
     */
    public JSONObject send(String url, Object data, int useType){
        String version = this.version;
        return this.send(url, data, useType, version);
    }


    /**
     * 简易模式
     * @param url
     * @param data
     * @return
     */
    public  JSONObject send(String url, Object data){
        String version = this.version;
        int useType = 0;
        return this.send(url, data, useType, version);
    }
}
