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
import com.kh.teampro.board.restaurant.FoodDao;
import com.kh.teampro.board.restaurant.FoodVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PlaceApiTest {

	@Autowired
	PlaceDao placeDao;
	
	@Test
	public void getPlaceApi() throws Exception {
		// api 데이터 불러오기
		String api_url = "http://apis.data.go.kr/6260000/AttractionService/getAttractionKr";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		String pageNo = "7"; 
		String numOfRows = "20";
		
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
		JSONObject objAttractionKr = (JSONObject)sbObj.get("getAttractionKr");
		JSONArray jsonArray = (JSONArray)objAttractionKr.get("item");
		
		for (int i = 0; i < jsonArray.length(); i++) {
			org.json.JSONObject obj = jsonArray.getJSONObject(i);
//			System.out.println("obj:" + obj);
//			System.out.println("===============");
			
			String title = obj.getString("TITLE");
			String content = obj.getString("ITEMCNTNTS");
			String aname = obj.getString("PLACE");
			String location = obj.getString("GUGUN_NM");
			int lat = obj.getInt("LAT");
			int along = obj.getInt("LNG");
			String address = obj.getString("ADDR1");
			String anumber = obj.getString("CNTCT_TEL");
			String opendays = obj.getString("USAGE_DAY");
			String openhours = obj.getString("USAGE_DAY_WEEK_AND_TIME");
			String price = obj.getString("USAGE_AMOUNT");
			String facility = obj.getString("MIDDLE_SIZE_RM1");
			String image = obj.getString("MAIN_IMG_NORMAL");
			String thumbimage = obj.getString("MAIN_IMG_THUMB"); 
			
			PlaceVo placeVo = new PlaceVo();
			
			placeVo.setTitle(title);
			placeVo.setContent(content);
			placeVo.setAname(aname);
			placeVo.setLocation(location);
			placeVo.setLat(lat);
			placeVo.setAlong(along);
			placeVo.setAddress(address);
			placeVo.setAnumber(anumber);
			placeVo.setOpendays(opendays);
			placeVo.setOpenhours(openhours);
			placeVo.setPrice(price);
			placeVo.setFacility(facility);
			placeVo.setImage(image);
			placeVo.setThumbimage(thumbimage);
			
			placeDao.insertPlace(placeVo);
		}
	}
}
