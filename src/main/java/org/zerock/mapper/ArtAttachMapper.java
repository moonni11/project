package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ArtAttachVO;

public interface ArtAttachMapper {

	public void insert(ArtAttachVO vo);
	
	public void delete(String fileName);
	
	public List<ArtAttachVO> findByAno(Long ano);
	
	public void deleteAll(Long ano);
}
