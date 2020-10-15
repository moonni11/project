package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GalleryServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private GalleryService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testRegister() {
//		GalleryVO board = new GalleryVO();
//		board.setGname("new");
//		board.setTel("new");
//		board.setAddress("new");
//		board.setMapurl("new");
//		board.setPay("new");
//		board.setHours("11");
//		board.setRoute("11");
//		board.setSns("1");
//		board.setImage1("1");
//		board.setImage2("1");
//		board.setImage3("1");
//		board.setImage4("1");
//		board.setImage5("1");
//		board.setImage6("1");
//		board.setImage7("1");
//		board.setImage8("1");
//		board.setImage9("1");
//		board.setImage10("1");
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호: " + board.getGno());
//	}
	
	@Test
	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
		service.getList2(64L).forEach(board -> log.info(board));
	}
//	
//	@Test
//	public void testGet() {
//		log.info(service.get(30L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT: " + service.remove(30L));
//	}
//	
//	@Test
//	public void testUpdate() {
//		GalleryVO board = service.get(28L);
//		
//		if(board == null) {
//			return;
//		}
//		board.setGname("제목 수정합니다.");
//		log.info("MODIFY RESULT: " + service.modify(board));
//	}
	
}
