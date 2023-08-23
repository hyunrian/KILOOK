package com.kh.teampro.databoard;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.Like.board.LikeUserBoardVo;
import com.kh.teampro.board.restaurant.FoodDao;
import com.kh.teampro.board.restaurant.FoodVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class FoodDaoTest {

	@Autowired
	private FoodDao dao;
	
	@Test
	public void addLike() {
		int foodCount = dao.getfoodCount();
		System.out.println("data count:" + foodCount);
		int randomMax = foodCount; //정수표출
		
		int[] arr = randomArr(randomMax);
		System.out.println("arr:" + arr.toString());
		
		HashMap<String,int[]> hashMap = new HashMap<String,int[]>();
		hashMap.put("arrShopList", arr);
		System.out.println("map:" + hashMap.toString());
		
		List<FoodVo> recomendedFoodList = dao.getRecomendedFoodList(hashMap); 
		System.out.println("list: " + recomendedFoodList);
	}
	
	// 다른 맛집 추천부분 랜덤 구하기
	public int[] randomArr(int maxNumber) {
		int[] arr = new int[3];
		for(int i = 0; i < 3; i++) {
			int a = (int)(Math.random()*maxNumber);
			
			if(a < 1) {
				a = 1;
			}
			arr[i] = a;
		}
		
		int[] newArr = Arrays.stream(arr).distinct().toArray();
		
		if(newArr.length != 3) {
			arr = randomArr(maxNumber);
		}
		return arr; 
	}
}
