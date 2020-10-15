package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ArtVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ArtServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private ArtService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testRegister() {
//		ArtVO board = new ArtVO();
//		board.setAname("새로 작성하는 글");
//		board.setArtist("새로운 작가");
//		board.setGno(61L);
//		board.setGname("새미술");
//		
//		board.setCategory("드로잉");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getAno());
//	}
//	
//	@Test
//	public void testGetList() {
////		service.getList().forEach(Art -> log.info(Art));
//		service.getList(new Criteria(2, 10)).forEach(Art -> log.info(Art));
//	}
////	
//	@Test
//	public void testGet() {
//		log.info(service.get(1L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT: " + service.remove(22L));
//	}
	
//	@Test
//	public void testUpdate() {
//		ArtVO Art = service.get(73L);
//		
//		if(Art == null) {
//			return;
//		}
//		Art.setAname("제목 수정합니다.");
//		log.info("MODIFY RESULT: " + service.modify(Art));
//	}
//	
}
