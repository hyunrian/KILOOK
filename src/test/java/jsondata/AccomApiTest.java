package jsondata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.board.accommodation.AccomDao;
import com.kh.teampro.board.accommodation.AccomVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AccomApiTest {

	@Autowired
	private AccomDao accomDao;
	
	@Test
	public void getAccomApi() throws Exception {
		// api 데이터 불러오기
		String api_url = "https://api.odcloud.kr/api/15096728/v1/uddi:a7cfe5da-2d11-4416-b67f-aff99ee63bbe";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
//		String pageNo = "58"; 
//		String numOfRows = "50";
		String pageNo = "1"; 
		String numOfRows = "2900";
		
		StringBuilder urlBuilder = new StringBuilder(api_url); /*URL*/
		urlBuilder.append("?page=" + URLEncoder.encode(pageNo, "UTF-8")); 
		urlBuilder.append("&perPage=" + URLEncoder.encode(numOfRows, "UTF-8")); 
		urlBuilder.append("&resultType=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8"));
        URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
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
		System.out.println("sb:" + sb.toString()); // test ok
		System.out.println("================");
		
		// 이미지 랜덤 배열
//		String[] accomImg = new String[26];
//		
//		for(int i = 0; i < 26; i++) {
//			int random = (int)(Math.random() * accomImg.length) + 1;
//			accomImg[i] = "/resources/images/accommodation/hotel_" + random;
//		}
//		
//		// api 데이터 DB 저장
//		String sbString = sb.toString();
//		JSONObject sbObj = new JSONObject(sbString);
//		JSONArray jsonArray = (JSONArray)sbObj.get("data");
//		int jsonArrLength = jsonArray.length();
//		System.out.println("jsonArrLength:" + jsonArrLength);
//		
//		for (int i = 0; i < jsonArray.length(); i++) {
//			org.json.JSONObject obj = jsonArray.getJSONObject(i);
//			System.out.println("obj:" + obj);
//			System.out.println("===============");
			
//			String category = obj.getString("카테고리명");
//			String aname = obj.getString("업체명");
//			String location = obj.getString("시군구명");
//			String address = obj.optString("도로명");
//			String addressdetail = obj.optString("도로명상세");
//			String anumber = obj.optString("전화번호");
//			String aurl = obj.optString("홈페이지주소");
//			String lat = obj.getString("위도");
//			String aclong = obj.getString("경도");
//			String image = accomImg[(int)(Math.random() * accomImg.length)];
//			
//			AccomVo accomVo = new AccomVo();
//			
//			accomVo.setCategory(category);
//			accomVo.setAname(aname);
//			accomVo.setLocation(location);
//			accomVo.setAddress(address);
//			accomVo.setAddressdetail(addressdetail);
//			accomVo.setAnumber(anumber);
//			accomVo.setUrl(aurl);
//			accomVo.setLat(lat);
//			accomVo.setAclong(aclong);
//			accomVo.setImage(image);
//			
//			accomDao.insertAccom(accomVo);
//		}
//		System.out.println("SUCCESS");
	}
}
