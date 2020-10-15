package org.zerock.mapper;

import java.util.List;

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
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class GalleryMapperTests {

	@Setter(onMethod_ = @Autowired)
	private GalleryMapper mapper;

	@Test
	public void testGetList() {

	//	mapper.getList().forEach(gallery -> log.info(gallery));
		mapper.getList2(64L).forEach(gallery -> log.info(gallery));
	}
	
//	@Test
//	public void testSearch() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("새로");
//		cri.setType("TC");
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board->log.info(board));
//	}
	
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//	
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board->log.info(board.getBno()));
//		
//		
//	}
//	@Test
//	public void testInsert() {
//
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
//		
//		
//		
//		mapper.insert(board);
//
//		log.info(board);
//	}
//	
//	@Test
//	public void testInsertSelectKey() {
//
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setWriter("newbie");
//
//		mapper.insertSelectKey(board);
//
//		log.info(board);
//	}
//	
//	@Test
//	public void testRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		GalleryVO board = mapper.read(21L);
//
//		log.info(board);
//
//	}
//	
//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT: " + mapper.delete(25L));
//	}
	
//	@Test
//	public void testUpdate() {
//
//	GalleryVO board = new GalleryVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setGno(21L);
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
//		
//
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//
//	}



	
}
