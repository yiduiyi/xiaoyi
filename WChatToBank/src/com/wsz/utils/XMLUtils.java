package com.wsz.utils;

import java.io.IOException;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;


import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;
/**
 * 
 * */
public class XMLUtils {
	/**
	 * 
	 */
	@SuppressWarnings("rawtypes")
	public static String getRequestXml(TreeMap<String, String> parameters)
			throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		Set es = parameters.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if ("mch_id".equalsIgnoreCase(k) || "nonce_str".equalsIgnoreCase(k)
					|| "sign".equalsIgnoreCase(k)) {
				sb.append("<" + k + ">" + "<![CDATA[" + v + "]]></" + k + ">");
			} else {
				sb.append("<" + k + ">" + v + "</" + k + ">");
			}
		}
		sb.append("</xml>");
		return sb.toString();
	}

	@SuppressWarnings("unchecked")
	public static String Progress_resultParseXml(String xml) {
		String publicKey = null;
		try {
			StringReader read = new StringReader(xml);
		
			InputSource source = new InputSource(read);
		
			SAXBuilder sb = new SAXBuilder();
		
			org.jdom.Document doc;
			doc = (org.jdom.Document) sb.build(source);

			org.jdom.Element root = doc.getRootElement();
			List<org.jdom.Element> list = root.getChildren();
			
			if (list != null && list.size() > 0) {
				for (org.jdom.Element element : list) {
					if("pub_key".equals(element.getName())){
						publicKey=element.getText();
					}
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return publicKey;
	}
}