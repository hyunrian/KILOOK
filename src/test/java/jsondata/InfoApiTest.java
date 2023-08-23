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
import com.kh.teampro.board.tourguide.InfoDao;
import com.kh.teampro.board.tourguide.InfoVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class InfoApiTest {

	@Autowired
	InfoDao infoDao;
	
	@Test
	public void getInfoApi() throws Exception {
		// api 데이터 불러오기
		String api_url = "http://apis.data.go.kr/6260000/InfoOfficeService/getInfoOfficeKr";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		
		String pageNo = "1"; 
		String numOfRows = "25";
		
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
		JSONObject objInfoKr = (JSONObject)sbObj.get("getInfoOfficeKr");
		JSONArray jsonArray = (JSONArray)objInfoKr.get("item");
		System.out.println("jsonArr:" + jsonArray.length()); // test ok
		
		for (int i = 0; i < jsonArray.length(); i++) {
			org.json.JSONObject obj = jsonArray.getJSONObject(i);
			
			String iname = obj.optString("NM");
			String openhours = obj.getString("OP_TIME");
			String inumber = obj.getString("INQRY_TEL");
			int lat = obj.getInt("LAT");
			int ilong = obj.getInt("LNG");
			String address = obj.optString("ADDR1");
			String language = obj.optString("FGGG");
			String introduce = obj.optString("INFOFC_INTRCN");
			
			InfoVo infoVo = new InfoVo();
			
			infoVo.setIname(iname);
			infoVo.setOpenhours(openhours);
			infoVo.setInumber(inumber);
			infoVo.setLat(lat);
			infoVo.setIlong(ilong);
			infoVo.setAddress(address);
			infoVo.setLanguage(language);
			infoVo.setIntroduce(introduce);
			
			infoDao.insertInfo(infoVo);
		}
	}
}
