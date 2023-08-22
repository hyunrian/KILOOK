package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.Like.board.LikeUserBoardService;
import com.kh.teampro.attach.AttachService;
import com.kh.teampro.attach.AttachVo;
import com.kh.teampro.paging.PagingDto;
import com.kh.teampro.reply.user.UserReplyService;

@Service
public class UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private UserReplyService userReplyService;
	
	public List<UserBoardVo> getUserArticleList(PagingDto pagingDto) {
		List<UserBoardVo> list = 
				userBoardDao.getUserArticleList(pagingDto);
		
		return list;
	}
	
	public UserBoardVo getUserArticleDetail(int bno) {
		return userBoardDao.getUserArticleDetail(bno);
	}
	
	public void addViewcnt(int bno) {
		userBoardDao.addViewcnt(bno);
	}
	
	@Transactional
	public void createArticle(UserBoardVo userBoardVo, String thumbnail) {
		int bno = userBoardDao.getNextSeq();
		userBoardVo.setBno(bno);
		userBoardDao.createArticle(userBoardVo);
		
		if (thumbnail != null && !(thumbnail.equals(""))) {
			attachService.insertFileData(new AttachVo(thumbnail, bno));
		}
	}
	
	public int getNextSeq() {
		return userBoardDao.getNextSeq(); 
	}
	
	public void deleteArticle(int bno) {
		userBoardDao.deleteArticle(bno);
	}
	
	@Transactional
	public void updateArticle(UserBoardVo userBoardVo, String thumbnail) {
		int bno = userBoardVo.getBno();
		AttachVo attachVo = new AttachVo(thumbnail, bno);
		
		if (thumbnail != null && !(thumbnail.equals(""))) { // 수정할 썸네일이 있음
			if (attachService.getThumbnail(bno) != null) { // 이미 생성된 썸네일이 있는 경우
				attachService.updateThumbnail(attachVo);
			} else { // 썸네일을 새로 생성하는 경우
				attachService.insertFileData(attachVo);
			}
		} else if (thumbnail == null || thumbnail.equals("")) { // 수정할 썸네일이 없음
			if (attachService.getThumbnail(bno) != null) { // 이미 생성된 썸네일이 있는 경우
				attachService.deleteThumbnail(bno);
			} 
		}
		
		userBoardDao.updateArticle(userBoardVo);
	}
	
	public int getTotalCount(PagingDto pagingDto) {
		return userBoardDao.getTotalCount(pagingDto);
	}
	
	public List<UserBoardVo> getTopSix() {
		return userBoardDao.getTopSix();
	}
	
	public String getUserid(int bno) {
		return userBoardDao.getUserid(bno);
	}
	
}
