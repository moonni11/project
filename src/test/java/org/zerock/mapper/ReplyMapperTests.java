package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.replyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	private Long[] bnoArr = {47L,48L,49L,50L,51L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
//	@Test
//	public void testCreate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			
//			replyVO vo = new replyVO();
//			
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트" + i);
//			vo.setReplyer("replyer:" + i);
//			
//			mapper.insert(vo);
//		});
//	}
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
	
//	@Test
//	public void testRead() {
//		
//		Long targetRno = 30L;
//		
//		replyVO vo = mapper.read(targetRno);
//		
//		log.info(vo);
//	}

//	@Test
//	public void testDelete() {
//		Long targetRno = 30L;
//		
//		mapper.delete(targetRno);
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		Long targetRno = 31L;
//		
//		replyVO vo = mapper.read(targetRno);
//		
//		vo.setReply("Update Reply");
//		
//		int count = mapper.update(vo);
//		
//		log.info("UPDATE COUNT: " + count);
//	}
	
	@Test
	public void testList() {
	Criteria cri = new Criteria();
	
	List<replyVO> replies = mapper.getListWithPaging(cri,bnoArr[0]);
	
	replies.forEach(reply -> log.info(reply));
	}
	
//	@Test
//	public void testList2() {
//	Criteria cri = new Criteria(2,10);
//	
//	List<replyVO> replies = mapper.getListWithPaging(cri,463353L);
//	
//	replies.forEach(reply -> log.info(reply));
//	}
}
