package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.GalleryAttachVO;

import lombok.Data;

public interface GalleryAttachMapper {

	public void insert(GalleryAttachVO vo);
	
	public void delete(String fileName);
	
	public List<GalleryAttachVO> findByGno(Long gno);
	
	public void deleteAll(Long gno);
}
