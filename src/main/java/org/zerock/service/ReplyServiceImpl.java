package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.replyVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardmapper;
	
	@Transactional
	@Override
	public int register(replyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("register......." + vo);
		
		boardmapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
		
	}

	@Override
	public replyVO get(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("get...." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(replyVO vo) {
		// TODO Auto-generated method stub
		log.info("modify....." + vo);
		
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("remove...." +rno);
		
		replyVO vo = mapper.read(rno);
		
		boardmapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}


	public List<replyVO> getList(Criteria cri,Long bno){
		log.info("get Reply List of a Board : " + bno);
		return mapper.getListWithPaging(cri,bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
				
	}
	
	
	
		
		
	

	


}
