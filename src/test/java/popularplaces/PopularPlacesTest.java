package popularplaces;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.board.accommodation.AccomDao;
import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.restaurant.FoodDao;
import com.kh.teampro.board.restaurant.FoodVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PopularPlacesTest {

	@Autowired
	private FoodDao foodDao;
	private AccomDao accomDao;
	
	@Test
	public void getBestFoodTest() throws Exception {
		List<FoodVo> list = foodDao.getBestFood();
		System.out.println("getBestFood list: " + list);
	} // test ok
	
	@Test
	public void getBestAccomTest() throws Exception {
		List<AccomVo> list = accomDao.getBestAccom();
		System.out.println("getBestAccom List:" + list);
	} // null 허용하는 데이터들 때문에 null pointer error 발생함, controller 및 jsp에서 직접 확인 ok
}
