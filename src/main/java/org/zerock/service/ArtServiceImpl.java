package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ArtAttachVO;
import org.zerock.domain.ArtVO;

import org.zerock.domain.Criteria;
import org.zerock.mapper.ArtAttachMapper;
import org.zerock.mapper.ArtMapper;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ArtServiceImpl implements ArtService{
	
	
	//9-19 추가(566p)
		@Setter(onMethod_= @Autowired)
		private ArtMapper mapper; //데이더 단을 처리	
		
		@Setter(onMethod_= @Autowired)
		private ArtAttachMapper attachMapper;

		@Transactional
		@Override
		public void register(ArtVO art) {
			
			log.info("register............." + art);
			
			mapper.insertSelectKey(art);
			
			if(art.getAttachList() == null || art.getAttachList().size() <= 0) {
				return;
			}
			
			art.getAttachList().forEach(attach ->{
				
				attach.setAno(art.getAno());
				attachMapper.insert(attach);
			});		
			
		}

	@Override
	public ArtVO get(Long ano) {
		log.info("get..........." + ano);
		return mapper.read(ano);
	}

	@Override
	public boolean modify(ArtVO art) {
		log.info("modify..........." + art);
		return mapper.update(art) == 1;
	}
	
	@Transactional
	@Override
	public boolean remove(Long ano) {
		log.info("remove..........." + ano);
		
		attachMapper.deleteAll(ano);
		
		return mapper.delete(ano) == 1;
	}

	@Override
	public List<ArtVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ArtAttachVO> getAttachList(Long ano) {
		log.info("get Attach list by ano" + ano);
		return attachMapper.findByAno(ano);
	}

//	@Override
//	public List<ArtVO> getList() {
//		log.info("getList.............");
//		return mapper.getList();
//	}
	
	
}
