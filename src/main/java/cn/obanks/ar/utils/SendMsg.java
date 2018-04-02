package cn.obanks.ar.utils;
import java.util.HashMap;
import java.util.Random;

import com.cloopen.rest.sdk.CCPRestSmsSDK;

public class SendMsg{
	
	public boolean send(String mobile,String templateId,String[] arg_rs){
		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
	/*	restAPI.init("app.cloopen.com", "8883");
		restAPI.setAccount("8a48b5514c1103b4014c20bd2bb30807", "7188599c27a446a9b9fbbb47b1458d95");
		restAPI.setAppId("aaf98f894c983f52014c98c538b900b4");*/
		HashMap<String, Object> resultMsg = null;
		resultMsg = restAPI.sendTemplateSMS(mobile, templateId, arg_rs);
		String result = String.valueOf(resultMsg.get("statusCode"));
		if(result.equals("000000")){
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		/*		SendMsg s = new SendMsg();
		String mobile = "13048972671";
		String templateId = "20821";
		String content = "J608DNVt";
		String[] arg_rs = content.split("\\|");
		boolean a = s.send(mobile, templateId, arg_rs);
		System.out.println(a);
		String mobile = "13048972671";
	//	String templateId = "19385";
		String templateId = "20821";
		String content = "J608DNVt";
		System.out.println("INPUT PARAM  mobile = [" + mobile + "] templateId = [" + templateId + "] content = [" + content + "]");
		String result = null;
		HashMap<String, Object> resultMsg = null;
		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
		restAPI.init("app.cloopen.com", "8883");
		restAPI.setAccount("8a48b5514c1103b4014c20bd2bb30807", "7188599c27a446a9b9fbbb47b1458d95");
		restAPI.setAppId("aaf98f894c983f52014c98c538b900b4");
		String[] arg_rs = content.split("\\|");
		resultMsg = restAPI.sendTemplateSMS(mobile, templateId, arg_rs);
		System.out.println("SENDMSG_RESPONSE= [" + resultMsg + "]");
		result = String.valueOf(resultMsg.get("statusCode"));
		System.out.println("SENDMSG_RESPONSE_CODE= [" + resultMsg.get("statusCode") + "|" + resultMsg.get("statusMsg") + "]");
		if ("000000".equals(result)) {
			result = "0";
		}
		result = "<?xml version='1.0' encoding='GB2312'?><RESULT>" + result + "</RESULT><RETMSG>" + resultMsg.get("statusMsg") + "</RETMSG>";
		System.out.println("RESULT= [" + result + "]");*/
	}
	
	public  String getRandomString(int length) {   
        StringBuffer buffer = new StringBuffer("0123456789");   
        StringBuffer sb = new StringBuffer();   
        Random random = new Random();   
        int range = buffer.length();   
        for (int i = 0; i < length; i ++) {   
            sb.append(buffer.charAt(random.nextInt(range)));   
        }   
        return sb.toString();   
    }  

}
