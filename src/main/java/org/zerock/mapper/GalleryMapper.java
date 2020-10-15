package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ArtVO;
//import org.apache.ibatis.annotations.Select;

import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryVO;

public interface GalleryMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<GalleryVO> getList();
	
	public List<ArtVO> getList2(Long gno);
	
	public List<GalleryVO> getListWithPaging(Criteria cri);
	
	public List<ArtVO> getListWithPaging2(Criteria cri);
	
	public void insert(GalleryVO gallery);

	public Integer insertSelectKey(GalleryVO gallery);
	
	public GalleryVO read(Long gno);
	
	

	public int delete(Long gno);

	public int update(GalleryVO gallery);

	public int getTotalCount(Criteria cri);
}
