package com.kh.teampro;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teampro.board.accommodation.AccomService;
import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.attraction.PlaceService;
import com.kh.teampro.board.attraction.PlaceVo;
import com.kh.teampro.board.restaurant.FoodService;
import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.board.user.UserBoardService;
import com.kh.teampro.board.user.UserBoardVo;

@Controller
public class HomeController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private AccomService accomService;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private FoodService foodService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception { // 예외처리 필요
		
		List<UserBoardVo> list = userBoardService.getTopSix();
		List<AccomVo> accList = accomService.getBestAccom();
		List<PlaceVo> placeList = placeService.getBestPlace();
		List<FoodVo> foodList = foodService.getBestFood();
		
		model.addAttribute("list", list);
		model.addAttribute("accList", accList);
		model.addAttribute("placeList", placeList);
		model.addAttribute("foodList", foodList);
		
		return "index";
	}
	
}
