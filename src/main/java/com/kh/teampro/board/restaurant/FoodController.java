package com.kh.teampro.board.restaurant;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@RestController
@RequestMapping("/databoard")
public class FoodController {
	@Autowired
	private FoodService foodService;
	
	// 맛집 전체 조회
	@RequestMapping(value = "/getFoodList", method = RequestMethod.GET)
	public List<FoodVo> getFoodList() throws Exception{
		List<FoodVo> list = foodService.getFoodList();
		return list;
	}
	
	// 해당 맛집 상세보기
	@RequestMapping(value = "/getFoodInfo", method = RequestMethod.GET)
	public List<FoodVo> getFoodList(int bno) throws Exception{
		List<FoodVo> list = foodService.getFoodInfo(bno);
		return list;
	}
	
	// 맛집 추가
	@RequestMapping(value = "/insertFood", method = RequestMethod.GET)
	public void insertFood(FoodVo foodVo) throws Exception{
		foodService.insertFood(foodVo);
	}
	
	// api 데이터 불러오기
	@RequestMapping(value = "/restaurant", method = RequestMethod.GET)
	public void getFoodApi() throws Exception{
		String api_url = "http://apis.data.go.kr/6260000/FoodService/getFoodKr";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		String pageNo = "1";
		String numOfRows = "10";
		
		StringBuilder urlBuilder = new StringBuilder(api_url); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + serviceKey); 
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("resultType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        
        URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode()); // getResponseCode : 200
		BufferedReader rd;
        
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
		    sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println("sb:" + sb.toString()); // 출력 확인 o
		
		
	}
	
	
	
//	@RequestMapping(value = "/foodApi", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) throws Exception{
//		String api_url = "http://apis.data.go.kr/6260000/FoodService/getFoodKr";
//		String serviceKey = "35CN%2FtXCwnbQDbiAwhY2C4SwCINRUdM16zD4f%2F5CyiI%2Beq%2Bh7B26jBgJz4L%2FfgYeBltjJ945ZapXAieCsSZBsA%3D%3D";
//		String numOfRows = "10";
//		String pageNo = "1";
//		
//		 StringBuilder urlBuilder = new StringBuilder(api_url); /*URL*/
//	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + serviceKey); 
//	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); 
//	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); 
//	        urlBuilder.append("&" + URLEncoder.encode("format", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        
	     // 아래의 getResultMap 함수 활용. StringBuilder 데이터를 통째로 줘서 xml 데이터를 받아온 후 HashMap데이터 리스트로 작성
//			List<HashMap<String, String>> list = getResultMap(urlBuilder);
			
			//map을 선언해줍니다.
//			Map<String, Object> map = new HashMap<String, Object>();
			
			// 전시 상세 서비스의 출력결과(Response Element)에서 원하는 항목 명에 해당하는 데이터를 map에 담음
			// 출력결과 항목명은 https://www.data.go.kr/data/15063738/openapi.do 에서 확인함
//			for(Map<String,String> tmpMap : list) {
//				map.put("ADDR1", tmpMap.get("ADDR1"));
//				map.put("CNTCT_TEL", tmpMap.get("CNTCT_TEL"));
//				map.put("HOMEPAGE_URL", tmpMap.get("HOMEPAGE_URL"));
//				map.put("USAGE_DAY_WEEK_AND_TIME", tmpMap.get("USAGE_DAY_WEEK_AND_TIME"));
//				map.put("RPRSNTV_MENU", tmpMap.get("RPRSNTV_MENU"));
//				map.put("MAIN_IMG_NORMAL", tmpMap.get("RPRSNTV_MENU"));
//				map.put("ITEMCNTNTS", tmpMap.get("ITEMCNTNTS"));
//				map.put("PLACE", tmpMap.get("PLACE"));
//			}
			
			// map에 담은 데이터를 model에 담아서 home.jsp 페이지로 리턴.
//			model.addAttribute("ADDR1", map.get("ADDR1"));
//			model.addAttribute("CNTCT_TEL", map.get("CNTCT_TEL"));
//			model.addAttribute("HOMEPAGE_URL", map.get("HOMEPAGE_URL"));
//			model.addAttribute("USAGE_DAY_WEEK_AND_TIME", map.get("USAGE_DAY_WEEK_AND_TIME"));
//			model.addAttribute("RPRSNTV_MENU", map.get("RPRSNTV_MENU"));
//			model.addAttribute("MAIN_IMG_NORMAL", map.get("MAIN_IMG_NORMAL"));
//			model.addAttribute("ITEMCNTNTS", map.get("ITEMCNTNTS"));
//			model.addAttribute("PLACE", map.get("PLACE"));
//		
//		return "restaurant";
//	}
	
	// StringBuilder 데이터를 이용해서 xml 형태의 데이터를 받아오는 함수. 작동 과정은 이해 못한 상태.
//		public static List<HashMap<String, String>> getResultMap(StringBuilder urlBuilder) throws Exception {
//			
//			URL url = new URL(urlBuilder.toString());
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode()); // getResponseCode : 200
//			BufferedReader rd;
//			
//			//getResponseCode가 200이상 300이하일때는 정상적으로 작동합니다. (왜 필요한지는 이해 못했음..)
//			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//			    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			} else {
//			    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			}
//			
//			StringBuilder sb = new StringBuilder();
//			String line;
//			while ((line = rd.readLine()) != null) {
//			    sb.append(line);
//			}
//			rd.close();
//			conn.disconnect();
//			url = null;
//			
//			
//			String data = sb.toString();
//			 
//			//결과값을 넣어줄 map을 선언해줍니다.
//			List<HashMap<String, String>> resultMap = new LinkedList<HashMap<String, String>>();
//			        
//			InputSource is = new InputSource(new StringReader(data));
//			
//			//Document 클래스로 xml데이터를 취득합니다.
//			Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
//			
//			//xPath 팩토리로 객체를 만듭니다.
//			XPath xpath = XPathFactory.newInstance().newXPath();
//			
//			//xPath를 컴파일한 후에 node단위로 데이터를 수집합니다.
//			NodeList nodeList = (NodeList) xpath.compile("/response/body/items/item").evaluate(document, XPathConstants.NODESET);
//			int nodeListCount = nodeList.getLength();
//			for (int i = 0; i < nodeListCount; i++) {
//			    NodeList childNode = nodeList.item(i).getChildNodes();
//			    HashMap<String, String> nodeMap = new HashMap<String, String>();
//			    int childNodeCount = childNode.getLength();
//			    for (int j = 0; j < childNodeCount; j++) {
//			        nodeMap.put(childNode.item(j).getNodeName(), childNode.item(j).getTextContent());
//			    }
//			    resultMap.add(nodeMap);
//			}
//			
//			return resultMap;
//			
//		}
	
}
