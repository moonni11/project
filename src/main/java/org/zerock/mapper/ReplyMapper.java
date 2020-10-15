package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.replyVO;

public interface ReplyMapper {
	
	public int insert(replyVO vo);
	
	public replyVO read(Long rno);
	
	public int delete(Long targetRno);
	
	public int update(replyVO vo);
	
	public List<replyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
	

}
