package client.app;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;

public class RestHttpClinetAppPurchase {

	public RestHttpClinetAppPurchase() {
		// TODO Auto-generated constructor stub
	}
	
	//main method
	public static void main(String[] args) throws Exception {

//		System.out.println("\n========================================\n");
//		1. getPurchase : Codehaus
//		RestHttpClinetAppPurchase.getPurchaseTest_Codehaus();
		
//		System.out.println("\n========================================\n");
//		2. getPurchase2 : Codehaus
//		RestHttpClinetAppPurchase.getPurchase2Test_Codehaus();		

//		System.out.println("\n========================================\n");
//		3. getPurchaseList : Codehaus
		RestHttpClinetAppPurchase.getPurchaseListTest_Codehaus();

	}
	
	
//==================================================================
	
	public static void getPurchaseTest_Codehaus() throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/getPurchase/10086";

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept","application/json");
		httpGet.setHeader("Content-Type","application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println("!!"+httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		JSONObject jsonObj = (JSONObject)JSONValue.parse(br);
		System.out.println(">>>"+jsonObj+"<<<");
		
		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonObj.toString(), Purchase.class);
		System.out.println(">>>"+purchase+"<<<");
		
	}
	
	
	public static void getPurchase2Test_Codehaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/getPurchase2/10000";
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept","application/json");
		httpGet.setHeader("Content-Type","application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println("!!"+httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));

		JSONObject jsonObj = (JSONObject)JSONValue.parse(br);
		System.out.println(">>>"+jsonObj+"<<<");
		
		ObjectMapper objectMapper = new ObjectMapper();
		Purchase purchase = objectMapper.readValue(jsonObj.toString(), Purchase.class);
		System.out.println(">>>"+purchase+"<<<");
	
	}
	
	
	public static void getPurchaseListTest_Codehaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/purchase/json/listPurchase";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type","application/json");
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(search);
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		System.out.println(httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		JSONObject jsonObj = (JSONObject)JSONValue.parse(br);
		System.out.println(">>>"+jsonObj+"<<<");
		
		ObjectMapper objectMapper = new ObjectMapper();
		List list = objectMapper.readValue(jsonObj.get("list").toString(), ArrayList.class);
		System.out.println(">>>"+list+"<<<");
	}


}
