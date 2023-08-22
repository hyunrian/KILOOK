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

import com.kh.teampro.board.attraction.PlaceDao;
import com.kh.teampro.board.attraction.PlaceVo;
import com.kh.teampro.board.parking.ParkingDao;
import com.kh.teampro.board.parking.ParkingVo;
import com.kh.teampro.board.restaurant.FoodDao;
import com.kh.teampro.board.restaurant.FoodVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ParkingApiTest {

	@Autowired
	ParkingDao parkingDao;
	
	@Test
	public void getParkingApi() throws Exception {
		// api 데이터 불러오기
		String api_url = "http://apis.data.go.kr/6260000/BusanPblcPrkngInfoService/getPblcPrkngInfo";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		String pageNo = "13"; 
		String numOfRows = "50";
		
		StringBuilder urlBuilder = new StringBuilder(api_url); /*URL*/
		urlBuilder.append("?serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8"));
        urlBuilder.append("&pageNo=" + URLEncoder.encode(pageNo, "UTF-8")); 
        urlBuilder.append("&numOfRows=" + URLEncoder.encode(numOfRows, "UTF-8")); 
        urlBuilder.append("&resultType=" + URLEncoder.encode("json", "UTF-8"));
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
		System.out.println("sb:" + sb.toString());
		
		// api 데이터 DB 저장
		String sbString = sb.toString();
		JSONObject sbObj = new JSONObject(sbString);
		JSONObject objPblcPrkngInfo = (JSONObject)sbObj.get("getPblcPrkngInfo");
		JSONObject objBody = (JSONObject)objPblcPrkngInfo.get("body");
		JSONObject objItems = (JSONObject)objBody.get("items");
		JSONArray jsonArray = (JSONArray)objItems.get("item");
		System.out.println("jsonArr length:" + jsonArray.length()); // test ok
		
//		for (int i = 0; i < jsonArray.length(); i++) {
//			org.json.JSONObject obj = jsonArray.getJSONObject(i);
////			System.out.println("obj:" + obj);
////			System.out.println("===============");
//			
//			String pname = obj.getString("pkNam");
//			String lat = obj.getString("xCdnt");
//			String plong = obj.getString("fnlDt");
//			String jibunaddress = obj.getString("jibunAddr");
//			String doroaddress = obj.getString("doroAddr");
//			String weekdayopen = obj.getString("svcSrtTe");
//			String weekdayclose = obj.getString("svcEndTe");
//			String saturdayopen = obj.getString("satSrtTe");
//			String saturdayclose = obj.getString("satEndTe");
//			String holidayopen = obj.getString("hldSrtTe");
//			String holidayclose = obj.getString("hldEndTe");
//			String price = obj.getString("tenMin");
//					
//			ParkingVo parkingVo = new ParkingVo();
//			
//			parkingVo.setPname(pname);
//			parkingVo.setLat(lat);
//			parkingVo.setPlong(plong);
//			parkingVo.setJibunaddress(jibunaddress);
//			parkingVo.setDoroaddress(doroaddress);
//			parkingVo.setWeekdayopen(weekdayopen);
//			parkingVo.setWeekdayclose(weekdayclose);
//			parkingVo.setSaturdayopen(saturdayopen);
//			parkingVo.setSaturdayclose(saturdayclose);
//			parkingVo.setHolidayopen(holidayopen);
//			parkingVo.setHolidayclose(holidayclose);
//			parkingVo.setPrice(price);
//			
//			parkingDao.insertParking(parkingVo);
//		}
	}
}
