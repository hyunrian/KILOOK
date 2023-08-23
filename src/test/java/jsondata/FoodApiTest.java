package jsondata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.board.restaurant.FoodDao;
import com.kh.teampro.board.restaurant.FoodVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class FoodApiTest {

	@Autowired
	FoodDao foodDao;
	
	@Test
	// api 데이터 불러오기
	public void getFoodApi() throws Exception {
		String api_url = "http://apis.data.go.kr/6260000/FoodService/getFoodKr";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		
		for (int j = 1; j <= 5; j++) {
			String pageNo = String.valueOf(j);
			String numOfRows = "30";
			
			StringBuilder urlBuilder = new StringBuilder(api_url); /*URL*/
			urlBuilder.append("?serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8"));
	        urlBuilder.append("&pageNo=" + URLEncoder.encode(pageNo, "UTF-8")); 
	        urlBuilder.append("&numOfRows=" + URLEncoder.encode(numOfRows, "UTF-8")); 
	        urlBuilder.append("&resultType=" + URLEncoder.encode("json", "UTF-8"));
	        String uString = urlBuilder.toString();
//          System.out.println("uString:" + uString);
	        URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
	//		System.out.println("Response code: " + conn.getResponseCode()); // getResponseCode : 200
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
	//		System.out.println("sb:" + sb.toString()); // 출력 확인 o
	
			// api 데이터 DB 저장
			String sbString = sb.toString();
			JSONObject sbObj = new JSONObject(sbString);
			JSONObject objFoodKr = (JSONObject)sbObj.get("getFoodKr");
			JSONArray jsonArray = (JSONArray)objFoodKr.get("item");
			System.out.println("jsonArrLength:" + jsonArray.length());
			// sbString을 JSONArray로 변환
//			JSONArray jsonArray = new org.json.JSONArray(sbString);
	
			//jsonArray를 사용하여 각각의 JSON 객체에서 데이터 추출
			
			for (int i = 0; i < jsonArray.length(); i++) {
				org.json.JSONObject obj = jsonArray.getJSONObject(i);
				System.out.println("obj:" + obj);
				System.out.println("===============");
				
				String rname = obj.getString("MAIN_TITLE");
				String content = obj.getString("ITEMCNTNTS");
				String location = obj.getString("GUGUN_NM");
				String address = obj.getString("ADDR1");
				String rnumber = obj.getString("CNTCT_TEL");
				String rurl = obj.getString("HOMEPAGE_URL");
				String openhours = obj.getString("USAGE_DAY_WEEK_AND_TIME");
				String menu = obj.getString("RPRSNTV_MENU");
				int lat = obj.getInt("LAT");
				int rlong = obj.getInt("LNG");
				String image = obj.getString("MAIN_IMG_NORMAL");
				String thumbimage = obj.getString("MAIN_IMG_THUMB");
				
				FoodVo foodVo = new FoodVo();
				
				foodVo.setRname(rname);
				foodVo.setContent(content);
				foodVo.setLocation(location);
				foodVo.setAddress(address);
				foodVo.setRnumber(rnumber);
				foodVo.setUrl(rurl);
				foodVo.setOpenhours(openhours);
				foodVo.setMenu(menu);
				foodVo.setLat(lat);
				foodVo.setRlong(rlong);
				foodVo.setImage(image);
				foodVo.setThumbimage(thumbimage);
				System.out.println("foodVo:" + foodVo);
				foodDao.insertFood(foodVo);
			}
			Thread.sleep(2000);
		}
	}
}
