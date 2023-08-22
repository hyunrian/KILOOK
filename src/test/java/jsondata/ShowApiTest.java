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
import com.kh.teampro.board.show.ShowDao;
import com.kh.teampro.board.show.ShowVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ShowApiTest {

	@Autowired
	ShowDao showDao;
	
	@Test
	public void getShowApi() throws Exception {
		// api 데이터 불러오기
		String api_url = "http://apis.data.go.kr/6260000/BusanCultureExhibitDetailService/getBusanCultureExhibitDetail";
		String serviceKey = "azTHMfp6YjDVbFlU+L/3hvNoIISlb8V6wdFOtkejKQjLmzRnVhYAz+KL74NrlAwL+mhfSJOUiAmhChWpsm3eIQ==";
		String pageNo = "53"; 
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
		JSONObject objAttractionKr = (JSONObject)sbObj.get("getBusanCultureExhibitDetail");
		JSONArray jsonArray = (JSONArray)objAttractionKr.get("item");
		System.out.println("jsonArr length:" + jsonArray.length()); // test ok
		
//		for (int i = 0; i < jsonArray.length(); i++) {
//			org.json.JSONObject obj = jsonArray.getJSONObject(i);
////			System.out.println("obj:" + obj);
////			System.out.println("===============");
//			
//			String showname = obj.getString("title");
//			String begindate = obj.optString("op_st_dt");
//			String enddate = obj.optString("op_ed_dt");
//			String placename = obj.getString("place_nm");
//			String openhours = obj.getString("showtime");
//			String price = obj.getString("price");
//			String surl = obj.getString("dabom_url");
//			
//			ShowVo showVo = new ShowVo();
//			
//			showVo.setShowname(showname);
//			showVo.setBegindate(begindate);
//			showVo.setEnddate(enddate);
//			showVo.setPlacename(placename);
//			showVo.setOpenhours(openhours);
//			showVo.setPrice(price);
//			showVo.setUrl(surl);
//			
//			showDao.insertShow(showVo);
//		}
	}
}
