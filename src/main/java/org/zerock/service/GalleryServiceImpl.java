package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.GalleryVO;
import org.zerock.domain.ArtVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryAttachVO;
import org.zerock.mapper.GalleryAttachMapper;
import org.zerock.mapper.GalleryMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GalleryServiceImpl implements GalleryService{
	
	@Setter(onMethod_= @Autowired)
	private GalleryMapper mapper; //데이더 단을 처리
	
	@Setter(onMethod_= @Autowired)
	private GalleryAttachMapper attachMapper;

	@Override
	public void register(GalleryVO gallery) {
		log.info("register............." + gallery);
		
		mapper.insertSelectKey(gallery);
		
		if(gallery.getAttachList() == null || gallery.getAttachList().size() <= 0) {
			return;
		}
		
		gallery.getAttachList().forEach(attach ->{
			
			attach.setGno(gallery.getGno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public GalleryVO get(Long gno) {
		log.info("get..........." + gno);
		return mapper.read(gno);
	}

	@Override
	public boolean modify(GalleryVO Gallery) {
		log.info("modify..........." + Gallery);
		return mapper.update(Gallery) == 1;
	}

	@Transactional
	@Override
	public boolean remove(Long gno) {
		
		log.info("remove..........." + gno);
		
		attachMapper.deleteAll(gno);
		
		return mapper.delete(gno) == 1;
	}

	@Override
	public List<GalleryVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ArtVO> getList2(Long gno) {
		log.info("get List with criteria: " );
		return mapper.getList2(gno);
	}

	@Override
	public List<GalleryAttachVO> getAttachList(Long gno) {
		log.info("get Attach list by gno" + gno);
		return attachMapper.findByGno(gno);
	}

	

	

	

//	@Override
//	public List<GalleryVO> getList() {
//		log.info("getList.............");
//		return mapper.getList();
//	}
	
	
}
