package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.replyVO;

public interface ReplyService {

	public int register(replyVO vo);
	
	public replyVO get(Long rno);
	
	public int modify(replyVO vo);
	
	public int remove(Long rno);
	
	public List<replyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	
}
