package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ArtVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class ArtMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ArtMapper mapper;

//	@Test
//	public void testGetList() {
//
//		mapper.getList().forEach(art -> log.info(art));
//	}
	
	
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
	@Test
	public void testInsert() {

		ArtVO board = new ArtVO();
		board.setAname("새로 작성하는 글");
		board.setArtist("새로 작성하는 내용");
		board.setGno(61L);
		board.setGname("새미술관");
		board.setMenu("소묘");
		
		
		mapper.insert(board);

		log.info(board);
	}
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
//		ArtVO board = mapper.read(21L);
//
//		log.info(board);
//
//	}
//	
//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT: " + mapper.delete(21L));
//	}
//	
//	@Test
//	public void testUpdate() {
//
//	ArtVO board = new ArtVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		board.setAno(73L);
//		board.setAname("수정된 제목");
//		board.setArtist("수정된 내용");
//		board.setGname("소마미술");
//		board.setCategory("소묘");
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
//


	
}
