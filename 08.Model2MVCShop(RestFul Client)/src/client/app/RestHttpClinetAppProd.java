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

public class RestHttpClinetAppProd {

	public RestHttpClinetAppProd() {
		// TODO Auto-generated constructor stub
	}
	
	//main method
	public static void main(String[] args) throws Exception {
		
//		System.out.println("\n========================================\n");
//		1. addProduct : Codehaus
//		RestHttpClinetAppProd.addProdTest_Codehaus();

//		System.out.println("\n========================================\n");
//		2. getProduct : Codehaus
		RestHttpClinetAppProd.getProdTest_Codehaus();

//		System.out.println("\n========================================\n");
//		3. updateProduct : Codehaus
//		RestHttpClinetAppProd.updateProdTest_Codehaus();

//		System.out.println("\n========================================\n");
//		4. getProductList : Codehaus
//		RestHttpClinetAppProd.getProdListTest_Codehaus();

	}
	
	
//==================================================================
	
	public static void addProdTest_Codehaus() throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/addProduct";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Product testProduct = new Product();
		testProduct.setProdName("갤럭시 Note10+");
		testProduct.setProdDetail("Made in KOREA");
		testProduct.setManuDate("20211212");
		testProduct.setPrice(1000000);
		testProduct.setFileName("wow");
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(testProduct);
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		System.out.println(httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);
		
	}
	
	
	
//==================================================================
		
	
	public static void getProdTest_Codehaus() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/getProduct/10060";
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		HttpResponse httpResponse = httpClient.execute(httpGet);

		System.out.println(httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println("::"+jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);
	}
	
	
//==================================================================
		
	public static void updateProdTest_Codehaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/updateProduct/10080";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept","application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Product phone = new Product();
		phone.setProdNo(10080);
		phone.setProdName("testUpdate");
		phone.setProdDetail("변경사항");
		phone.setPrice(500);
		phone.setManuDate("55550505");
		phone.setFileName("왜?");
		
		System.out.println(phone);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		String jsonValue = objectMapper01.writeValueAsString(phone);
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		System.out.println(httpResponse);
		System.out.println();
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		//여기서 null
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(product);
		
	}

//==================================================================


	public static void getProdListTest_Codehaus() throws Exception {

		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/listProduct";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		ObjectMapper objectMapper01 = new ObjectMapper();
		//Object ==> JSON Value 로 변환
		String jsonValue = objectMapper01.writeValueAsString(search);
		HttpEntity httpEntity01 = new StringEntity(jsonValue,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpReponse = httpClient.execute(httpPost);
		
		System.out.println(httpReponse);
		System.out.println();
		
		HttpEntity httpEntity = httpReponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println("안녕"+jsonobj);
		
		ObjectMapper objectMapper = new ObjectMapper();
		//jsonobj = Map type , key값으로 jsonobj의 값을 받아오자
		List list = objectMapper.readValue(jsonobj.get("list").toString(), ArrayList.class);
		System.out.println(list);
		
	}

}
