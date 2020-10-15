package org.zerock.service;

import java.util.List;

import org.zerock.domain.ArtAttachVO;
import org.zerock.domain.ArtVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface ArtService {
	public void register(ArtVO art);
	
	public ArtVO get(Long ano);
	
	public boolean modify(ArtVO art);
	
	public boolean remove(Long ano);
	
//	public List<BoardVO> getList();
	
	public List<ArtVO> getList(Criteria cri);
	
	public List<ArtAttachVO> getAttachList(Long ano);
	
	public int getTotal(Criteria cri);
}
