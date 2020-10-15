package org.zerock.service;

import java.util.List;

import org.zerock.domain.ArtVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryAttachVO;
import org.zerock.domain.GalleryVO;

public interface GalleryService {
	public void register(GalleryVO board);
	
	public GalleryVO get(Long gno);
	
	
	
	public boolean modify(GalleryVO board);
	
	public boolean remove(Long gno);
	
//	public List<BoardVO> getList();
	
	public List<GalleryVO> getList(Criteria cri);
	
	public List<ArtVO> getList2(Long gno);
	
	public List<GalleryAttachVO> getAttachList(Long gno);
	
	public int getTotal(Criteria cri);

	
}
