package com.kh.teampro.reply.attraction;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.point.PointService;
import com.kh.teampro.user.info.UserVo;

@RestController
@RequestMapping("/reply")
public class PlaceReplyController {

	@Autowired
	private PlaceReplyService placeReplyService;
	
	@Autowired
	private PointService pointService;
	
	// 댓글 목록
	@RequestMapping(value = "/placeList", method = RequestMethod.GET)
	public List<PlaceReplyVo> getAttrReplyList(int bno){
		System.out.println("placeReplyList 컨트롤러 들어옴");
		List<PlaceReplyVo> list = placeReplyService.getAttrReplyList(bno);
		return list;
	}
	
	// 댓글 추가
	@RequestMapping(value = "/placeInsert", method = RequestMethod.POST)
	public String placeReplyInsert(PlaceReplyVo placeReplyVo,
		HttpSession session) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		System.out.println("userVo:" + userVo);
		placeReplyVo.setReplyer(userVo.getUnickname());
		placeReplyVo.setUserid(userVo.getUserid());
		if(placeReplyVo.getRlevel() == 0) {
			placeReplyService.insertPlaceNewReply(placeReplyVo);
			pointService.addReplyPoint(userVo.getUserid());
		} else {
			int bno = placeReplyVo.getBno();
			int rgroup = placeReplyService.getRgroup(placeReplyVo.getRno());
			placeReplyVo.setRgroup(rgroup);
			int maxRseq = placeReplyService.getMaxRseq(bno, placeReplyVo.getRgroup());
			placeReplyVo.setRseq(maxRseq + 1); // 다음에 달릴 댓글(해당 댓글) = 기존 순번(seq) + 1
			placeReplyService.insertPlaceReReply(placeReplyVo);
			pointService.addReplyPoint(userVo.getUserid());
		}
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	 // 댓글 수정
	@RequestMapping(value = "/placeUpdate", method = RequestMethod.PATCH)
	public String updatePlaceReply(@RequestBody PlaceReplyVo placeReplyVo, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		placeReplyVo.setReplyer(userVo.getUnickname());
		placeReplyService.updatePlaceReply(placeReplyVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	//  대댓글이 있는 댓글인지 확인
	@RequestMapping(value = "/checkChildPlaceReply/{rno}", method = RequestMethod.GET)
	public boolean hasChildPlaceReply(@PathVariable String rno) { // 비동기 방식일때는 pathVariable이 String/Vo/map 등의 타입이어야 함. int 타입은 오류발생
		boolean hasChildPlaceReply = placeReplyService.hasChildPlaceReply(Integer.valueOf(rno));
		return hasChildPlaceReply;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/placeDelete", method = RequestMethod.PATCH)
	public String deletePlaceReply(@RequestBody String rno) {
		placeReplyService.deletePlaceReply(Integer.valueOf(rno)); // 비동기 방식일때는 pathVariable이 String/Vo/map 등의 타입이어야 함. int 타입은 오류발생
		return MyConstants.SUCCESS_MESSAGE;
	}
}
